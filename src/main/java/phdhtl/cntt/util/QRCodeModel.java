package phdhtl.cntt.util;

import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

public class QRCodeModel {
	public static String createQR(String tensk, String bd, String kt, String diadiem, String nguoitao)
			throws Exception {

		// String content =
		// "localhost:8090/test2/views/thamgia.jsp?tensk="+tensk+"&bd="+bd+"&kt="+kt+"&diadiem="+diadiem+"&nguoitao="+nguoitao;
		String content = " http://localhost:8090/test2/views/thamgia.jsp?tensk=" + tensk + "&bd=" + bd
				+ "&kt=" + kt + "&diadiem=" + diadiem + "&nguoitao=" + nguoitao;

		String tenQRSK = tensk;
		String pathToStore = "D:\\java1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\test2\\views\\img\\"
				+ tenQRSK + ".jpg";

		BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, 200, 200);
		MatrixToImageWriter.writeToPath(bitMatrix, "jpg", Paths.get(pathToStore));

		System.out.println("QR Code Generated Successfully");
		return tenQRSK + ".jpg";
	}



	// tìm tên sự kiện để xóa file ảnh
	public static String updateTen(int id) throws Exception {

		String sql = "select * from taosukien where idsk=?";
		PreparedStatement preparedStatement = connect.getConnection().prepareStatement(sql);
		preparedStatement.setInt(1, id);
		ResultSet rs = preparedStatement.executeQuery();

		while (rs.next()) {
			String ten = rs.getString("tensk");
			return ten;
		}
		return null;
	}
}
