package register.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;

import register.RegisterDAO;
import register.RegisterVO;
import reservation.lecture.LectureDAO;
import reservation.lecture.LectureVO;

@WebServlet("/lecturedelete.do")
public class Lecturedelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String hcode = request.getParameter("hcode");
		
		RegisterDAO dao = new RegisterDAO();
		
		dao.RegisterDelete(hcode);
	    
	    System.out.println("lecturedelete.do끝--------------------------------------");
	 	
	    response.sendRedirect("historyList.do");
	
	 	
	 	
	}//end
	
}//GuestInsert class END





