package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ProductDAO() {
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
	
	public ArrayList<Product> select_products(String keyword) {
		String SQL = "SELECT * FROM PRODUCT WHERE keyword = ?";
		ArrayList<Product> product_list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
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
				
				product_list.add(product);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return product_list;
		
	}

}
