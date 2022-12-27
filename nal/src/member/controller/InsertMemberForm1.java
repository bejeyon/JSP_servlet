/*작성자 문수지*/
package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 연령대별 가입절차 선택버튼 클릭 시 이용약관 동의 페이지로 이동
@WebServlet("/insertMemberForm1.do")
public class InsertMemberForm1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertMemberForm1() {
        super();
    }
    
    // /insertMemberForm1.do로 요청받아 나타나는 이용약관 동의 페이지인 member/insertMemberForm1.jsp로 이동
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/insertMemberForm1.jsp");
		dispatcher.forward(request, response);
	}

}
