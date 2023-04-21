package phdhtl.cntt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import phdhtl.cntt.dao.adminDAO;

import phdhtl.cntt.model.taoSKModel;

/**
 * Servlet implementation class adminSKServlet
 */
@WebServlet("/adminSKServlet")
public class adminSKServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		taoSKModel u = null;
		adminDAO d = new adminDAO();
		int kq = 0;

		switch (request.getParameter("action")) {
		case "update":
			int id = Integer.parseInt(request.getParameter("idsk"));
			String tensk = request.getParameter("tensk");
			String diadiem = request.getParameter("diadiem");
			String bd = request.getParameter("bd");
			String kt = request.getParameter("kt");
			String nguoitao = request.getParameter("nguoitao");
			int soluong = Integer.parseInt(request.getParameter("soluong"));
			String note = request.getParameter("note");
				
			u = new taoSKModel(id, tensk, bd, kt, diadiem, note, nguoitao, soluong);
			kq = d.updateSK(u);
			if (kq == 1) {
				request.setAttribute("alert", "Cập nhật thành công");
			} else {
				request.setAttribute("alert", "fail");
			}
			break;
		case "delete":
			
			int idD = Integer.parseInt(request.getParameter("idsk"));
			String tenskD = request.getParameter("tensk");
			kq = d.deleteSK(idD,tenskD);
			if (kq == 1) {
				request.setAttribute("alert", "Xóa thành công");
			} else {
				request.setAttribute("alert", "fail");
			}
			
			break;
		default:
			break;
		}
		
		
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

}
