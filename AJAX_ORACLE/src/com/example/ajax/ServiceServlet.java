package com.example.ajax;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/service")
public class ServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServiceServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		//DB 처리
		ContactDao dao = ContactDao.getInstance();
		List<ContactVO> contacts = dao.getAllContacts();
		//JSON 생성
		Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd").create();
		String result = gson.toJson(contacts); //VO 객체를 String으로 변환
		
		PrintWriter writer = response.getWriter();
		writer.write(result);  
		writer.flush();
		writer.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		PrintWriter writer = response.getWriter();
		//이것을 가지고 Insert.Update, Delete 작업 구분
		String job = request.getParameter("job");
		
		int no = 0;
		String name = null;
		Date birthDate = null;
		String email = null;
		String phone = null;
		String address = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		
		if(job.equals("update") || job.equals("delete")) {
			no = Integer.parseInt(request.getParameter("no"));
		}
		
		if(job.equals("insert") || job.equals("update")) {
			name = request.getParameter("name");
			try {
				birthDate = sdf.parse(request.getParameter("birthDate"));
			} catch (ParseException e) {				
				writer.write("FAIL");
				writer.flush();
				writer.close();
				return;
			}
			email = request.getParameter("email");
			phone = request.getParameter("phone");
			address = request.getParameter("address");
		} 
		
		ContactDao dao = ContactDao.getInstance();		
		if(job.equals("insert")) {
			dao.addContact( 
					new ContactVO(no, name, birthDate, email, phone, address));
		}		
		if(job.equals("update")) {
			dao.modifyContact(
					new ContactVO(no, name, birthDate, email, phone, address));
		}		
		if(job.equals("delete")) {
			dao.removeContact(no);
		}		
		writer.write("SUCCESS");
		writer.flush();
		writer.close();
	}
}//end class
