package phdhtl.cntt.servlet;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import phdhtl.cntt.dao.taoskDAO;
import phdhtl.cntt.model.taoSKModel;
import phdhtl.cntt.util.DateSQLConvert;
import phdhtl.cntt.util.QRCodeModel;

/**
 * Servlet implementation class taoskServlet
 */
@WebServlet("/taoskServlet")
@MultipartConfig(maxFileSize = 4194304) // upload 4MB img
public class taoskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/taosk.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		// xử lý tạo sự kiện của user
		if (request.getParameter("action").equalsIgnoreCase("ADD")) {
			String tensk = request.getParameter("tensk");
			String batdau = request.getParameter("tgbatdau");
			String ketthuc = request.getParameter("tgketthuc");
			String diadiem = request.getParameter("diadiem");

			String note = request.getParameter("note");
			int soluong = Integer.parseInt(request.getParameter("soluong"));

//			Part imgPart = request.getPart("img");
//			// lấy filename
//			String fileNameImg = imgPart.getSubmittedFileName();
//			// chọn thư mục để lưu trữ
//			String folderUpload = request.getServletContext().getRealPath("views/img");
//			// tạo đường dẫn đến thư múc upload (path)
//			Path uploadPath = Paths.get(folderUpload);
//			// kiểm tra đường dẫn đến thư mục upload coi có tồn tại chưa
//			if (!Files.exists(uploadPath)) {
//				Files.createDirectories(uploadPath);
//			}
//			// ghi ( lưu) fileName tên file ( là file cần lưu vào thư mục upload) vào đường
//			// dẫn file Upload
//			imgPart.write(Paths.get(uploadPath.toString(), fileNameImg).toString());

			HttpSession session = request.getSession();

			String nguoitao = (String) session.getAttribute("user"); // lấy user từ session
			
			
			
			
			
			taoSKModel u = new taoSKModel(tensk, batdau, ketthuc, diadiem, note, nguoitao, soluong);

			taoskDAO d = new taoskDAO();
			int kq = d.insert(u);

			if (kq == 1) {
				
				
				
				request.setAttribute("alert", "Tạo sự kiện thành công");
				request.getRequestDispatcher("/views/chitietsk.jsp?tensk="+tensk+"&diadiem="+diadiem).forward(request, response);
				
			} else {
				request.setAttribute("alert", "fail");
				request.getRequestDispatcher("/views/taosk.jsp").forward(request, response);
			}
		
		}
		// xử lý sự kiện cập nhật của user 
		else if (request.getParameter("action").equalsIgnoreCase("update")) {
			int idsk =Integer.parseInt(request.getParameter("idsk"));
			String tensk = request.getParameter("tensk");
			String batdau = request.getParameter("bd");
			String ketthuc = request.getParameter("kt");
			String diadiem = request.getParameter("diadiem");
			
			HttpSession session = request.getSession();
			String nguoitao = (String) session.getAttribute("user");
			taoSKModel u = new taoSKModel(idsk,tensk,batdau,ketthuc,diadiem,nguoitao);
			taoskDAO d = new taoskDAO();
			
			int kq = d.update(u);
			
			if (kq == 1) {
				
				request.setAttribute("alert", "Cập nhật thành công");
				request.getRequestDispatcher("/views/xemthongtin.jsp").forward(request, response);
				
			} else {
				request.setAttribute("alert", "fail");
				request.getRequestDispatcher("/views/xemthongtin.jsp").forward(request, response);
			}
			
		}
	
	
	
	
	
	
	}
	
}
