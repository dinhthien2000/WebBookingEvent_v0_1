package phdhtl.cntt.util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class getFileName {
	public static String imgFileName(Part imgPart,HttpServletRequest request) throws IOException {

		// lấy filename
		String fileNameImg = imgPart.getSubmittedFileName();
		// chọn thư mục để lưu trữ
		String folderUpload = request.getServletContext().getRealPath("views/img");
		// tạo đường dẫn đến thư múc upload (path)
		Path uploadPath = Paths.get(folderUpload);
		// kiểm tra đường dẫn đến thư mục upload coi có tồn tại chưa
		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}
		// ghi ( lưu) fileName tên file ( là file cần lưu vào thư mục upload) vào đường
		// dẫn file Upload
		imgPart.write(Paths.get(uploadPath.toString(), fileNameImg).toString());
		
		
		return fileNameImg;
	}
}
