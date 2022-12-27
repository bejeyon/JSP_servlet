/*작성자 문수지*/
package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 회원가입 버튼을 클릭시 나오는 페이지
@WebServlet("/selectMember.do")
public class SelectMemberForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMemberForm() {
        super();
    }
    
    // /selectMember.do servlet mapping 요청 시 연령대별 회원가입 시작 작업을 선택하는 selectMember.jsp 페이지로 이동
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/selectMember.jsp");
		dispatcher.forward(request, response);
	}
}
