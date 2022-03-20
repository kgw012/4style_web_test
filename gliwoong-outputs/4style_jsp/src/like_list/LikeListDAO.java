package like_list;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import product.Product;

public class LikeListDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public LikeListDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/4STYLE?serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "4style";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Product> select_like_products(String user_id){
		String SQL = "SELECT * FROM like_list WHERE user_id = ?";
		ArrayList<LikeProduct> like_product_list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LikeProduct like_product = new LikeProduct();
				like_product.setUser_id(rs.getString(1));
				like_product.setProduct_num(rs.getLong(2));
				
				like_product_list.add(like_product);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		SQL = "SELECT * FROM product WHERE num = ?";
		ArrayList<Product> like_product_list2 = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(SQL);
			
			for(int i = 0; i < like_product_list.size(); i++) {
				long product_num = like_product_list.get(i).getProduct_num();
				pstmt.setLong(1, product_num);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Product product = new Product();
					product.setNum(rs.getLong(1));
					product.setKeyword(rs.getString(2));
					product.setBrand(rs.getString(3));
					product.setName(rs.getString(4));
					product.setPrice(rs.getInt(5));
					product.setSalePrice(rs.getInt(6));
					product.setDiscount_rate(rs.getInt(7));
					product.setSex(rs.getString(8));
					product.setImageUrl(rs.getString(9));
					product.setLink(rs.getString(10));
					
					like_product_list2.add(product);
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return like_product_list2;
	}
	
}
