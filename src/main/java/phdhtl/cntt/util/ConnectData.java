package phdhtl.cntt.util;

import java.sql.SQLException;

import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.Statement;

//import com.mysql.jdbc.Connection;


// các câu truy vấn sql
public class ConnectData {
	private Connection conn = null;

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	public ConnectData(){
        conn = ConnectionUtil.getConnection(parameter.DB_URL, parameter.USER_NAME, parameter.PASSWORD);          
   }
	public  int excuteInsertQuerydata(String sqlinsert){
        try {  
            // tạo statement : cung cấp các phương thức để thực thi các câu lệnh truy vấn với cơ sở dữ liệu SQL
             Statement stmt = conn.createStatement();          
          try{
             int ketqua= stmt.executeUpdate(sqlinsert);
               if(ketqua==0){
                 return 0;
               }else{
                 return 1;
                }
          }catch(SQLException e){
              return 2;         
          }          
         } catch (SQLException ex) {
           
             return 2;         
         } 
    }
     public  boolean excuteDeleteQuerydata(String sqldel){
        try {
            Statement stmt = conn.createStatement();      
             int ketqua= stmt.executeUpdate(sqldel);
                  if(ketqua==0){
                 return false;
               }else{
                 return true;
                }         
         } catch (SQLException ex) {          
             return false;         
         }      
    }
     
     public  int excuteDeleteQuerydataInt(String sqldel){
         try {
             Statement stmt = conn.createStatement();      
              int ketqua= stmt.executeUpdate(sqldel);
                   if(ketqua==0){
                  return 0;
                }else{
                  return 1;
                 }         
          } catch (SQLException ex) {          
              return 0;         
          }      
     }
     
     public  boolean excuteUpdateQuerydata(String sqlupdate){
        try {
           
             Statement stmt = conn.createStatement();          
          try{
             int ketqua= stmt.executeUpdate(sqlupdate);
                 return ketqua != 0;
          }catch(SQLException e){
              return false;         
          }          
         } catch (SQLException ex) {          
             return false;         
         }    
    }
      public  ResultSet excuteQuerydata(String sqlselect){
        try {
          
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sqlselect);
            return rs;    
        } catch (SQLException ex) {
             return null;  
           
        }
   } 
}
