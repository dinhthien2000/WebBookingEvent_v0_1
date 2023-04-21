package phdhtl.cntt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import phdhtl.cntt.dao.accountDAO;
import phdhtl.cntt.model.AccountModel;

/**
 * Servlet implementation class loginADServlet
 */
@WebServlet("/loginADServlet")
public class loginADServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/adminLogin.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String u = request.getParameter("userad");
		String p = request.getParameter("passad");
		String sql = "Select * from admin where username=? and password=?;";
		
		accountDAO d = new accountDAO();
		try {
			AccountModel acc = d.CheckLoginAD(u, p, sql);
			
			if (acc!=null) {
				
				HttpSession session = request.getSession(false);
				if (session == null) {
				    // Not created yet. Now do so yourself.
					  session = request.getSession();
					  session.setAttribute("admin", u);
					  session.setAttribute("passu", p);
					  
					
				} else {
				    // Already created.
					  session = request.getSession();
					  session.removeAttribute("admin");
					  session.removeAttribute("passu");
					  session.setAttribute("admin", u);
					  session.setAttribute("passu", p);
				}
				
				
				request.setAttribute("alert", "Đăng nhập thành công");
				request.getRequestDispatcher("views/admin.jsp").forward(request, response);
			}else {
				request.setAttribute("alert", "fail");
				request.getRequestDispatcher("views/adminLogin.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
