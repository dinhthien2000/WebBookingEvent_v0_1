package phdhtl.cntt.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import phdhtl.cntt.model.diadiemModel;
import phdhtl.cntt.model.taoSKModel;
import phdhtl.cntt.util.DateSQLConvert;
import phdhtl.cntt.util.connect;
import phdhtl.cntt.util.deleteFile;


// admin
public class adminDAO {

	private static final String insertUserAD = "insert into user (hoten,sdt,email,gioitinh,username,password) values (?,?,?,?,?,?);";
	private static final String UPDATEUSERAD = "update user set hoten=?,sdt=?,email=?,gioitinh=?,username=?,password=? where iduser=?";
	private static final String DeleteUserAD = "delete from user where id=?";

	private static final String insertSKAD = "insert into taosukien ( tensk,tgbatdau,tgketthuc,diadiem,img,note,nguoitao,soluongcothethamgia)"
			+ "values(?,?,?,?,?,?,?,?);";
	private static final String updateSKAD = "update taosukien set tensk=?,tgbatdau=?,tgketthuc=?,diadiem=?,img=?,note=?,nguoitao=?,soluongcothethamgia=? where idsk=?;";
	private static final String deleteSKAD = "delete from taosukien where idsk =?";

	private static final String insertThamGiaAD_ = "insert into dangkysk(tensk,tgbatdau,tgketthuc,diadiem,nguoitao,hotendk,mssv,sdt,email) "
			+ "values (?,?,?,?,?,?,?,?,?);";
	private static final String updateThamGiaAD = "update dangkysk set tensk=?,tgbatdau=?,tgketthuc=?,diadiem=?,nguoitao=?,hotendk=?,mssv=?,sdt=?,email=? where iddk=?";
	private static final String deleteThamGiaAD = "delete from dangkysk where iddk=?";

	private static final String insertDiaDiem = "insert into noitochuc (tenp,img) values (?,?);";
	private static final String updateDiaDiem = "update noitochuc set tenp=?,img=? where iddd=?;";
	private static final String deleteDiaDiem = "delete from noitochuc where iddd=?";

	Connection connection = connect.getConnection();

//		toàn bộ sự kiện

	public int updateSK(taoSKModel u) {

		try {
			// chuyển đổi ngày
			Date bd = DateSQLConvert.dateSQL(u.getTgbatdau());
			Date kt = DateSQLConvert.dateSQL(u.getTgketthuc());

			// láy hình ảnh phòng theo địa điểm
			taoskDAO d = new taoskDAO();
			String img = d.img(u.getDiadiem());

			PreparedStatement preparedStatement = connection.prepareStatement(updateSKAD);
			preparedStatement.setString(1, u.getTensk());
			preparedStatement.setDate(2, bd);
			preparedStatement.setDate(3, kt);
			preparedStatement.setString(4, u.getDiadiem());
			preparedStatement.setString(5, img);
			preparedStatement.setString(6, u.getNote());
			preparedStatement.setString(7, u.getNguoitao());
			preparedStatement.setInt(8, u.getSoluongnguoithamgia());
			preparedStatement.setInt(9, u.getIdsk());

			int kq = preparedStatement.executeUpdate();
			return kq;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int deleteSK(int id,String tensk) {

		try {
			deleteFile.deleteF(tensk);
			PreparedStatement preparedStatement = connection.prepareStatement(deleteSKAD);
			preparedStatement.setInt(1, id);
			int kq = preparedStatement.executeUpdate();
			return kq;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	
	
	
	
	
//		thamgiask
	//tensk=?,tgbatdau=?,tgketthuc=?,diadiem=?,nguoitao=?,hotendk=?,mssv=?,sdt=?,email=? where iddk=?
	public int updateTG( String ten, String tgbd,String tgkt, String diadiem, String nguoitao,String hotendk,String mssv,String sdt,String email,int id) {

		try {
			// chuyển đổi ngày
			Date bd = DateSQLConvert.dateSQL(tgbd);
			Date kt = DateSQLConvert.dateSQL(tgkt);

			// láy hình ảnh phòng theo địa điểm
//			taoskDAO d = new taoskDAO();
//			String img = d.img(u.getDiadiem());

			PreparedStatement preparedStatement = connection.prepareStatement(updateThamGiaAD);
			preparedStatement.setString(1, ten);
			preparedStatement.setDate(2, bd);
			preparedStatement.setDate(3, kt);
			preparedStatement.setString(4, diadiem);			
			preparedStatement.setString(5, nguoitao);
			preparedStatement.setString(6,hotendk);	
			preparedStatement.setString(7, mssv);
			preparedStatement.setString(8,sdt);
			preparedStatement.setString(9,email);
			preparedStatement.setInt(10,id);

			int kq = preparedStatement.executeUpdate();
			return kq;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteTGK(int id) {

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(deleteThamGiaAD);
			preparedStatement.setInt(1, id);
			int kq = preparedStatement.executeUpdate();
			return kq;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
	
	

//	user	, user tự xử lý

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//		diadiem

	public int insertDD(diadiemModel u) {
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(insertDiaDiem);
			preparedStatement.setString(1, u.getTenp());
			preparedStatement.setString(2, u.getImg());

			int kq = preparedStatement.executeUpdate();

			return kq;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}

	public int updateDD(diadiemModel u) {
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(updateDiaDiem);
			preparedStatement.setString(1, u.getTenp());
			preparedStatement.setString(2, u.getImg()); // add thì ẩn khi update thì lấy name của cái ẩn ( vì nếu giữ nguyên ảnh, còn thay đổi ảnh thì có path rồi )
			preparedStatement.setInt(3, u.getIddd());

			int kq = preparedStatement.executeUpdate();

			return kq;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}

	public int deleteDD(int id) {
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(deleteDiaDiem);
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
