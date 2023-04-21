<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Đăng nhập</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/not-fail.css" />
<style>
table {
	margin: auto;
	width: 80%
}
table td {
	/* 	padding-top: 15px;
	padding-bottom: 15px; */
	margin: 15px 0;
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
	background-color: #7463f2;
	color : white;
}
</style>
</head>
<body style="background-color: #e6e4f5">
	<div style="border: 1px solid; margin: 50px 30%; border-radius: 10px;background-color: white;"">


		<form action="${pageContext.request.contextPath}/loginServlet"
			method="post">
			<table>
				<h2 style="text-align: center; margin: 15px; color: #7463f2;">Đăng nhập</h2>
				<tr>
					<td>Tài khoản: </td>
					<td><input class="in" type="text" name="user" /></td>
				</tr>
				<tr>
					<td>Mật khẩu: </td>
					<td><input class="in" type="password" name="pass" id="" /></td>
				</tr>
				<tr>
					<td></td>


					<td>
						<button class="login">Đăng nhập</button> <a
						href="${pageContext.request.contextPath}/views/register.jsp">Đăng ký</a>
					</td>

				</tr>
			</table>
		</form>

		<p style="text-align: center">
			<a href="${pageContext.request.contextPath}/views/homeB.jsp">Home
				Page</a>
		</p>

	</div>






	<%
	String string = (String) request.getAttribute("alert");
	if (string != null) {
	%>

	<div class="notification-fail" id="noti">

		<div class="col headerfail">
			<p>Thông báo</p>

		</div>


		<div class="col bodyfail">
			<p>Thất bại</p>

		</div>

	</div>


	<%
	}
	%>


	<script>
		const targetDiv = document.getElementById("noti");
		const btn = document.getElementById("noti");
		btn.onclick = function() {
			if (targetDiv.style.display !== "none") {
				targetDiv.style.display = "none";
			} else {
				targetDiv.style.display = "block";
			}
		};
	</script>
</body>
</html>
