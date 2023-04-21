<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="phdhtl.cntt.util.connect"%>
<%@page import="java.sql.Connection"%>
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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/not-su.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/not-fail.css" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<title>Admin Page</title>




<style>
.hidden2 {
	display: none;
}

.table tr {
	cursor: pointer;
	transition: all .25s ease-in-out;
}

.table tr:hover {
	background-color: #f5ebf7;
}
</style>
</head>
<body>



	<!-- menu -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active nav-link navbar-brand"><a
					class="nav-link"
					href="${pageContext.request.contextPath}/views/homeB.jsp">Home
						<span class=""></span>
				</a></li>
				<li class="nav-item navbar-brand"><a class="nav-link" href="#">Trang
						Admin : <%=session.getAttribute("admin")%></a></li>
				<li class="nav-item navbar-brand"><a class="nav-link"
					href="${pageContext.request.contextPath}/logoutAdminServlet">Đăng
						xuất</a></li>

			</ul>

		</div>
	</nav>
	<div style="margin: 20px 0;"></div>
	<div class="container">
		<!-- Noi dung -->
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation"><a
				class="nav-link active" id="home-tab" data-toggle="tab" href="#home"
				role="tab" aria-controls="home" aria-selected="true">Sự kiện</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="profile-tab" data-toggle="tab" href="#profile" role="tab"
				aria-controls="profile" aria-selected="false">Tham gia sự kiện</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="contact-tab" data-toggle="tab" href="#contact" role="tab"
				aria-controls="contact" aria-selected="false">Tài khoản</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				id="dd-tab" data-toggle="tab" href="#dd" role="tab"
				aria-controls="dd" aria-selected="false">Địa điểm</a></li>
		</ul>





		<!-- tabs  -->
		<div class="tab-content" id="myTabContent">




			<!-- taosk  -->
			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">

				<h2 style="margin: 30px 0px">Sự kiện đã tạo</h2>

				<form action="${pageContext.request.contextPath}/adminSKServlet"
					method="post">

					<!--id  -->
					<input type="text" id="idsk" class="hidden2" name="idsk" />


					<div class="row">

						<div class="col">
							<div class="form-group">
								<label class="" for="tensk">Tên sự kiện :</label> <input
									type="text" class="form-control" id="tensk"
									placeholder="Tên sự kiên" name="tensk">
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="" for="diadiem">Địa điểm :</label> <select
									name="diadiem"
									style="width: 100%; height: 37px; border-radius: 5px;">
									<option id="diadiem" value=""></option>
									<%
									Connection connection = connect.getConnection();
									String username = (String) session.getAttribute("user");

									String sql = "Select *from noitochuc";
									PreparedStatement preparedStatement = connection.prepareStatement(sql);
									ResultSet rs = preparedStatement.executeQuery();
									while (rs.next()) {
									%>
									<option value="<%=rs.getString("tenp")%>">
										<%=rs.getString("tenp")%>

									</option>
									<%
									}
									%>

								</select>

							</div>
						</div>


					</div>




					<div class="row">

						<div class="col">
							<div class="form-group">
								<label class="" for="bd">Thời gian bắt đầu :</label> <input
									type="date" class="form-control" id="bd"
									placeholder="Thời gian bắt đầu " name="bd">
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="" for="kt">Thời gian kết thúc :</label> <input
									type="date" class="form-control" id="kt"
									placeholder="Thời gian kết thúc" name="kt">
							</div>
						</div>


					</div>




					<div class="row">

						<div class="col">
							<div class="form-group">
								<label class="" for="nguoitao">Người tạo : </label> <input
									type="text" class="form-control" id="nguoitao"
									placeholder="Người tạo " name="nguoitao">
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="" for="soluong">Số lượng :</label> <input
									type="text" class="form-control" id="soluong"
									placeholder="Số lượng" name="soluong">
							</div>
						</div>


					</div>



					<div class="row">



						<div class="col">
							<div class="form-group">
								<label class="" for="note">Note :</label> <input type="text"
									class="form-control" id="note" placeholder="Note" name="note">
							</div>
						</div>


					</div>




					<div class="row">
						<div class="col"></div>
						<div class="col">
							<div style="margin: 20px 0; right: 0;">
								<button type="submit" class="btn btn-outline-primary"
									style="width: 100px; height: 50px;" value="update"
									name="action">Cập nhật</button>

								<button type="submit" class="btn btn-outline-danger"
									style="width: 100px; height: 50px;" value="delete"
									name="action">Xóa</button>

								<button type="reset" class="btn btn-outline-warning"
									style="width: 100px; height: 50px;" value="reset" name="action">Reset</button>
							</div>

						</div>

					</div>


				</form>





				<table class="table" id="tableSK">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Tên sự kiện</th>
							<th scope="col">Thời gian bắt đầu</th>
							<th scope="col">Thời gian kết thúc</th>
							<th scope="col">Địa điểm</th>
							<th scope="col">Img</th>
							<th scope="col">Note</th>
							<th scope="col">Người tạo</th>
							<th scope="col">Số lượng</th>
						</tr>
					</thead>
					<tbody>


						<%
						String sql1 = "select * from taosukien";
						preparedStatement = connection.prepareStatement(sql1);
						rs = preparedStatement.executeQuery();

						while (rs.next()) {
						%>



						<tr id="toanbo1">
							<td><%=rs.getInt("idsk")%></td>
							<td><%=rs.getString("tensk")%></td>
							<td><%=rs.getDate("tgbatdau")%></td>
							<td><%=rs.getDate("tgketthuc")%></td>
							<td><%=rs.getString("diadiem")%></td>
							<td><img width="100px" height="100px"
								src="${pageContext.request.contextPath}/views/img/<%=rs.getString("img") %>"
								alt="" /></td>
							<td><%=rs.getString("note")%></td>
							<td><%=rs.getString("nguoitao")%></td>
							<td><%=rs.getString("soluongcothethamgia")%></td>
						</tr>

						<%
						}
						%>
					</tbody>
				</table>

				<!-- end taosk -->
			</div>






			<!-- thamgiask  -->
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">



				<h2 style="margin: 30px 0px">Tham gia sự kiện</h2>

				<form action="${pageContext.request.contextPath}/adminTGServlet"
					method="post">

					<!--id  -->
					<input type="text" id="idtg" class="hidden2" name="idtg" />


					<div class="row">

						<div class="col">
							<div class="form-group">
								<label class="" for="tensktg">Tên sự kiện :</label> <input
									type="text" class="form-control" id="tensktg"
									placeholder="Tên sự kiên" name="tensktg">
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="" for="diadiemtg">Địa điểm :</label> <select
									name="diadiemtg"
									style="width: 100%; height: 37px; border-radius: 5px;">
									<option id="diadiemtg" value=""></option>
									<%
									sql = "Select *from noitochuc";
									preparedStatement = connection.prepareStatement(sql);
									rs = preparedStatement.executeQuery();
									while (rs.next()) {
									%>
									<option value="<%=rs.getString("tenp")%>">
										<%=rs.getString("tenp")%>

									</option>
									<%
									}
									%>

								</select>

							</div>
						</div>


					</div>




					<div class="row">

						<div class="col">
							<div class="form-group">
								<label class="" for="bdtg">Thời gian bắt đầu :</label> <input
									type="date" class="form-control" id="bdtg"
									placeholder="Thời gian bắt đầu " name="bdtg">
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="" for="kttg">Thời gian kết thúc :</label> <input
									type="date" class="form-control" id="kttg"
									placeholder="Thời gian kết thúc" name="kttg">
							</div>
						</div>


					</div>




					<div class="row">

						<div class="col">
							<div class="form-group">
								<label class="" for="nguoitaotg">Người tạo : </label> <input
									type="text" class="form-control" id="nguoitaotg"
									placeholder="Người tạo " name="nguoitaotg">
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="" for="hotentg">Họ tên tham gia :</label> <input
									type="text" class="form-control" id="hotentg"
									placeholder="họ tên tham gia" name="hotentg">
							</div>
						</div>


					</div>



					<div class="row">

						<div class="col">
							<div class="form-group">
								<label class="" for="mssv">Mã số sinh viên :</label> <input
									type="text" class="form-control" id="mssv"
									placeholder="Mã số sinh viên" name="mssv">
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="" for="sdt">Số điện thoại :</label> <input
									type="text" class="form-control" id="sdt"
									placeholder="Số điện thoại" name="sdt">
							</div>
						</div>


						<div class="col">
							<div class="form-group">
								<label class="" for="email">Email :</label> <input type="text"
									class="form-control" id="email" placeholder="Email"
									name="email">
							</div>
						</div>


					</div>




					<div class="row">
						<div class="col"></div>
						<div class="col">
							<div style="margin: 20px 0; right: 0;">
								<button type="submit" class="btn btn-outline-primary"
									style="width: 100px; height: 50px;" value="update"
									name="action">Cập nhật</button>

								<button type="submit" class="btn btn-outline-danger"
									style="width: 100px; height: 50px;" value="delete"
									name="action">Xóa</button>

								<button type="reset" class="btn btn-outline-warning"
									style="width: 100px; height: 50px;" value="reset" name="action">Reset</button>
							</div>

						</div>

					</div>


				</form>


				<table class="table" id="tableTG">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Tên sự kiện</th>
							<th scope="col">Thời gian bắt đầu</th>
							<th scope="col">Thời gian kết thúc</th>
							<th scope="col">Địa điểm</th>
							<th scope="col">Người tạo</th>
							<th scope="col">Họ tên tham gia</th>
							<th scope="col">Mã số sinh viên</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Email</th>


						</tr>
					</thead>
					<tbody>
						<%
						String sql2 = "select * from dangkysk";
						preparedStatement = connection.prepareStatement(sql2);
						rs = preparedStatement.executeQuery();

						while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getInt("iddk")%></td>
							<td><%=rs.getString("tensk")%></td>
							<td><%=rs.getDate("tgbatdau")%></td>
							<td><%=rs.getDate("tgketthuc")%></td>
							<td><%=rs.getString("diadiem")%></td>
							<td><%=rs.getString("nguoitao")%></td>
							<td><%=rs.getString("hotendk")%></td>
							<td><%=rs.getString("mssv")%></td>
							<td><%=rs.getString("sdt")%></td>
							<td><%=rs.getString("email")%></td>

						</tr>
						<%
						}
						%>
					</tbody>
				</table>




				<!-- end tham gia  -->
			</div>





			<!-- user -->
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">

				<h2 style="margin: 30px 0px">Người dùng</h2>

				<form action="${pageContext.request.contextPath}/" method="post">

					<!--id  -->
					<input type="text" id="idu" class="hidden2" name="idu" />


					<div class="row">

						<div class="col">
							<div class="form-group">
								<label class="" for="hotenu">Họ tên :</label> <input type="text"
									class="form-control" id="hotenu" placeholder="Tên sự kiên"
									name="hotenu">
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="" for="sdtu">Số điện thoại :</label> <input
									type="text" class="form-control" id="sdtu"
									placeholder="Tên sự kiên" name="sdtu">
							</div>
						</div>


					</div>


					<div class="row">

						<div class="col">
							<div class="form-group">
								<label class="" for="emailu">Email :</label> <input type="text"
									class="form-control" id="emailu" placeholder="Tên sự kiên"
									name="emailu">
							</div>
						</div>

						<!-- <div class="col">
							<div class="form-group">
								<label class="" for="gt">Giới tính</label><br />
								Nam : <input type="radio" class="" id="gtnam" placeholder="" name="gt"value="true"> 
								Nữ :<input type="radio" class="" id="gtnu" placeholder="" name="gt" value="false">
							</div>
						</div> -->

						<div class="col">
							<div class="form-group">
								<label class="" for="gt">Giới tính :</label> <select name="gt"
									id="gt" style="width: 100%; height: 37px; border-radius: 5px;">

									<option value="true">Nam</option>
									<option value="fale">Nu</option>

								</select>
							</div>
						</div>


					</div>


					<div class="row">

						<div class="col">
							<div class="form-group">
								<label class="" for="user">Username :</label> <input type="text"
									class="form-control" id="user" placeholder="Username"
									name="user">
							</div>
						</div>

						<div class="col">
							<div class="form-group">
								<label class="" for="pass">Password :</label> <input
									type="password" class="form-control" id="pass"
									placeholder="pass" name="pass">
							</div>
						</div>


					</div>


					<div class="row">
						<div class="col"></div>
						<div class="col">
							<div style="margin: 20px 0; right: 0;">
								<button type="submit" class="btn btn-outline-primary"
									style="width: 100px; height: 50px;" value="update"
									name="action">Cập nhật</button>

								<button type="submit" class="btn btn-outline-danger"
									style="width: 100px; height: 50px;" value="delete"
									name="action">Xóa</button>

								<button type="reset" class="btn btn-outline-warning"
									style="width: 100px; height: 50px;" value="reset" name="action">Reset</button>
							</div>

						</div>

					</div>




				</form>



				<div style="margin: 20px 0;"></div>
				<table class="table" id="tableU">
					<thead class="thead-light">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Họ tên</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Email</th>
							<th scope="col">Giới tính</th>
							<th scope="col">Username</th>
							<th scope="col">Password</th>

						</tr>
					</thead>
					<tbody>
						<%
						String sql3 = "select * from user";
						preparedStatement = connection.prepareStatement(sql3);
						rs = preparedStatement.executeQuery();

						while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getInt("iduser")%></td>
							<td><%=rs.getString("hoten")%></td>
							<td><%=rs.getString("sdt")%></td>
							<td><%=rs.getString("email")%></td>
							<td>
								<%
								if (rs.getBoolean("gioitinh") == true) {
								%> Nam <%
								} else {
								%> Nu <%
								}
								%>
							</td>
							<td><%=rs.getString("username")%></td>
							<td><%=rs.getString("password")%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>

				<!-- end user  -->
			</div>





			<%
			String sqlDD = "select * from noitochuc";
			preparedStatement = connection.prepareStatement(sqlDD);
			rs = preparedStatement.executeQuery();
			%>


			<!-- diadiem -->
			<div class="tab-pane fade" id="dd" role="tabpanel"
				aria-labelledby="contact-tab">
				<div style="margin: 20px 0;"></div>

				<!--  Form chỉnh sửa -->
				<div class="row">

					<div class="col">
						<h2>Địa điểm</h2>
						<form action="${pageContext.request.contextPath}/adminDDServlet"
							method="post" enctype="multipart/form-data">

							<input type="text" id="iddd" class="hidden2" name="iddd" value="" />



							<div class="form-group">
								<label class="" for="tenp">Tên phòng :</label><input type="text"
									class="form-control" id="tenp" placeholder="Tên phòng" value=""
									name="tenp">
							</div>

							<div class="form-group">
								<label class="" for="img">Img :</label><input type="file"
									class="form-control" id="img" placeholder="Img" name="img"
									value="">
							</div>

							<div class="form-group hidden2" style="">
								<label class="" for="imgname">Img name :</label> <input
									type="text" class="form-control" id="imgname"
									placeholder="Img name" name="imgname" value="">
							</div>


							<!--Button  -->
							<div style="margin: 20px 0; right: 0;">
								<button type="submit" class="btn btn-outline-success"
									style="width: 100px; height: 50px;" value="ADD" name="action">Thêm</button>

								<button type="submit" class="btn btn-outline-primary"
									style="width: 100px; height: 50px;" value="update"
									name="action">Cập nhật</button>

								<button type="submit" class="btn btn-outline-danger"
									style="width: 100px; height: 50px;" value="delete"
									name="action">Xóa</button>

								<button type="reset" class="btn btn-outline-warning"
									style="width: 100px; height: 50px;" value="reset" name="action">Reset</button>
							</div>


						</form>
					</div>
					<div class="col">
						<img src="${pageContext.request.contextPath}/views/img/"
							id="img1" alt="" style="width: 100%; height: 275px" />
					</div>


				</div>


				<!-- căng lề  -->
				<div style="margin: 50px 0;"></div>



				<table class="table" id="tableDD">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Tên phòng</th>
							<th scope="col">Img</th>

						</tr>
					</thead>
					<tbody>
						<%
						while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getInt("iddd")%></tD>
							<td><%=rs.getString("tenp")%></td>
							<td><img style="width: 300px; height: 150px;"
								src="${pageContext.request.contextPath}/views/img/<%=rs.getString("img") %>"
								alt="" /></td>
							<td class="hidden2"><%=rs.getString("img")%></td>
							<td>
								<button type="button" class="btn btn-outline-info"
									style="width: 100px; height: 50px;" value="" name="action">Chỉnh
									sửa</button>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>

				<!-- end dd  -->
			</div>
		</div>

	</div>












	<!-- alert  -->




	<%
	String string = (String) request.getAttribute("alert");
	if (string != null) {
		if (string.equalsIgnoreCase("fail")) {
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
	} else {
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



	<script>
		// table click input
		var tbl = document.getElementById('tableDD'); // id cuar bang
		for (var i = 1; i < tbl.rows.length; i++) {
			tbl.rows[i].onclick = function() {
				// id cua input

				document.getElementById('iddd').value = this.cells[0].innerHTML;
				document.getElementById('tenp').value = this.cells[1].innerHTML;
				document.getElementById('imgname').value = this.cells[3].innerHTML;

				//document.querySelector('img.something').src = this.cells[2].innerHTML;

			};
		}

		var tbl = document.getElementById('tableSK'); // id cuar bang
		for (var i = 1; i < tbl.rows.length; i++) {
			tbl.rows[i].onclick = function() {
				// id cua input

				document.getElementById('idsk').value = this.cells[0].innerHTML;
				document.getElementById('tensk').value = this.cells[1].innerHTML;
				document.getElementById('bd').value = this.cells[2].innerHTML;
				document.getElementById('kt').value = this.cells[3].innerHTML;
				document.getElementById('diadiem').value = this.cells[4].innerHTML;
				document.getElementById('note').value = this.cells[6].innerHTML;
				document.getElementById('nguoitao').value = this.cells[7].innerHTML;
				document.getElementById('soluong').value = this.cells[8].innerHTML;

				//document.querySelector('img.something').src = this.cells[2].innerHTML;

			};
		}

		var tbl = document.getElementById('tableTG'); // id cuar bang
		for (var i = 1; i < tbl.rows.length; i++) {
			tbl.rows[i].onclick = function() {
				// id cua input

				document.getElementById('idtg').value = this.cells[0].innerHTML;
				document.getElementById('tensktg').value = this.cells[1].innerHTML;
				document.getElementById('bdtg').value = this.cells[2].innerHTML;
				document.getElementById('kttg').value = this.cells[3].innerHTML;
				document.getElementById('diadiemtg').value = this.cells[4].innerHTML;
				document.getElementById('nguoitaotg').value = this.cells[5].innerHTML;
				document.getElementById('hotentg').value = this.cells[6].innerHTML;
				document.getElementById('mssv').value = this.cells[7].innerHTML;
				document.getElementById('sdt').value = this.cells[8].innerHTML;
				document.getElementById('email').value = this.cells[9].innerHTML;

				//document.querySelector('img.something').src = this.cells[2].innerHTML;

			};
		}

		var tbl = document.getElementById('tableU'); // id cuar bang
		for (var i = 1; i < tbl.rows.length; i++) {
			tbl.rows[i].onclick = function() {
				// id cua input

				document.getElementById('idu').value = this.cells[0].innerHTML;
				document.getElementById('hotenu').value = this.cells[1].innerHTML;
				document.getElementById('sdtu').value = this.cells[2].innerHTML;
				document.getElementById('emailu').value = this.cells[3].innerHTML;

				document.getElementById('gt').value = this.cells[4].innerHTML;

				document.getElementById('user').value = this.cells[5].innerHTML;
				document.getElementById('pass').value = this.cells[6].innerHTML;

				//document.querySelector('img.something').src = this.cells[2].innerHTML;

			};
		}
	</script>




	<script src="${pageContext.request.contextPath}/views/js/paging.js"
		type="text/javascript"></script>

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