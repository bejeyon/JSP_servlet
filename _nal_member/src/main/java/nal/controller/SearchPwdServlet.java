package nal.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/SearchPwdServlet")
public class SearchPwdServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String member_id = null;
		session.setAttribute("member_id2", member_id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/changePwdForm.jsp");
		dispatcher.forward(request, response);
	}

}
