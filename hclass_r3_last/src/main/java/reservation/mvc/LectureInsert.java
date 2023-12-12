package reservation.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import reservation.lecture.LectureDAO;
import reservation.lecture.LectureVO;

@WebServlet("/lecture/awsInsert.do")
public class LectureInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h2>GuestInsert.java 서블릿문서</h2>");


		String path= request.getRealPath("/detailPagePicture");
		System.out.println("경로 " + path);
		int size=1024*1024*7;
		MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8");
		
	    LectureVO vo = new LectureVO(); 
	    LectureDAO dao = new LectureDAO();
	    
	    vo.setLid(mr.getParameter("lid"));
	    vo.setLname(mr.getParameter("lname"));
	    vo.setLnum(mr.getParameter("lnum1")+ mr.getParameter("lnum2")+ mr.getParameter("lnum3"));
	    vo.setLurl(mr.getParameter("lurl"));
	    vo.setLimg(mr.getFilesystemName("limg"));
	    vo.setLlocation(mr.getParameter("llocation"));
	    vo.setLtitle(mr.getParameter("ltitle"));
	    vo.setLcontents(mr.getParameter("lcontents"));
	    vo.setLsdate(mr.getParameter("lsdate"));
	    vo.setLedate(mr.getParameter("ledate"));
	    vo.setLprice(Integer.parseInt(mr.getParameter("lprice")));
	    vo.setLpeople(Integer.parseInt(mr.getParameter("lpeople")));
	    dao.lectureInsert(vo);
	    
	    System.out.println("lectureInsert끝--------------------------------------");
	 	

		response.sendRedirect("http://localhost:8080/hclass/awsList.do");
	
	 	
	 	
	}//end
	
}//GuestInsert class END





