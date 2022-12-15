package sec02.ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();	// JNDI에 접근하기 위해 기본 경로(java:/comp/env)를 지정.
			Context envContext = (Context) ctx.lookup("java:/comp/env");	// JNDI에 접근하기 위해 기본 경로(java:/comp/env)를 지정.
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");	// 톰캣 context.xml에 설정한 name 값인 jdbc/oracle을 이용해 톰캣이 미리 연결한 DataSource를 받아옴.
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberVO> listMembers() {
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
//			conDB();	// 네 가지 정보로 데이터베이스를 연결.
			con = dataFactory.getConnection();	// DataSource를 이용해 데이터베이스에 연결.
			String query = "select * from t_member";
			System.out.println("preparedStatement : " + query);
			pstmt = con.prepareStatement(query);	// prepareStatement() 메서드에 SQL문을 전달해서 PreparedStatement 객체를 생성.
			System.out.println("PreparedStatement 생성 성공");
			ResultSet rs = pstmt.executeQuery(query);	// executeQuery() 메서드를 호출해 미리 설정한 SQL문을 실행.
			while (rs.next()) {
				// 조회한 레코드의 각 컬럼 값을 받아옴.
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joindate");
				
				// 각 칼럼 값을 다시 MemberVO 객체의 속성에 설정.
				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
				vo.setJoinDate(joinDate);
				
				// 설정된 MemberVO 객체를 다시 ArrayList에 저장
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
//	private void conDB() {
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			System.out.println("Oracle 드라이버 로딩 성공");
//			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "scott", "tiger");
//			System.out.println("Connection 생성 성공");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
}
