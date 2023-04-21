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
 * Servlet implementation class login
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/login.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			accountDAO d = new accountDAO();
			String user = request.getParameter("user");
			String password = request.getParameter("pass");
			
			
			AccountModel u = d.CheckLogin(user, password);
			if (u==null) {
				
				
                request.setAttribute("alert", "fail");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                //getServletConfig().getServletContext().getRequestDispatcher("/views/login.jsp").forward(request, response);
                //response.sendRedirect("/views/login.jsp");                
                //response.sendRedirect(request.getContextPath() +"/views/login.jsp");
				
				
			}else {
				HttpSession session = request.getSession(false);
				if (session == null) {
				    // Not created yet. Now do so yourself.
					  session = request.getSession();
					  session.setAttribute("user", user);
					  session.setAttribute("pass", password);
					  
					
				} else {
				    // Already created. // đổi tài khoản khác nên xóa cái cũ
					  session = request.getSession();
					  session.removeAttribute("user");
					  session.removeAttribute("pass");
					  session.setAttribute("user", user);
					  session.setAttribute("pass", password);
				}
				//response.sendRedirect(request.getContextPath() +"/views/homePage.jsp");
				request.setAttribute("alert", "Đăng nhập thành công");
				request.getRequestDispatcher("/views/homeB.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
