<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Đăng ký tài khoản</title>
<style>
table {
	margin: auto;
	width: 80%
}

table td {
	padding-top: 15px;
	padding-bottom: 15px;
}
.in{
	height : 30px;
	width:100%;
	
}
button{
	height: 40px;
	width: 100px;
	margin-right : 8px;
	 border-radius: 5px;
	 background-color:green;
	 color: white;
	
}
</style>
</head>
<body style="background-color: #e6e4f5;">
	<div style=" background-color: white; border: 1px solid; margin: 50px 30%; border-radius: 10px;">
		<form action="${pageContext.request.contextPath}/registerServlet"
			method="post">
			<table>
				<h2 style="text-align: center;  color : green;">Đăng ký tài khoản</h2>
				<tr>
					<td>Họ tên :</td>
					<td><input class="in" type="text" name="hoten" placeholder="Họ tên" /></td>
				</tr>

				<tr>
					<td>Tài khoản :</td>
					<td><input class="in" type="text" name="user" placeholder="Tài khoản" /></td>
				</tr>

				<tr>
					<td>Mật khẩu :</td>
					<td><input class="in" type="password" name="pass" placeholder="Mật khẩu" /></td>
				</tr>

				<tr>
					<td>Email :</td>
					<td><input class="in" type="email" name="email" placeholder="Email" /></td>
				</tr>

				<tr>
					<td>Số điện thoại :</td>
					<td><input class="in" type="number" name="sdt"
						placeholder="Số điện thoại" maxlength="10" /></td>
				</tr>

				<tr>
					<td>Giới tính :</td>
					<td><input type="radio" name="gioitinh" value="true" /><span>Nam</span>
						<input type="radio" name="gioitinh" value="false" /><span>Nu</span>
					</td>
				</tr>

				<tr>
					<td></td>
					<td>
						<!-- <input type="submit" name="action" value="Register" /> -->
						<button type="submit" name="action" value="Register">Đăng
							ký</button> <a href="${pageContext.request.contextPath}/views/login.jsp">Đăng
							nhập</a>
					</td>
				</tr>
			</table>
		</form>
		<p style="text-align: center">${alert }</p>
		<p style="text-align: center">
			<a href="${pageContext.request.contextPath}/views/homeB.jsp">Home
				Page</a>
		</p>
	</div>
</body>
</html>
