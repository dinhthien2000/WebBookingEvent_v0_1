package phdhtl.cntt.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import phdhtl.cntt.dao.accountDAO;
import phdhtl.cntt.model.AccountModel;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
// đăng ký tài khoản
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public registerServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/register.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("action").equalsIgnoreCase("Register")) {
			String hoten = request.getParameter("hoten");
			String user= request.getParameter("user");
			String pass = request.getParameter("pass");
			String email = request.getParameter("email");
			String sdt = request.getParameter("sdt");
			boolean gt = Boolean.parseBoolean( request.getParameter("gioitinh"));
			
			accountDAO a= new accountDAO();
			try {
				int kq = a.registerAccount(hoten, sdt, email, gt, user, pass);
				if (kq==1) {
					
					HttpSession session = request.getSession(false);
					if (session == null) {
					    // Not created yet. Now do so yourself.
						  session = request.getSession();
						  session.setAttribute("user", user);
						  session.setAttribute("pass", pass);
						  
						
					} else {
					    // Already created.
						  session = request.getSession();
						  session.removeAttribute("user");
						  session.removeAttribute("pass");
						  session.setAttribute("user", user);
						  session.setAttribute("pass", pass);
					}
					
					request.setAttribute("alert", "Đăng ký thành công");
					request.getRequestDispatcher("/views/homeB.jsp").forward(request, response);
				}
				else {
					request.setAttribute("alert", "fail");
					request.getRequestDispatcher("/views/register.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
		}else if (request.getParameter("action").equalsIgnoreCase("update")) {
			int iduser = Integer.parseInt(request.getParameter("iduser"));
			String hote = request.getParameter("hoten");
			String sdt = request.getParameter("sdt");
			String email = request.getParameter("email");
			boolean gt = Boolean.parseBoolean( request.getParameter("gioitinh"));
			
			AccountModel u = new AccountModel(iduser,hote,sdt,email,gt);
			
			accountDAO d = new accountDAO();
			
			int kq = d.infoUpdate(u);
			
			if (kq==1) {
				request.setAttribute("alert", "Cập nhât thành công");
				request.getRequestDispatcher("/views/xemthongtin.jsp").forward(request, response);
			}else {
				request.setAttribute("alert", "fail");
				request.getRequestDispatcher("/views/xemthongtin.jsp").forward(request, response);
			}
			
		}

		
		
		
		
	}

}
