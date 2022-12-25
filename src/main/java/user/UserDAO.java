package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;	//db 접근 객체
	private PreparedStatement pstmt;
	private ResultSet rs;		//db 결과를 담는 객체
	
	// mysql 접속
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/cafe_main";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");	//mysql 접속을 도와주는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace(); //오류 발생 시 오류가 무엇인지 출력 
		}
	} 
	
	// 로그인 시도 함수
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);			// 첫번째 '?'에 매개변수로 받아온 'userID'대입
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if(rs.getString(1).equals(userPassword)) // 결과로 나온 userPassword와 접속 시도한 userPassword 비교
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 틀림
				}
				
			
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}



public int join(User user ) {
	String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, user.getUserID());
		pstmt.setString(2, user.getUserPassword());
		pstmt.setString(3, user.getUserName());
		pstmt.setString(4, user.getUserGender());
		pstmt.setString(5, user.getUserEmail());
		return pstmt.executeUpdate();
	}catch(Exception e) {
		e.printStackTrace();
	}
	return -1; //데이터베이스 오류
	}
}
