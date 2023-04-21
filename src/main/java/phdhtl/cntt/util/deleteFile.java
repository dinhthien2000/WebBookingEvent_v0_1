package phdhtl.cntt.util;

import java.io.File;

public class deleteFile {
	public static boolean deleteF(String fileName) {
		try{
	         //path đến file
	         File file = new File("D:\\java1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\test2\\views\\img\\"+fileName+".jpg");
	         
	         // gọi phương thức delete 
	         if(file.delete()){
	          return true;
	         }else{
	           return false;
	          }
	       }catch(Exception e){
	           System.out.println("Exception occurred");
	           e.printStackTrace();
	        }
		return false;
		
	}
}
