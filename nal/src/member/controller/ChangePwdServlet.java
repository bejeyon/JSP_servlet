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
import member.model.MemberVO;

// 비밀번호 변경을 처리하는 서블릿
@WebServlet("/changePwdForm.do")
public class ChangePwdServlet extends HttpServlet {
	
private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/changePwdForm.jsp");
		dispatcher.forward(request, response);
	}
	
	// 비밀번호 변경
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		// 한글이 깨지지 않도록 인코딩 설정
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		// session 객체 생성
		HttpSession session = request.getSession();
		
		String member_pw = request.getParameter("member_pw"); // 폼에 입력한 새 비밀번호 값 가져옴
		String member_id = (String) session.getAttribute("member_id"); // session에 저장된 아이디 가져옴
		
		// System.out.println("pw변경서블릿 : "+member_pw);
		// System.out.println("pw변경서블릿 id:"+member_id);
		
		MemberVO mVo = new MemberVO();
		mVo.setMember_pw(member_pw); // 기존의 비밀번호
		
		MemberDAO mDao = MemberDAO.getInstance(); // DAO 객체 얻어옴
		// updatePw() 메소드를 호출해 member_id로 정보를 불러와 member_pw 값 업데이트
		mDao.updatePw(member_pw, member_id); 
		
		// member_id 값 저장
		request.setAttribute("member_id", member_id);
		
		// member/login.jsp 페이지로 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/login.jsp"); // 비밀번호를 변경할 폼으로 이동
		dispatcher.forward(request, response);
	}

}
