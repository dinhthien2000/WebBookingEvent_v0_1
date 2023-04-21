package phdhtl.cntt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import phdhtl.cntt.model.AccountModel;
import phdhtl.cntt.model.taoSKModel;
import phdhtl.cntt.util.connect;

public class accountDAO {
	private static final String SelectFrom = "SELECT * FROM user WHERE 	username = ? and password = ?";
	private static final String SelectFrom1 = "insert into user (hoten,sdt,email,gioitinh,username,password) values (?,?,?,?,?,?);";
	private static final String XEMNgSUKIEN_STRING = "Select * from taosk where username=?;";
	private static final String DemNguoiThamGia_STRING = "SELECT COUNT(*) as sk FROM dangkysk WHERE  tensk=? and nguoitao=?;";
	private static final String UPDATE_INFO_STRING = "update user set hoten=?, sdt=?,email=?,gioitinh=? where iduser=?";

	Connection connection = connect.getConnection();

	// đăng nhập
	public AccountModel CheckLogin(String username, String password) throws Exception {

		PreparedStatement preparedStatement = connection.prepareStatement(SelectFrom);
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		ResultSet rs = preparedStatement.executeQuery();

		// trả về được giá trị là có tồn tại
		while (rs.next()) {
			AccountModel u = new AccountModel(rs.getString("username"), rs.getString("password"));

			return u;

//			if (username == rs.getString("username") && password == rs.getString("password")) {
//				return kq = 1;
//			} else {
//				return kq = 0;
//			}

		}
		
		// trả null là không tồn tại
		return null;

	}
	
	

	// đăng nhập
	public AccountModel CheckLoginAD(String username, String password,String sql) throws Exception {

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		ResultSet rs = preparedStatement.executeQuery();

		// trả về được giá trị là có tồn tại
		while (rs.next()) {
			AccountModel u = new AccountModel(rs.getString("username"), rs.getString("password"));

			return u;

//			if (username == rs.getString("username") && password == rs.getString("password")) {
//				return kq = 1;
//			} else {
//				return kq = 0;
//			}

		}
		
		// trả null là không tồn tại
		return null;

	}
	

	// cập nhật thông tin
	public int infoUpdate(AccountModel u) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_INFO_STRING);
			preparedStatement.setString(1, u.getHoten());
			preparedStatement.setString(2, u.getSdt());
			preparedStatement.setString(3, u.getEmail());
			preparedStatement.setBoolean(4, u.getGioitinh());
			preparedStatement.setInt(5, u.getIduser());

			int kq = preparedStatement.executeUpdate();
			return kq;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return 0;
	}

	// hàm đăng ký
	public int registerAccount(String hoten, String sdt, String email, Boolean gioitinh, String username,
			String password) throws SQLException {
		// kiểm tra username có tồn tại chưa
		// nếu null là chưa có username tồn tại , đăng ký được
		if (checkUsername(username) == null) {
			PreparedStatement preparedStatement = connection.prepareStatement(SelectFrom1);

			preparedStatement.setString(1, hoten);
			preparedStatement.setString(2, sdt);
			preparedStatement.setString(3, email);
			preparedStatement.setBoolean(4, gioitinh);
			preparedStatement.setString(5, username);
			preparedStatement.setString(6, password);
			int kq = preparedStatement.executeUpdate();

			return kq;

		}

		return 0;
	}

	// hàm kiểm tra username có tồn tại chưa
	public AccountModel checkUsername(String username) throws SQLException {
		// thực hiện câu truy vấn
		PreparedStatement preparedStatement = connection.prepareStatement("select * from user where username=?;");
		preparedStatement.setString(1, username);

		// lưu danh sách vào đối tượng ResultSet vì truy vấn trả về nhìu dòng trong bảng
		ResultSet rs = preparedStatement.executeQuery();

		// chạy vòng lặp hết danh sách
		// nếu chạy được là có tồn tại username rồi
		while (rs.next()) {
			AccountModel u = new AccountModel(rs.getString("username"));

			return u;
		}
		return null; // null là chưa tồn tại username
	}

	AccountModel u = new AccountModel();

	// ham kiem tra thong tin

//	public AccountModel info(String username) throws SQLException{
//		// thuc hien cau truy van
//		PreparedStatement preparedStatement = connection.prepareStatement("select * from custormer where username=?;");
//		preparedStatement.setString(1, username);
//		
//		// luu vao resultset 
//		ResultSet rs  = preparedStatement.executeQuery();
//		
//		// chay danh sach 
//		while (rs.next()) {
//			 u = new AccountModel(rs.getString("username"),rs.getString("password"),rs.getString("email"));
//			return u;
//		}
//		return u;
//	}

	// đếm số lượng tham gia
	public int countSL(String tensk,String username) {
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(DemNguoiThamGia_STRING);
			preparedStatement.setString(1, tensk);
			preparedStatement.setString(2, username);
			ResultSet rs = preparedStatement.executeQuery(); // thực thi truy vấn

			// chạy vòng lặp rs mới đếm được
			// Bạn cần di chuyển con trỏ đến hàng đầu tiên, trước khi yêu cầu dữ liệu:
			rs.beforeFirst();
			rs.next();

			int kq = rs.getInt("sk"); // gán số lượng vào kq
			return kq;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return 0;
	}

	// user coi sự kiện đã tạo
	public taoSKModel xemskdatao(String username) {

		taoSKModel usModel = new taoSKModel();
		try {

			PreparedStatement preparedStatement = connection.prepareStatement(XEMNgSUKIEN_STRING);
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				usModel = new taoSKModel(rs.getInt("idsk"), rs.getString("tensk"), rs.getString("tgbatdau"),
						rs.getString("tgketthuc"), rs.getString("diadiem"));
				return usModel;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;

	}
}
