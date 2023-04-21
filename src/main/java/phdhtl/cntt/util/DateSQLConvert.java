package phdhtl.cntt.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateSQLConvert {
	
	
	public static java.sql.Date dateConvert(String date ) throws ParseException {
		
		java.util.Date bd = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		java.sql.Date dateSQL = new java.sql.Date(bd.getTime());
		return dateSQL;
	}
	
	// String to Date
	public static java.sql.Date dateSQL(String str) throws ParseException {
		java.sql.Date date = java.sql.Date.valueOf(str);
		return date;
	}
	
	// Date to String
	public static String date(Date str) throws ParseException {
        DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String today = formatter.format(str);
		return today;

	}
	
	// String date to String
		public static String dates(String str) throws ParseException {
			java.sql.Date date = java.sql.Date.valueOf(str);
	        DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	        String today = formatter.format(date);
			return today;

		}
	
	// fomat day 
	public static String date1(Date str) throws ParseException {
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String today = formatter.format(str);
		return today;

	}
	public static void main(String[] args) {
		String s = "11-02-2022";
		try {
			java.sql.Date d = dateConvert(s);
			System.out.println(d);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
