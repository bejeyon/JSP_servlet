/* 작성자 배재연 */
package usermadang.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import usermadang.board.model.*;

@WebServlet("*.do")	// .do로 오는 모든 서블릿 mapping uri 요청을 해당 클래스로 받음.
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 10;	// 한 페이지당 출력할 글의 개수를 상수값으로 설정.

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);	// doGet으로 오는 모든 request와 response 객체를 doPost로 전달.
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();	// request 객체로부터 요청된 URI 문자열을 받아옴.
		String contextPath = request.getContextPath();	// 요청된 URI에서 ContextPath에 해당하는 문자열만 받아옴.
		String command = RequestURI.substring(contextPath.length());	// ContextPath를 제외한 뒷부분의 servlet mapping uri 문자열값만 substring하여 command 변수에 저장.
		
		response.setContentType("text/html; charset=utf-8");	// 부적
		request.setCharacterEncoding("utf-8");	// 부적
		
		// command 변수값에 따라 else if문으로 상황별 분기
		if (command.equals("/freeBoardList.do")) {//등록된 글 목록 페이지 출력하기
				requestBoardList(request);	// 등록된 글 목록 가져와 request 객체에 저장하는 메소드 호출
				RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_list.jsp");	// ./freeboard/freeboard_list.jsp 페이지에 전달할 RequestDispatcher 생성
				rd.forward(request, response);	// 포워딩
		} else if (command.equals("/freeBoardForm.do")) { // 글 등록 페이지 출력하기
				requestLoginName(request);	// 세션ID로부터 인증된 사용자명 가져와 request 객체에 저장하는 메소드 호출
				RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_writeform.jsp");	// ./freeboard/freeboard_writeform.jsp 페이지에 전달할 RequestDispatcher 생성
				rd.forward(request, response);	// 포워딩
		} else if (command.equals("/freeBoardUpdate.do")) { // 글 수정 페이지 출력하기
				requestLoginName(request);	// 세션ID로부터 인증된 사용자명 가져와 request 객체에 저장하는 메소드 호출
				requestBoardView(request);	// 폼 입력 양식에 담을 수정전 글의 정보값을 가져옴.
				RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_rewriteform.jsp");	// ./freeboard/freeboard_rewriteform.jsp 페이지에 전달할 RequestDispatcher 생성
				rd.forward(request, response);	// 포워딩
		} else if (command.equals("/freeboardProc.do")) {// 새로운 글 등록하기
				requestBoardWrite(request);	// 새로운 글을 DB에 insert하는 메소드 호출
//				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
//				rd.forward(request, response);						
				HttpSession session = request.getSession(); // 세션에 담기
				response.sendRedirect("./freeBoardList.do");	// 새로고침으로 글입력 지속적으로 시도하지 못하게 리다이렉트
		} else if (command.equals("/freeBoardDetail.do")) {//선택된 글 상세 페이지 가져오기
				requestBoardView(request);	// 선택된 글의 상세 정보를 가져와 request 객체에 저장하는 메소드 호출
				RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");	// /BoardView.do에 전달할 RequestDispatcher 생성
				rd.forward(request, response);	// 포워딩
		} else if (command.equals("/BoardView.do")) { //글 상세 페이지 출력하기
				RequestDispatcher rd = request.getRequestDispatcher("./freeboard/freeboard_detail.jsp");	// ./freeboard/freeboard_detail.jsp 페이지에 전달할 RequestDispatcher 생성
				rd.forward(request, response);	// 포워딩
		} else if (command.equals("/updateFreeboardProc.do")) { // 글 수정하기
//				requestBoardUpdate(request);
				requestBoardDelete(request);
				requestBoardWrite(request);
				HttpSession session = request.getSession(); // 세션에 담기
//				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
//				rd.forward(request, response);
				response.sendRedirect("./freeBoardList.do");
		}else if (command.equals("/delFreeboardProc.do")) { //선택된 글 삭제하기
				requestBoardDelete(request);	// 선택된 글의 DB deletion값을 1로 변경하는 메소드 호출
				RequestDispatcher rd = request.getRequestDispatcher("/freeBoardList.do");	// /freeBoardList.do에 전달할 RequestDispatcher 생성
				rd.forward(request, response);	// 포워딩
		} 
	}
	//등록된 글 목록 가져오기	
	public void requestBoardList(HttpServletRequest request){
			
		FreeboardDAO dao = FreeboardDAO.getInstance();	// DAO 정적 클래스 호출.
		List<FreeboardVO> boardlist = new ArrayList<FreeboardVO>();	// 출력할 글 목록을 담을 List<FreeboardVO> 변수 생성.
		
	  	int pageIndex=1;	// 페이지값은 기본적으로 1페이지.
		int limit=LISTCOUNT;	// 한 페이지당 출력될 글 개수 제한
		
		if(request.getParameter("pageIndex")!=null)	// 요청된 페이지값이 null이 아니면
			pageIndex=Integer.parseInt(request.getParameter("pageIndex"));	// requset 객체를 통해 전달된 페이지값으로 설정.
				
		String searchKeyCode = request.getParameter("searchKeyCode");	// request 객체를 통해 검색 코드 받아와 저장.
		String searchKeyWord = request.getParameter("searchKeyWord");	// request 객체를 통해 검색 키워드 받아와 저장.
		
		int total_record=dao.getTotalArticleListCount(searchKeyCode, searchKeyWord);	// 해당 검색 코드 및 키워드값을 통해 얻어낸 총 게시글 개수를 받아와 저장.
		boardlist = dao.getTotalArticleList(pageIndex, limit, searchKeyCode, searchKeyWord);	// 해강 검색 코드 및 키워드값, 페이지 번호에 해당하는 게시글(10개 이하)을 상기에서 선언한 List<FreeboardVO>형 변수에 담음.
		
		int total_page;	// 총 페이지 담을 변수 선언.
		
		if (total_record % limit == 0){	// 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 나머지가 0으로 몫이 딱 맞아 떨어질 경우.
	     	total_page =total_record/limit;	// 총 페이지는 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 값.
	     	Math.floor(total_page); 
		}
		else{	// 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 나머지가 0이 아닐 경우.
		   total_page =total_record/limit;
		   Math.floor(total_page);
		   total_page =  total_page + 1;	// 총 페이지는 총 게시글 수에서 페이지당 출력될 글 개수로 나눈 몫 + 1.
		}
   
   		request.setAttribute("pageIndex", pageIndex);	// request 객체에 저장
   		request.setAttribute("total_page", total_page);	// request 객체에 저장
		request.setAttribute("total_record",total_record);	// request 객체에 저장
		request.setAttribute("searchFreeBoardVO", boardlist);	// request 객체에 저장
		request.setAttribute("searchKeyCode", searchKeyCode);	// request 객체에 저장
		request.setAttribute("searchKeyWord", searchKeyWord);	// request 객체에 저장
	}
	//인증된 사용자명 가져오기
	public void requestLoginName(HttpServletRequest request){
					
		String member_id = request.getParameter("member_id");	// request 객체로부터 사용자명 파라미터값 받아옴.
		
		FreeboardDAO  dao = FreeboardDAO.getInstance();	// DAO 정적 클래스 호출.
		
		String member_name = dao.getLoginNameById(member_id);	// DAO의 getLoginNameById 메소드를 통해 사용자 이름 받아옴.
		
		request.setAttribute("member_name", member_name);	// request 객체에 사용자 이름 저장.
	}
	// 새로운 글 등록하기
	public void requestBoardWrite(HttpServletRequest request){
					
		FreeboardDAO dao = FreeboardDAO.getInstance();	// DAO 정적 클래스 호출.
		
		FreeboardVO board = new FreeboardVO();	// 새로운 글 정보 담을 VO 객체 생성.
		board.setMember_id(request.getParameter("member_id"));	// request 객체로부터 글작성자 ID값 불러와 VO 객체에 저장.
//		board.setMember_name(request.getParameter("member_name"));
		board.setTitle(request.getParameter("title"));	// request 객체로부터 작성할 글제목값 불러와 VO 객체에 저장.
		board.setContent(request.getParameter("contents"));	// request 객체로부터 작성할 글내용값 불러와 VO 객체에 저장.
		
		System.out.println(request.getParameter("member_id"));
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("contents"));
//		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
//		String writedate = formatter.format(new java.util.Date()); 
		
