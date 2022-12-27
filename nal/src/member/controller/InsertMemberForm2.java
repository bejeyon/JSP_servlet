/*작성자 문수지*/
package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 약관 동의 후 확인버튼 클릭 시 본인확인 페이지로 이동
@WebServlet("/insertMemberForm2.do")
public class InsertMemberForm2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertMemberForm2() {
        super();
    }
    
    // /insertMemberForm2.do를 요청받아 본인확인(실명인증)페이지 member/inserMemberForm2.jsp로 이동
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/insertMemberForm2.jsp");
		dispatcher.forward(request, response);
	}
}
