package reservation.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.lecture.LectureDAO;
import reservation.lecture.LectureVO;

@WebServlet("/awsDetail.do")
public class LectureDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String Ldata = request.getParameter("idx");
		
	    LectureVO vo = new LectureVO();  
	    LectureDAO dao = new LectureDAO();
	    
		vo = dao.lectureDetail(Ldata);
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher dis = request.getRequestDispatcher("/lecture/3detailLecture.jsp");
		dis.forward(request, response); //자원넘김
		
	}//end
	
}//GuestDetail class END
























