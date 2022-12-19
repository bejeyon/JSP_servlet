package utill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/*
 * DAO class에 Singleton Design Pattern을 적용해보자!
 * 1. private 생성자
 * 2. private static 변수에 자신의 객체를 생성
 * 3. public static method(getInstance())로 공유
 */
public class GuideDAO {
	  private GuideDAO() { }//싱글턴 패턴 - 생성자에 private을 명시해 외부에서 생성하는 것을 방지한다.
	  private static GuideDAO instance = new GuideDAO(); //생성방법 class loading시 단 한 번만 실행된다.
	  public static GuideDAO getInstance() { //외부에서 사용할 수 있게 public static method를 instance로 반환한다.
	  return instance; //사용자가 서비스 받을 메서드
  }
	  
	  /* listGuide() method
	   * guide table에 있는 모든 상품 정보 list로 가져오기
	   */
	  public ArrayList<GuideVO> listGuide() {	  //GuideVO에 있는 메소드들을 데려와 listGuide로 정의 (*제네릭: 제네릭은 클래스나 메소드에서 사용할 내부 데이터 타입을 컴파일 시에 미리 지정하는 방법)
		     ArrayList<GuideVO> guideList = new ArrayList<GuideVO>();   //guideList라는 새로운 생성자 생성
		     
		     Connection conn = null; //DB 접속
		     PreparedStatement pstmt = null; //SQL구문을 전송하는 기능을 갖는 객체 PreparedStatement 사용
		                                     /*(Prestatement, Statement 객체는 SQL 쿼리의 틀을 담는 객체이다.
		                                      * Statement가 SQL 쿼리 틀을 생성하면서 값을 지정한다면,
		                                        Prestatement는 미리 생성해두고 값은 나중에 지정하는 방식이다.*/
		     
		     ResultSet rs = null; //JDBC에서  select SQL문의 결과를 담는 객체
		    
		     //try-catch 구문 : 예외처리
		     try {
			    	String sql = "select *  from nal.guide"; //Query 작성 - sql문으로 guide 데이터 전부 가져오기 Q.물음표는 어쩔 때 쓰는 것인가?
			    	conn = DBConnection.getConnection(); //DBConnection서버에 접속할 수 있는 커넥션 객체를 가져옴. 연결을 관리하는 객체를 생성한다.
			        pstmt = conn.prepareStatement(sql); //Query 저장 - pstmt에 위의 Query 저장 후 DB에 연결 준비 prepareStatement 통해서 sql 전송
			        rs = pstmt.executeQuery(); //Query 실행 - Query 실행 후 그 결과값을 rs에 저장
		      
			      while (rs.next()) { //첫번째 행 while문 : true일 경우에 계속해서 반복
			        GuideVO guideVO = new GuideVO(); 
			        guideVO.setGuide_room_code(rs.getString("guide_room_code")); 
			        guideVO.setGuide_room_name(rs.getString("guide_room_name"));
			        guideVO.setGuide_intro(rs.getString("guide_intro"));
			        guideVO.setGuide_time(rs.getString("guide_time"));
			        guideVO.setGuide_location(rs.getString("guide_location"));
					guideVO.setGuide_phonenumber(rs.getString("guide_phonenumber")); //Q.imagepath 생략했어요.
			        guideList.add(guideVO); //add()를 이용해서 guideList에 아이템을 추가하는 코드
			        
			        System.out.println(guideVO.getGuide_intro());
		
		      }
			      return guideList; 
		    } catch (Exception e) {
		      e.printStackTrace(); //예외처리: 에러의 발생근원지를 찾아서 단계별로 에러를 출력합니다.
		    }
		    return null;

	  }
	  
}// end class */