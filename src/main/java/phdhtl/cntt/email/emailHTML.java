package phdhtl.cntt.email;


import java.util.*;

import javax.mail.Message;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;

import javax.mail.internet.MimeMessage;

import phdhtl.cntt.util.DateSQLConvert;


public class emailHTML {

	public static void send(String tensk,String email,String hoten,String thoigianbd,String thoigiankt,String diadiem ) {
		
		// cài đặt các thông số để kết nối với email
		// đăng nhập email
		final String username = "thiendinhcm@gmail.com";
		//email.setFromAddressPassword("zyqzswjvmtznqgky");
		final String password = "zyqzswjvmtznqgky";
		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.required", "true");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		
		try {
			// khởi tạo mail
			Message message = new MimeMessage(session); 
			message.setFrom(new InternetAddress(username)); 
			message.setRecipients(

			Message.RecipientType.TO, InternetAddress.parse(email) // người nhận

			);
			
			// format date 
			
			String bd =DateSQLConvert.dates(thoigianbd);
			String kt = DateSQLConvert.dates(thoigiankt);
			
			// người nhận , tiêu đề, nội dung email
			String xacnhan = "Xác nhận";
			message.setSubject(xacnhan); // tiêu đề
			//message.setContent(msg,"text/html")
			// nội dung
			message.setContent("   <table\r\n"
					+ "      align=\"center\"\r\n"
					+ "      border=\"0\"\r\n"
					+ "      cellpadding=\"0\"\r\n"
					+ "      cellspacing=\"0\"\r\n"
					+ "      width=\"550\"\r\n"
					+ "      bgcolor=\"white\"\r\n"
					+ "      style=\"border: 1px solid black\"\r\n"
					+ "    >\r\n"
					+ "      <tbody>\r\n"
					+ "        <tr>\r\n"
					+ "          <td align=\"center\">\r\n"
					+ "            <table\r\n"
					+ "              align=\"center\"\r\n"
					+ "              border=\"0\"\r\n"
					+ "              cellpadding=\"0\"\r\n"
					+ "              cellspacing=\"0\"\r\n"
					+ "              class=\"col-550\"\r\n"
					+ "              width=\"550\"\r\n"
					+ "            >\r\n"
					+ "              <tbody>\r\n"
					+ "                <tr>\r\n"
					+ "                  <td\r\n"
					+ "                    align=\"center\"\r\n"
					+ "                    style=\"background-color: #433dec9e; height: 50px\"\r\n"
					+ "                  >\r\n"
					+ "                    <a href=\"#\" style=\"text-decoration: none\">\r\n"
					+ "                      <p style=\"color: white; font-weight: bold\"></p>\r\n"
					+ "                    </a>\r\n"
					+ "                  </td>\r\n"
					+ "                </tr>\r\n"
					+ "              </tbody>\r\n"
					+ "            </table>\r\n"
					+ "          </td>\r\n"
					+ "        </tr>\r\n"
					+ "        <tr style=\"height: 30px\">\r\n"
					+ "          <td\r\n"
					+ "            align=\"center\"\r\n"
					+ "            style=\"\r\n"
					+ "              border: none;\r\n"
					+ "              border-bottom: 2px solid #4cb96b;\r\n"
					+ "              padding-right: 10px;\r\n"
					+ "              padding-left: 10px;\r\n"
					+ "            \"\r\n"
					+ "          >\r\n"
					+ "            <p\r\n"
					+ "              style=\"\r\n"
					+ "                font-weight: bolder;\r\n"
					+ "                font-size: 30px;\r\n"
					+ "                letter-spacing: 0.025em;\r\n"
					+ "                color: black;\r\n"
					+ "              \"\r\n"
					+ "            >\r\n"
					+ "              Thư thông báo\r\n"
					+ "              <br />\r\n"
					+ "            </p>\r\n"
					+ "          </td>\r\n"
					+ "        </tr>\r\n"
					+ "        \r\n"
					+ " \r\n"
					+ "        <tr style=\"\r\n"
					+ "         align-items: center; \r\n"
					+ "            ;left: 0;  height: 50px;margin-top: 50px;\">\r\n"
					+ "          <td >\r\n"
					+ "          <div>\r\n"
					+ "            <p style=\"display: inline; margin-left: 20%;\">\r\n"
					+ "             Người tham gia : "+hoten+"\r\n"
					+ "            </p>\r\n"
					+ "            \r\n"
					+ "            <p style=\"display: inline ; margin-left: 15%;\">\r\n"
					+ "\r\n"
					+ "             \r\n"
					+ "              \r\n"
					+ "            </p>\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "          </div>\r\n"
					+ "          </td>\r\n"
					+ "        </tr>\r\n"
					+ "\r\n"
					+ "        <tr style=\"\r\n"
					+ "         align-items: center; \r\n"
					+ "            ;left: 0;  height: 50px;\">\r\n"
					+ "          <td >\r\n"
					+ "          <div>\r\n"
					+ "            <p style=\"display: inline; margin-left: 20%;\">\r\n"
					+ "              Sự kiện : "+tensk+"\r\n"
					+ "            </p>\r\n"
					+ "            \r\n"
					+ "            <p style=\"display: inline ; margin-left: 15%;\">\r\n"
					+ "\r\n"
					+ "              Địa điểm : "+diadiem+" \r\n"
					+ "              \r\n"
					+ "            </p>\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "          </div>\r\n"
					+ "          </td>\r\n"
					+ "        </tr>\r\n"
					+ "          <tr style=\"\r\n"
					+ "          align-items: center; \r\n"
					+ "             ;left: 0;  height: 50px\" >\r\n"
					+ "          <td>\r\n"
					+ "            <p style=\"display: inline; margin-left: 20%;\">\r\n"
					+ "              Thời gian bắt đầu : "+bd+"\r\n"
					+ "             </p>\r\n"
					+ "             <p style=\"display: inline ; margin-left: 5%\">\r\n"
					+ "              Thời gian kết thúc : "+kt+"\r\n"
					+ "            </p>\r\n"
					+ "\r\n"
					+ "\r\n"
					+ "          </td>\r\n"
					+ "            \r\n"
					+ "          <tr style=\"\r\n"
					+ "          align-items: center;height: 50px;margin-left: 20px; \">\r\n"
					+ "\r\n"
					+ "            <td>\r\n"
					+ "\r\n"
					+ "              <p  style=\" text-align: center;\">\r\n"
					+ "                Sự góp mặt của quý vị là vinh hạnh cho chúng tôi <br />\r\n"
					+ "                Chân thành cảm ơn\r\n"
					+ "              </p>\r\n"
					+ "            \r\n"
					+ "            </td>\r\n"
					+ "\r\n"
					+ "          </tr>\r\n"
					+ "           \r\n"
					+ "        </tr>\r\n"
					+ "      </tbody>\r\n"
					+ "    </table> ","text/html; charset=UTF-8");			// nội dung
			

			//attach

//			File file = new File("E:/web/Chuyen de 2/portlfolio/zip/Nhom6/assets/images/caphe.jpg");
//			MimeBodyPart part = new MimeBodyPart();
//			part.setDataHandler(new DataHandler(new FileDataSource(file)));
//			part.setFileName(file.getName());
//
//			Multipart multipart = new MimeMultipart();
//			multipart.addBodyPart(part);
//			message.setContent(multipart);

			Transport.send(message);

			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println("failll : " + e.getMessage());
			
		}

		
	
	
	}
}
