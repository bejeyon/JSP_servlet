package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/freeboardlist.do")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 10; 

    /**
     * @see HttpServlet#HttpServlet()
     */
//    public BoardListServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see Servlet#init(ServletConfig)
//	 */
//	public void init(ServletConfig config) throws ServletException {
//		// TODO Auto-generated method stub
//	}
//
//	/**
//	 * @see Servlet#destroy()
//	 */
//	public void destroy() {
//		// TODO Auto-generated method stub
//	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
	  	int pagenum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pagenum")!=null)
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
				
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_record=dao.getListCount(items, text);
		boardlist = dao.getBoardList(pagenum, limit, items, text); 
		
		int total_pagenum;
		
		if (total_record % limit == 0){     
	     	total_pagenum =total_record/limit;
	     	Math.floor(total_pagenum);  
		}
		else{
		   total_pagenum =total_record/limit;
		   Math.floor(total_pagenum); 
		   total_pagenum =  total_pagenum + 1; 
		}		
   
   		request.setAttribute("pagenum", pagenum);		  
   		request.setAttribute("total_pagenum", total_pagenum);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("boardlist", boardlist);
	}

}