//		board.setHit(0);
//		board.setWritedate(writedate);
		
		dao.insertArticle(board);	// DAO의 insertArticle 메소드에 해당 VO객체 매개변수로 전달하여 DB에 해당 글 내용 insert.
	}
	//선택된 글 상세 페이지 가져오기
	public void requestBoardView(HttpServletRequest request){
					
		FreeboardDAO dao = FreeboardDAO.getInstance();	// DAO 정적 클래스 호출.
		int articleno = Integer.parseInt(request.getParameter("articleno"));	// 상세페이지 출력할 글의 글번호 request 객체로부터 받아옴.
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));	// 목록으로 가기 시 기존 페이지로 가기 위해 pageIndex 또한 저장.
		
		String searchKeyCode = request.getParameter("searchKeyCode");	// request 객체를 통해 검색 코드 받아와 저장.
		String searchKeyWord = request.getParameter("searchKeyWord");	// request 객체를 통해 검색 키워드 받아와 저장.
		
		FreeboardVO board = new FreeboardVO();	// 저장돼 있는 글의 상세 내용을 담을 VO 객체 생성.
		FreeboardVO beforeboard = new FreeboardVO();	// 상세 내용이 출력되는 글의 이전글을 담을 VO 객체 생성.
		FreeboardVO afterboard = new FreeboardVO();	// 상세 내용이 출력되는 글의 다음글을 담을 VO 객체 생성.
		board = dao.getArticleByArticleno(articleno, pageIndex);	// DAO의 getArticleByArticleno 메소드를 통해 받아온 게시글의 정보를 위에서 선언한 VO 객체에 담음.
		int beforeArticleno = dao.getBeforeArticleno(articleno, searchKeyCode, searchKeyWord);	// 상세 내용이 출력되는 글의 이전글번호를 int형 변수에 저장.
		if(beforeArticleno != 0) {	// 이전글이 존재하면
			beforeboard = dao.getArticleByArticleno(beforeArticleno, pageIndex);	// 이전글의 상세 내용을 이전글 VO 객체에 저장.
		}
		int afterArticleno = dao.getAfterArticleno(articleno, searchKeyCode, searchKeyWord);	// 상세 내용이 출력되는 글의 다음글번호를 int형 변수에 저장.
		if(afterArticleno != 0) {	// 다음글이 존재하면
			afterboard = dao.getArticleByArticleno(afterArticleno, pageIndex);	// 다음글의 상세 내용을 다음글 VO 객체에 저장.
		}
		
