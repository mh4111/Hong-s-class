package reservation.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import register.HistoryVO;
import register.RegisterDAO;



@WebServlet("/historyList.do")
public class RegisterList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}//end

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String hid = (String) request.getParameter("hid");
		if(hid==null || hid=="" || hid.equals("")){
			hid="";
		}
		
		String skey=request.getParameter("keyfield");
		String sval=request.getParameter("keyword");
		
		if(skey==null || skey=="" || sval==null || sval=="" || sval.equals("")){
			skey="c.c_title"; sval="" ;
		}
		
		String sqry = " where " + skey + " like '%"+ sval + "%'  " ;
		String returnpage="&keyfield="+ skey+"&keyword="+sval;
		
		String  pnum=request.getParameter("pageNum"); // <a href=awsList.do?pageNum=17>[17]</a>
		if(pnum==null || pnum=="" || pnum.equals("")){ pnum="1"; }
		int pageNUM=Integer.parseInt(pnum);

		int start = (pageNUM-1)*10+1 ; 
		int end = (pageNUM*10) ; 
		 
		RegisterDAO dao = new RegisterDAO();
		
		String name = dao.findName(hid);
				
		int Gtotal = dao.RegisterCountAll(hid);
		int pagecount=0, temp=0, startpage=0,endpage=0;
		 
		if(Gtotal%10==0){ pagecount = Gtotal/10; }
		else{ pagecount = (Gtotal/10)+1;  }
		temp = (pageNUM-1)%10;  
		startpage = pageNUM-temp;  
		endpage = startpage+9;     
		if(endpage>pagecount){ endpage=pagecount; } 
		
		
		List<HistoryVO> HV = (List<HistoryVO>)dao.registerSelectAll(start, end, skey, sval, hid);
		
		request.setAttribute("pageNUM", pageNUM );
		request.setAttribute("pagecount", pagecount );
		request.setAttribute("startpage", startpage );
		request.setAttribute("endpage", endpage );
		request.setAttribute("Gtotal", Gtotal);
		request.setAttribute("sqry", sqry);
		request.setAttribute("returnpage", returnpage);
		request.setAttribute("skey", skey);
		request.setAttribute("sval", sval);
		request.setAttribute("name", name);
		
		request.setAttribute("HV",HV);
		
		RequestDispatcher dis = request.getRequestDispatcher("lecture/4history.jsp");
		dis.forward(request, response); //자원넘김
		
		
		
	}//end
	
}//GuestList class END













