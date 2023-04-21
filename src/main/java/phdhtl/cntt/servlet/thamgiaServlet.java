package phdhtl.cntt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import phdhtl.cntt.dao.thamgiaskDAO;
import phdhtl.cntt.email.emailHTML;
import phdhtl.cntt.model.thamgiaSKModel;


@WebServlet("/thamgiaServlet")
public class thamgiaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/thamgia.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tensk = request.getParameter("tensk");
		String tgbd = request.getParameter("bd");
		String tgkt = request.getParameter("kt");
		String diadiem = request.getParameter("diadiem");
		String nguoitao = request.getParameter("nguoitao");
		String hotendk = request.getParameter("hotendk");
		String  mssv =request.getParameter("mssv");
		
		String  sdt =request.getParameter("sdt");
		String email  =request.getParameter("email");
		
		
		thamgiaSKModel u = new thamgiaSKModel(tensk,tgbd,tgkt,diadiem,nguoitao,hotendk,mssv,sdt,email);
		
		thamgiaskDAO d = new thamgiaskDAO();
		
		int kq =d.insert(u);
		
		if (kq==1) {
			
			emailHTML.send(tensk, email, hotendk, tgbd, tgkt, diadiem);
			
			request.setAttribute("alert", "Đăng ký thành công");
			request.getRequestDispatcher("/views/homeB.jsp").forward(request, response);
		}else {
			request.setAttribute("alert", "fail");
			request.getRequestDispatcher("/views/thamgia.jsp").forward(request, response);
		}
		
	}

}
