package usermadang.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import usermadang.board.model.*;

/**
 * Servlet implementation class BoardPlease
 */
@WebServlet("/BoardPlease.please")
public class BoardPlease extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);	// doGet으로 오는 모든 request와 response 객체를 doPost로 전달.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
		
		response.setContentType("text/html; charset=utf-8");	// 부적
		request.setCharacterEncoding("utf-8");	// 부적
		
		requestBoardUpdate(request);	// 수정 폼으로부터 받아온 정보값을 넣어 requestBoardUpdate 메소드 실행.
//		requestBoardDelete(request);
//		requestBoardWrite(request);
//		HttpSession session = request.getSession(); // 세션에 담기
////		RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
////		rd.forward(request, response);
		response.sendRedirect("./freeBoardList.do");	// 같은 값으로 새로고침하여 지속적으로 수정 시도하지 못하도록 ./freeBoardList.do로 리다이렉트
	}
	
	public void requestBoardUpdate(HttpServletRequest request){
		
		int articleno = Integer.parseInt(request.getParameter("articleno"));	// 수정할 글번호 받아옴.
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));	// 목록으로 가기 시 기존 페이지로 가기 위해 pageIndex 또한 저장.
		
		FreeboardDAO dao = FreeboardDAO.getInstance();	// DAO 정적 클래스 호출.
		
		FreeboardVO board = new FreeboardVO();	// 수정할 글내용 담을 VO 객체 생성.
		board.setArticleno(articleno);	// 수정할 글번호값 VO 객체에 저장
//		board.setMember_name(request.getParameter("name"));
		board.setTitle(request.getParameter("title"));	// 수정할 글제목값 VO 객체에 저장
		board.setContent(request.getParameter("content"));	// 수정할 글내용값 VO 객체에 저장.
		
//		 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
//		 String writedate = formatter.format(new java.util.Date()); 
		 
//		 board.setHit(0);
//		 board.setWritedate(writedate);		
		
		 dao.updateArticle(board);	// 수정할 정보를 담은 VO 객체를 매개변수로 DAO의 updateArticle 메소드 실행하여 DB update.
	}

}