//		dao.updateHit(articleno);
		
		request.setAttribute("articleno", articleno);	// request 객체에 저장
   		request.setAttribute("pageIndex", pageIndex);	// request 객체에 저장
   		request.setAttribute("FreeBoardVO", board);	// request 객체에 저장
   		request.setAttribute("beforeno", beforeArticleno);	// request 객체에 저장
   		request.setAttribute("afterno", afterArticleno);	// request 객체에 저장
   		if(beforeArticleno != 0) {	// 이전글이 존재하면
   			request.setAttribute("beforeboard", beforeboard);	// 이전글 내용 request 객체에 저장
		}
		if(afterArticleno != 0) {	// 다음글이 존재하면
			request.setAttribute("afterboard", afterboard);	// 다음글 내용 request 객체에 저장
		}
//   	request.setAttribute("searchKeyCode", searchKeyCode);
//		request.setAttribute("searchKeyWord", searchKeyWord);
	}
	//선택된 글 내용 수정하기
	public void requestBoardUpdate(HttpServletRequest request){
					
		int articleno = Integer.parseInt(request.getParameter("articleno"));
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));	
		
		FreeboardDAO dao = FreeboardDAO.getInstance();	// DAO 정적 클래스 호출.
		
		FreeboardVO board = new FreeboardVO();		
		board.setArticleno(articleno);
//		board.setMember_name(request.getParameter("name"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("contents"));		
		
//		 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
//		 String writedate = formatter.format(new java.util.Date()); 
		 
//		 board.setHit(0);
//		 board.setWritedate(writedate);		
		
		 dao.updateArticle(board);								
	}
	//선택된 글 삭제하기
	public void requestBoardDelete(HttpServletRequest request){
					
		int articleno = Integer.parseInt(request.getParameter("articleno"));	// 삭제할 글번호 받아옴.
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));	// 목록으로 가기 시 기존 페이지로 가기 위해 pageIndex 또한 저장.
		
		FreeboardDAO dao = FreeboardDAO.getInstance();	// DAO 정적 클래스 호출.
		dao.deleteArticle(articleno);	// 삭제할 글번호를 매개변수로 넣어 DAO의 deleteArticle 메소드 호출하여 해당 글의 DB deletion 값을 0에서 1로 만듦.
	}	
}
