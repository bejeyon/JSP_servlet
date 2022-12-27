/*작성자 문수지*/
package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberDAO;

// 로그인 화면에서 비밀번호 변경 버튼을 바로 누를 경우 정보입력을 받는 페이지의 서블릿
@WebServlet("/searchPwdForm.do")
public class SearchPwdFormServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/searchPwdForm.jsp");
		dispatcher.forward(request, response);
	}
	
	// 입력한 정보와 DB에 존재하는 member_id 정보가 일치할 경우를
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String url = "member/searchPwdForm.jsp";	// 실패 시 이동할 페이지(jsp)를 url 변수에 저장
		
		// searchIdPwdForm.jsp 폼에서 입력한 회원 정보 얻어옴
		String member_name = request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		String member_birthdate = request.getParameter("member_birthyear")+request.getParameter("member_birthmonth")+request.getParameter("member_birthday");
		
		MemberDAO mDao = MemberDAO.getInstance();
		// searchId() 메소드를 통해 searchIdPwdForm.jsp 폼에서 입력한 정보와 일치하는 member_id를 찾음 
		String member_id = mDao.searchId(member_name, member_email, member_birthdate);
		int result;
		
		if (member_id!=null) { // 일치하는 member_id가 있을 경우
			result = 1;
			url = "member/changePwdForm.jsp"; //성공 시 이동할 페이지 url 변수에 저장
		} else { // 일치하는 member_id가 없을 경우
			result = -1;
		}
		
		// 세션 객체 생성
		HttpSession session = request.getSession();
		// searchId() 메소드를 통해 찾은 member_id 값을 세션에 저장
		// 아이디 찾기 후 바로 비밀번호 변경 버튼을 누를 경우 member_id를 SearchPwdServlet에서 세션값에 저장 후
		// ChangePwdServlet에서 세션 값을 불러오기 때문에 로그인 창에서 비밀번호 변경 버튼을 누를 경우의 아이디 값도 세션에 저장
		session.setAttribute("member_id", member_id);
		request.setAttribute("result", result);
		
		// id값 가져왔는지 확인
		//System.out.println("searchPwdFormSerlvet member_id : "+member_id);
		//System.out.println(session.getAttribute(member_id));
		
		// DB에서 해당하는 정보 찾기 성공 시와 실패 시에 따라 포워딩이 되는 url이 달라짐
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
