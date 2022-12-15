package sec01.ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MemberDAO {
	private Statement stmt;
	private Connection con;
	
	public List<MemberVO> listMembers() {
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
			conDB();	// 네 가지 정보로 데이터베이스를 연결.
			String query = "select * from t_member";
			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);	// sql문으로 회원 정보를 조회
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
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;	// 조회한 레코드의 개수만큼 MemberVO 객체를 저장한 ArrayList를 반환.
	}
	
	private void conDB() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Oracle 드라이버 로딩 성공");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "scott", "tiger");
			System.out.println("Connection 생성 성공");
			stmt = con.createStatement();
			System.out.println("Statement 생성 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
