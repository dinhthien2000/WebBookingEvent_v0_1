package phdhtl.cntt.util;

import java.io.File;

import phdhtl.cntt.dao.accountDAO;

public class testCount {
	public static void main(String[] args) {
//		accountDAO d = new accountDAO();
//		
//		int kq = d.countSL("sinh nhat3","thien");
//		System.out.println(kq);
		
		//delete file : 
		
		
		      try{
		         //path đến file
		         File file = new File("E:\\myfile.txt");
		         
		         // gọi phương thức delete 
		         if(file.delete()){
		            System.out.println(file.getName() + " is deleted!");
		         }else{
		            System.out.println("Delete failed: File didn't delete");
		          }
		       }catch(Exception e){
		           System.out.println("Exception occurred");
		           e.printStackTrace();
		        }
		    
		
	}
	
	
}
