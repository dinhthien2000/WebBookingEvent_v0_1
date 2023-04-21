package phdhtl.cntt.dao;

import java.net.http.HttpRequest;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import phdhtl.cntt.model.taoSKModel;
import phdhtl.cntt.util.DateSQLConvert;
import phdhtl.cntt.util.QRCodeModel;
import phdhtl.cntt.util.connect;
import phdhtl.cntt.util.deleteFile;


// user 
public class taoskDAO {
	private static final String insert = "insert into taosukien ( tensk,tgbatdau,tgketthuc,diadiem,img,note,qr,nguoitao,soluongcothethamgia) "
			+ "values(?,?,?,?,?,?,?,?,?);";
	private static final String update = "update taosukien set tensk=?,tgbatdau=?,tgketthuc=?,diadiem=?,qr=? where idsk=?;";
	private static final String delete = "delete form taosukien where =?";
	
	
	
	Connection connection =connect.getConnection();
	
	public int insert(taoSKModel u) {
		
		try {
			
			Date bd= DateSQLConvert.dateSQL(u.getTgbatdau());
			Date kt= DateSQLConvert.dateSQL(u.getTgketthuc());
			
			String img = img(u.getDiadiem()); // lấy hình địa điểm từ chọn địa điểm ( input)
			String qr = QRCodeModel.createQR(u.getTensk(), u.getTgbatdau(), u.getTgketthuc(),  u.getDiadiem(), u.getNguoitao()); // tạo mã qr
			PreparedStatement preparedStatement = connection.prepareStatement(insert);
	
			preparedStatement.setString(1, u.getTensk());
			preparedStatement.setDate(2, bd);
			preparedStatement.setDate(3,kt);
			preparedStatement.setString(4, u.getDiadiem());
			preparedStatement.setString(5,img);
			preparedStatement.setString(6, u.getNote());
			preparedStatement.setString(7, qr);
			preparedStatement.setString(8, u.getNguoitao());
			preparedStatement.setInt(9, u.getSoluongnguoithamgia());
			
			int kq = preparedStatement.executeUpdate();
			return kq;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
		
	}
	// lấy hình ảnh từ tên phòng trong bảng địa điểm
	public  String img (String tenp) {
		String sql = "select *from noitochuc where tenp=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, tenp);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				
				return rs.getString("img"); // trả hình ảnh bằng tên phòng
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	// đổi địa điểm đổi hình khi user đổi địa điểm tổ chức
	public void imgDiaDiem(String diadiem,int id) {
		String getImg = img(diadiem); // lấy tên hình từ hàm sau khi truy vấn điều kiện là tên địa điểm
		String sql = "update taosukien set img =? where idsk=?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, getImg);
			preparedStatement.setInt(2, id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	
	
	
	
	// cập nhật sự kiện của user
	public int  update(taoSKModel us) {
		
		try {
			Date bd= DateSQLConvert.dateSQL(us.getTgbatdau());
			Date kt= DateSQLConvert.dateSQL(us.getTgketthuc());
			
			// lúc này tên sự kiện trong csdl chưa đổi nên lấy ra để xóa
			String ten = QRCodeModel.updateTen(us.getIdsk()); // lấy tên sự kiện để xóa mã qr
			deleteFile.deleteF(ten); // xóa qr 
			
			// tạo qr mới
			String qr = QRCodeModel.createQR(us.getTensk(), us.getTgbatdau(), us.getTgketthuc(),  us.getDiadiem(),us.getNguoitao()); // tạo mã qr
			
			
			// cập nhật thay đổi
			PreparedStatement preparedStatement = connection.prepareStatement(update);
			preparedStatement.setString(1, us.getTensk());
			preparedStatement.setDate(2, bd);
			preparedStatement.setDate(3,kt);
			preparedStatement.setString(4, us.getDiadiem());
			preparedStatement.setString(5, qr);
			preparedStatement.setInt(6, us.getIdsk());
			
			int kq = preparedStatement.executeUpdate(); // cập nhật
			// sau khi cập nhật lấy tên phòng và truy vấn bảng tên phòng để đổi hình ảnh địa điểm phù hợp với tên phòng
			imgDiaDiem(us.getDiadiem(), us.getIdsk());
			return kq;
		
			
		
		
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public int delete(int id) {
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(delete);
			preparedStatement.setInt(1, id);
			int kq = preparedStatement.executeUpdate();
			
			return kq;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return 0;
		
	}
}
