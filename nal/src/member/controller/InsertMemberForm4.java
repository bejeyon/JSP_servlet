/*작성자 문수지*/
package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 가입 성공 화면을 출력해주는 서블릿
@WebServlet("/insertMemberForm4.do")
public class InsertMemberForm4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertMemberForm4() {
        super();
    }

    // 회원가입 성공 시 /insertMemberForm4.do를 요청받아 환영메시지를 출력하는 member/insertMemberForm4.jsp 페이지로 포워딩
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/insertMemberForm4.jsp");
		dispatcher.forward(request, response);
	}
}
