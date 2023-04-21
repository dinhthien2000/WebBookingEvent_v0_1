package phdhtl.cntt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import phdhtl.cntt.dao.adminDAO;

/**
 * Servlet implementation class adminTGServlet
 */
@WebServlet("/adminTGServlet")
public class adminTGServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		adminDAO d = new adminDAO();
		int id =Integer.parseInt( request.getParameter("idtg"));
		int kq =0;
		
		switch (request.getParameter("action")) {
		
		case "update":
			
			String tensk = request.getParameter("tensktg");
			String bdtg = request.getParameter("bdtg");
			String kttg = request.getParameter("kttg");
			String diadiemtg = request.getParameter("diadiemtg");
			String nguoitaotg = request.getParameter("nguoitaotg");
			String hotentg = request.getParameter("hotentg");
			String mssv  = request.getParameter("mssv");
			String sdt  = request.getParameter("sdt");
			String email = request.getParameter("email");
			
			kq = d.updateTG(tensk, bdtg, kttg, diadiemtg, nguoitaotg, hotentg, mssv, sdt, email, id);
			if(kq==1) {
				request.setAttribute("alert", "Cập nhật tham gia thành công");
			}else {
				request.setAttribute("alert", "fail");
			}
			break;

		default:
			
			
			kq = d.deleteTGK(id);
			if(kq==1) {
				request.setAttribute("alert", "Xóa tham gia thành công");
			}else {
				request.setAttribute("alert", "fail");
			}
			
			break;
		}
		
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

}
