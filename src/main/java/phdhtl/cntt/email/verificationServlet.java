package phdhtl.cntt.email;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class verificationServlet
 */
@WebServlet("/verificationServlet")
public class verificationServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userVeri = request.getParameter("userVeri"); // láy mã từ input user nhập
		HttpSession session = request.getSession(); 
		String key = (String) session.getAttribute("verification") ; // lấy mã xác thực khi gửi mail lưu trên Session
		
		// so sánh 
		if (userVeri.equalsIgnoreCase(key)) { 
			session.removeAttribute("verification");
			request.getRequestDispatcher("/views/home.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
