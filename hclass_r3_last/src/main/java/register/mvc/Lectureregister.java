package register.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import register.RegisterDAO;
import register.RegisterVO;
import reservation.lecture.LectureDAO;
import reservation.lecture.LectureVO;

@WebServlet("/register.do")
public class Lectureregister extends HttpServlet {
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

      String userId = request.getParameter("userId");
      String classCode = request.getParameter("classCode");
      
      
      if(userId == null||userId =="" || userId.equals("null") || userId.isEmpty()) {
         out.println("<script>alert('로그인 후 수강해주세요.');history.back();</script>"); 
          out.close();
          return;
      }
      

       RegisterVO vo = new RegisterVO(); 
       RegisterDAO dao = new RegisterDAO();
       
       vo.setUserId(userId);
       vo.setClassCode(classCode);
       
       
       LectureVO lvo = new LectureVO();
       LectureDAO ldao = new LectureDAO();
       
       lvo = ldao.lectureDetail(classCode);
       
       int cnt = lvo.getLpeople();
       System.out.println(cnt);
       
     
       int ful = dao.countHistory(vo);
       if(ful > 0) {
          out.println("<script>alert('이미 수강신청된 강의입니다.');history.back();</script>"); 
          
          out.close();
          return;
       }else if(dao.countHistoryAll(vo) == cnt) {

          out.println("<script>alert('수강인원이 모두 찬 강의입니다.');history.back();</script>"); 
          
          out.close();
          return;
       } else if(ful==0){
          out.println("<script>alert('수강신청되었습니다. 등록내역을 확인해주세요.');history.back();</script>"); 
          

          out.close();
          
       }
       
       dao.historyInsert(vo);
       
       
       response.sendRedirect("awsList.do");
   
       
       
   }//end
   
}//GuestInsert class END




