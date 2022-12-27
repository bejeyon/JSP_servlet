/*작성자 문수지*/
package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.MemberDAO;

// 아이디 찾기 서블릿
@WebServlet("/searchIdPwdForm.do")
public class SearchIdServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/searchIdPwdForm.jsp");
		dispatcher.forward(request, response);
	}
	
	// 아이디 찾기
	// DAO의 메소드를 통해 폼에 입력한 이름, 이메일, 생년월일로 해당하는 아이디 값 찾음
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		// 한글이 깨지지 않도록 인코딩 설정
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		// 실패 시 이동할 페이지(jsp)를 url 변수에 저장
		String url = "member/searchIdPwdForm.jsp";	
		
		// searchIdPwdForm.jsp 폼에 입력한 회원 정보 얻어옴
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		String member_birthdate = request.getParameter("member_birthyear")+request.getParameter("member_birthmonth")+request.getParameter("member_birthday");
		
		MemberDAO mDao = MemberDAO.getInstance();
		// searchId() 메소드를 호출해 DB와 비교하여 입력한 정보와 일치하는 member_id 찾음
		String member_id = mDao.searchId(member_name, member_email, member_birthdate);
		int result;
		
		if (member_id!=null) {	// 회원정보와 일치하는 member_id 값이 있을 경우 1 리턴
			result = 1;
			url = "member/searchIdPwdProc.jsp"; //성공 시 이동할 페이지 url 변수에 저장
		} else {	// member_id 값이 없을 경우 -1 리턴
			result = -1;
		}
		
		// member_id와 searchId() 메소드 결과값을 실어보냄 
		request.setAttribute("member_id", member_id);
		request.setAttribute("result", result);
		
		// System.out.println(member_id+"아이디찾기아이디");
		
		// 아이디 찾기 성공 시와 실패 시에 따라 포워딩이 되는 url이 달라짐
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
