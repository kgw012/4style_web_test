package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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

	public int login(String user_id, String user_pwd) {
		String SQL = "SELECT user_pwd FROM USER WHERE user_id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				if(rs.getString(1).equals(user_pwd)) {
					return 1;  //login 성공
				}
				else return 0;  // pwd 불일치
			}
			else return -1;  // id가 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;  // db오류
	}
	
	public int signup(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  user.getUser_id());
			pstmt.setString(2,  user.getUser_name());
			pstmt.setString(3,  user.getUser_pwd());
			pstmt.setString(4,  user.getUser_sex());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
