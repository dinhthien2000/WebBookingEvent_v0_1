package phdhtl.cntt.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;


import phdhtl.cntt.model.thamgiaSKModel;
import phdhtl.cntt.util.DateSQLConvert;
import phdhtl.cntt.util.connect;

public class thamgiaskDAO {
	private static final String SQL_STRING = "insert into dangkysk(tensk,tgbatdau,tgketthuc,diadiem,nguoitao,hotendk,mssv,sdt,email) "
			+ "values (?,?,?,?,?,?,?,?,?);";

	Connection connection = connect.getConnection();

	public int insert(thamgiaSKModel u) {
		try {

//			Date bd = DateSQLConvert.dateSQL(u.getTgbatdau());
			Date bd = DateSQLConvert.dateSQL(u.getTgbatdau());
			Date kt = DateSQLConvert.dateSQL(u.getTgketthuc());

			PreparedStatement preparedStatement = connection.prepareStatement(SQL_STRING);
			preparedStatement.setString(1, u.getTensk());
			preparedStatement.setDate(2, bd);
			preparedStatement.setDate(3, kt);
			preparedStatement.setString(4, u.getDiadiem());
			preparedStatement.setString(5, u.getNguoitao());
			preparedStatement.setString(6, u.getHotendk());
			preparedStatement.setString(7, u.getMasv());
			preparedStatement.setString(8, u.getSdt());
			preparedStatement.setString(9, u.getEmail());

			int kq = preparedStatement.executeUpdate();

			return kq;

		} catch (Exception e) {

			e.printStackTrace();
		}
		return 0;
	}

}
