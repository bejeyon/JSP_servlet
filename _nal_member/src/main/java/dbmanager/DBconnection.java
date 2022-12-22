package dbmanager;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class DBconnection {
	
	public static Connection getConnection() {
		
		Connection conn = null;
		
		try {
			// 톰캣의 환경설정 정보를 가지고 있는 객체 initCtx 생성
			Context initCtx = new InitialContext();
			// object로 반환. 다운캐스팅 필요
			// 컨텍스트 객체의 lookup 메서드 이용해 "java:comp/env"에 해당하는 객체를 찾아 envCtx에 삽입
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			// envCtx의 lookup 메서드 이용해 "jdbc/orcl"에 해당하는 객체를 찾아 ds에 삽입
			// jdbc/orcl 이름을 찾으면 이를 DataSource형으로 리턴하므로 이를 받아 DataSource 객체에 저장
			DataSource ds = (DataSource) envCtx.lookup("jdbc/orcl");
			// getConnection 메서드를 이용해 커넥션 풀로부터 커넥션 캑체를 얻어내 conn 변수에 저장
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
}
