<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="phdhtl.cntt.util.connect"%>
<%@page import="phdhtl.cntt.util.DateSQLConvert"%>
<%@page import="phdhtl.cntt.dao.accountDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/not-su.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/not-fail.css" />
	
	
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
	<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Sofia|Bitter|Podkova">

<title>Chi tiết</title>
<style>

	.row1 {
	
		margin : 10px;
		font-size : 20px;
		font-family: "Podkova", sans-serif;
	}
	@media screen and (max-width: 800px) {
  .col {
    width: 100%; /* The width is 100%, when the viewport is 800px or smaller */

</style>
</head>

<body style="background-color: white;">
	<div class="container"
		style="border: 1px solid royalblue; border-radius: 5px; margin-top: 20px; margin-bottom: 20px;background-color: aliceblue;">
		<%
		String tensk = request.getParameter("tensk");
		String diadiem = request.getParameter("diadiem");
		String sql = "select * from taosukien where tensk ='" + tensk+"' and diadiem='"+diadiem+"'";
		Connection connection = connect.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();
		accountDAO d = new accountDAO();
		while (rs.next()) {

			int kq = d.countSL(rs.getString("tensk"), rs.getString("nguoitao"));

			String bd = DateSQLConvert.date(rs.getDate("tgbatdau"));
			String kt = DateSQLConvert.date(rs.getDate("tgketthuc"));
		%>


		<div class="row">

			<div class="col"
				style="margin: 10px; padding: 15px; border: 1px solid; border-radius: 5px;">
				 <img width="100%" height="100%" src="${pageContext.request.contextPath}/views/img/<%=rs.getString("img")%>" alt="" />
			</div>
			<div class="col" style="margin: 10px; padding: 15px; left: 0px;">
				<div class="row row1" style="color: green; font-size: 30px;">Chi
					tiết</div>
				
				<div class="row row1">
					Tên sự kiện :
					<%=rs.getString("tensk") %>
				</div>
				<div class="row row1">
					Thời gian bắt đầu :
					<%=bd%>
				</div>
				<div class="row row1">
					Thời gian kết thúc :
					<%=kt%>
				</div>
				<div class="row row1">
					Địa điểm :
					<%=rs.getString("diadiem")%>
				</div>
				<div class="row row1">
					Note :
					<%=rs.getString("note")%>
				</div>
				<div class="row row1">
					Người tạo :
					<%=rs.getString("nguoitao")%>
				</div>
				<div class="row row1">
					Số lượng người tham gia :
					<%=kq%>
					/
					<%=rs.getString("soluongcothethamgia")%>
				</div>
				<div class="row row1">
				 <img width="70%" height="300px" src="${pageContext.request.contextPath}/views/img/<%=rs.getString("qr")%>" alt="" />
					
				</div>
			</div>


		</div>
		<%
		}
		%>




		<h2 class="homeh2" style="margin-bottom: 40px;">
			<a href="${pageContext.request.contextPath}/views/homeB.jsp">Home
				page</a>
		</h2>


	</div>


	<%
	String string = (String) request.getAttribute("alert");
	if (string != null) {
	%>

	<div class="notification" id="noti">

		<div class="col headernot">
			<p>Thông báo</p>

		</div>


		<div class="col bodynot">
			<p>${alert }</p>
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




	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>


</body>

</html>