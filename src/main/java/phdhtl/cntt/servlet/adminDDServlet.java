package phdhtl.cntt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import phdhtl.cntt.dao.adminDAO;
import phdhtl.cntt.model.diadiemModel;
import phdhtl.cntt.util.getFileName;

/**
 * Servlet implementation class adminDDServlet
 */
@WebServlet("/adminDDServlet")
@MultipartConfig(maxFileSize = 4194304) // upload 4MB img
public class adminDDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		diadiemModel u = null;
		adminDAO d = new adminDAO();
		int kq = 0;

		switch (request.getParameter("action")) {
		case "ADD":
			String tenpI = request.getParameter("tenp");

			Part imgPart = request.getPart("img");

			String fileNameImg = getFileName.imgFileName(imgPart, request);

			u = new diadiemModel(tenpI, fileNameImg);

			kq = d.insertDD(u);
			if (kq == 1) {
				request.setAttribute("alert", "Thêm địa điểm thành công");

			} else {
				request.setAttribute("alert", "fail");
			}

			break;

		case "update":

			Part imgPart2 = request.getPart("img");

			if (imgPart2.getSize() <= 0) {
				String tenpU = request.getParameter("tenp");
				String imgName = request.getParameter("imgname"); // add thì ẩn khi update thì lấy name của cái ẩn ( vì nếu giữ nguyên ảnh, còn thay đổi ảnh thì có path rồi )
				int id = Integer.parseInt(request.getParameter("iddd"));

				u = new diadiemModel(id, tenpU, imgName);

				kq = d.updateDD(u);

				if (kq == 1) {
					request.setAttribute("alert", "Cập nhật địa điểm thành công");
				} else {
					request.setAttribute("alert", "fail");
				}

				/*
				 * request.getRequestDispatcher("/views/test.jsp").forward(request, response);
				 */

			} else {
				String tenpU = request.getParameter("tenp");
				int id = Integer.parseInt(request.getParameter("iddd"));

				String imgFileName = getFileName.imgFileName(imgPart2, request);

				u = new diadiemModel(id, tenpU, imgFileName);
				kq = d.updateDD(u);
				if (kq == 1) {
					request.setAttribute("alert", "Cập nhật địa điểm thành công");
				} else {
					request.setAttribute("alert", "fail");
				}

			}

			break;

		case "delete":
			int id = Integer.parseInt(request.getParameter("iddd"));
			u = new diadiemModel(id);
			kq = d.deleteDD(id);
			if (kq == 1) {
				request.setAttribute("alert", "Xóa địa điểm thành công");
			} else {
				request.setAttribute("alert", "fail");
			}
			

		default:
			break;
		}

		request.getRequestDispatcher("/views/admin.jsp#dd").forward(request, response);
	}

}
