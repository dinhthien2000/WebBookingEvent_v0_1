<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="phdhtl.cntt.util.connect"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tạo sự kiện</title>
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
	padding-top: 15px;
	padding-bottom: 15px;
}

.in {
	height: 30px;
	width: 100%;
}

button {
	height: 40px;
	width: 120px;
	margin-right: 8px;
	border-radius: 5px;
	
}
.btn1{
	background-color: #69c722;
	color: white;
	text-size: 5px;

}
</style>
</head>
<body>
	<div style=" background-color: white; border: 1px solid #69c722; margin: 50px 30%; border-radius: 10px;">
		<form action="${pageContext.request.contextPath}/taoskServlet"
			method="post" enctype="multipart/form-data">
			<table>
				<h2 style="text-align: center; color: #69c722;margin: 15px;">Đăng ký sự kiện</h2>
				<tr>
					<td>Tên sự kiện :</td>
					<td><input class="in" type="text" name="tensk" placeholder="Tên sự kiện" /></td>
				</tr>

				<tr>
					<td>Thời gian bắt đầu :</td>
					<td><input  class="in" type="date" name="tgbatdau" placeholder="" /></td>
				</tr>

				<tr>
					<td>Thời gian kết thúc :</td>
					<td><input  class="in" type="date" name="tgketthuc" placeholder="" /></td>
				</tr>

				<tr>
					<td>Địa điểm :</td>
					<td>
						<%
						Connection connection = connect.getConnection();
						String sql = "Select *from noitochuc";
						PreparedStatement preparedStatement = connection.prepareStatement(sql);
						ResultSet rs = preparedStatement.executeQuery();
						%> <select name="diadiem" id=""  class="in">
							<option value=""></option>
							<%
							while (rs.next()) {
							%>
							<option value="<%=rs.getString("tenp")%>">
								<%=rs.getString("tenp")%>


							</option>
							<%
							}
							%>

					</select>
					</td>
				</tr>

				<!-- <tr>
				<td>Hình ảnh :</td>
				<td><input type="file" name="img" placeholder="" /></td>
			</tr> -->

				<tr>
					<td>Ghi chú :</td>
					<td><textarea  class="in" name="note" id="note" placeholder="Ghi chú"></textarea></td>
				</tr>
				<tr>
					<td>Số lượng tham gia :</td>
					<td><select  class="in" name="soluong" id="">
							<option value=""></option>
							<option value="10">10 người</option>
							<option value="50">50 người</option>
							<option value="70">70 người</option>
							<option value="100">100 người</option>

					</select></td>
				</tr>
				<tr>
					<td></td>
					<td> 
					<!-- <input type="submit" name="action" value="ADD" class="btn" />
						<input type="reset" name="action" value="Reset" class="btn" /> -->
						<button type="submit" name="action" value="ADD" class="btn1">Tạo sự kiện</button>
						<button type="reset" name="action" value="Reset" class="btn">Làm mới</button>
						
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