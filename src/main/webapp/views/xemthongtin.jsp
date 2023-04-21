<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page import="java.util.Date"%>
<%@page import="phdhtl.cntt.util.DateSQLConvert"%>
<%@page import="phdhtl.cntt.model.taoSKModel"%>
<%@page import="phdhtl.cntt.dao.accountDAO"%>
<%@page import="phdhtl.cntt.util.connect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin cá nhân</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/not-su.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/not-fail.css" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">


<style>
.disable {
	pointer-events: none;
	cursor: default;
}

.tabsss {
	margin-top: 50px;
}

.header {
	margin-top: 30px;
	margin-bottom: 20px
}

.table {
	margin-top: 50px;
	margin-bottom: 20px
}

#hidden {
	display: none;
}

.hidden2 {
	display: none;
}

#table tr {
	cursor: pointer;
	transition: all .25s ease-in-out;
}

#table tr:hover {
	background-color: #f5ebf7;
}

td {
	text-align: center;
}
</style>

</head>
<body>


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
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item navbar-brand"><a class="nav-link" href="#">Tranh
						cá nhân : <%=session.getAttribute("user")%></a></li>

			</ul>

		</div>
	</nav>


	<!-- canh lề  -->
	<div style="margin: 20px 0px"></div>


	<div class="container">
		<!-- button tap -->

		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-selected="true">Sự kiện đã đăng ký</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
				aria-selected="false">Thông tin cá nhân</a></li>
			<li class="nav-item"><a class="nav-link" id="contact-tab"
				data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
				aria-selected="false">Xem người tham gia</a></li>
		</ul>










		<!--  nội dung -->

		<div class="tab-content" id="myTabContent">


			<!-- Tab sự kiện -->
			<div class="tab-pane fade show active" id="home" role="tabpanel"
				aria-labelledby="home-tab">
				<!-- canh lề  -->
				<div style="margin: 20px 0px"></div>
				<h2 class="header">Sự kiện đã tạo</h2>

				<!-- form hidden -->

				<div style="margin: auto" id="hidden">
					<h5 style="margin: 15px 0;">Chỉnh sửa</h5>


					<form action="${pageContext.request.contextPath}/taoskServlet"
						method="post">
						<!--id  -->
						<input type="text" id="idsk" class="hidden2" name="idsk" />

						<div class="row">

							<div class="col">
								<div class="form-group">
									<label class="sr-only" for="tensk">Tên sự kiện :</label> <input
										type="text" class="form-control" id="tensk"
										placeholder="Tên sự kiên" name="tensk">
								</div>
							</div>

							<div class="col">
								<div class="form-group">
									<label class="sr-only" for="diadiem">Địa điểm :</label> <select
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
								<label class="sr-only" for="bd">Thời gian bắt đầu :</label> <input
									type="date" class="form-control" id="bd"
									placeholder="Thời gian bắt đầu" name="bd">
							</div>


							<div class="col">
								<label class="sr-only" for="kt">Thời gian kết thúc :</label> <input
									type="date" class="form-control" id="kt"
									placeholder="Thời gian kết thúc" name="kt">
							</div>

						</div>

						<div class="row">
							<div class="col"></div>
							<div class="col">
								<div
									style="margin-top: 15px; padding-right: 0; padding-left: 62%;">
									<button type="submit" class="btn btn-outline-primary"
										style="width: 100px; height: 50px;" value="update"
										name="action">Cập nhật</button>
									<button type="reset" class="btn btn-outline-secondary"
										style="width: 100px; height: 50px;" value="delete"
										name="action">Làm mới</button>
								</div>

							</div>

						</div>



					</form>
				</div>



				<!-- Table -->
				<table class="table" id="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Tên sự kiện</th>
							<th scope="col">Thời gian bắt đầu</th>
							<th scope="col">Thời gian kết thúc</th>
							<th scope="col">Địa điểm</th>
							<th scope="col">Người đã tham gia</th>
							<th scope="col">Số lượng tối đa</th>
							<th scope="col">QR</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>

						<%

						%>


						<%
						accountDAO d = new accountDAO();

						String XEMNgSUKIEN_STRING = "Select * from taosukien where nguoitao=?;";
						preparedStatement = connection.prepareStatement(XEMNgSUKIEN_STRING);
						preparedStatement.setString(1, username);
						rs = preparedStatement.executeQuery();

						while (rs.next()) {

							String bd = DateSQLConvert.date(rs.getDate("tgbatdau"));
							String kt = DateSQLConvert.date(rs.getDate("tgketthuc"));
							int kq = d.countSL(rs.getString("tensk"), username);
						%>
						<tr class="">
							<td><%=rs.getInt("idsk")%></td>
							<td><%=rs.getString("tensk")%></td>
							<td><%=rs.getDate("tgbatdau")%></td>
							<td><%=rs.getDate("tgketthuc")%></td>
							<td><%=rs.getString("diadiem")%></td>
							<td><%=kq%></td>
							<td><%=rs.getInt("soluongcothethamgia")%></td>
							<td><img width="100px" height="100px"
								src="${pageContext.request.contextPath}/views/img/<%=rs.getString("qr")%>"
								alt="" /></td>
							<td>
								<button type="button" class="btn btn-outline-warning"
									onclick="hiddenform()">Chỉnh sửa</button>
							</td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>













				<!-- end tab -->
			</div>





			<!-- Tab thông tin  -->
			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">



				<!--div  -->
				<div style="margin: 0px 10%">
					<h5 style="margin: 15px 0;">Thông tin cá nhân</h5>
					<input type="button" id="lock" value="Chỉnh sửa"
						onclick="toggleEnable()" class="btn btn-outline-success"
						style="margin: 15px 0 30px 0;">


					<form action="${pageContext.request.contextPath}/registerServlet"
						method="post">

						<%
						String sql1 = "Select * from user where username=?;";
						preparedStatement = connection.prepareStatement(sql1);
						preparedStatement.setString(1, username);
						rs = preparedStatement.executeQuery();
						while (rs.next()) {
						%>


						<!-- id -->
						<input type="text" id="iduser" class="hidden2" name="iduser"
							value="<%=rs.getInt("iduser")%>" />


						<div class="row">
							<div class="col">
								<div class="form-group">
									<label class="sr-only" for="hoten">Họ tên :</label> <input
										disabled type="text" class="form-control" id="hoten"
										placeholder="Họ tên" name="hoten"
										value="<%=rs.getString("hoten")%>">
								</div>


							</div>

						</div>


						<div class="row">
							<div class="col">
								<div class="form-group">
									<label class="sr-only" for="sdt">Số điện thoại :</label> <input
										disabled type="number" class="form-control" id="sdt"
										placeholder="Số điện thoại" name="sdt"
										value="<%=rs.getString("sdt")%>">
								</div>


							</div>

						</div>

						<div class="row">
							<div class="col">


								<label class="sr-only" for="email">Email :</label> <input
									disabled type="text" class="form-control" id="email"
									placeholder="Email" name="email"
									value="<%=rs.getString("email")%>">

							</div>

						</div>
						<div class="row" style="margin-top: 8px;">
							<div class="col">

								<%
								if (rs.getBoolean("gioitinh") == true) {
								%>

								<div class="form-check form-check-inline">
									<input disabled class="form-check-input" type="radio"
										name="gioitinh" id="nam" value="true" checked> <label
										class="form-check-label" for="nam">Nam</label>
								</div>
								<div class="form-check form-check-inline">
									<input disabled class="form-check-input" type="radio"
										name="gioitinh" id="nu" value="false"> <label
										class="form-check-label" for="nu">Nu</label>
								</div>


								<%
								} else {
								%>
								<div class="form-check form-check-inline">
									<input disabled class="form-check-input" type="radio"
										name="gioitinh" id="nam" value="true"> <label
										class="form-check-label" for="nam">Nam</label>
								</div>
								<div class="form-check form-check-inline">
									<input disabled class="form-check-input" type="radio"
										name="gioitinh" id="nu" value="false" checked> <label
										class="form-check-label" for="nu">Nu</label>
								</div>

								<%
								}
								%>

							</div>

						</div>

						<div class="row">
							<div class="col">

								<div
									style="margin-top: 15px; padding-right: 0; padding-left: 62%;">
									<button type="submit" class="btn btn-outline-primary"
										style="width: 100px; height: 50px;" name="action"
										value="update">Cập nhật</button>
									<button type="submit" class="btn btn-outline-danger"
										style="width: 100px; height: 50px;">Xóa</button>
								</div>

							</div>
						</div>

						<%
						}
						%>

					</form>
					<!-- div -->
				</div>




				<!-- end tab -->
			</div>




			<!-- Tab xem người tham gia-->
			<div class="tab-pane fade" id="contact" role="tabpanel"
				aria-labelledby="contact-tab">



				<table class="table">
					<thead>
						<tr>
							<th scope="col">Tên sự kiện</th>
							<th scope="col">Họ tên</th>
							<th scope="col">Mã số sinh viên</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Email</th>
						</tr>
					</thead>

					<tbody>
						<%
						String nguoitao = (String) session.getAttribute("user");
						String sqlTG = "Select * from dangkysk where nguoitao=?";
						preparedStatement = connection.prepareStatement(sqlTG);
						preparedStatement.setString(1, nguoitao);
						rs = preparedStatement.executeQuery();
						while (rs.next()) {
						%>
						<tr>
							<th><%=rs.getString(2)%></th>
							<td><%=rs.getString(7)%></td>
							<td><%=rs.getString(8)%></td>
							<td><%=rs.getString(9)%></td>
							<td><%=rs.getString(10)%>do</td>
						</tr>
						<%
						}
						%>
					</tbody>

				</table>




				<!-- end tab -->
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







	<!-- canh lề  -->
	<div style="margin: 105px 0px 100px 0px;"></div>

	<!-- Footer -->

	<section class="" style="left: 0; bottom: 0; width: 100%;">
		<!-- Footer -->
		<footer class="text-center text-white"
			style="background-color: #0a4275;">
			<!-- Grid container -->
			<div class="container p-4 pb-0">
				<!-- Section: CTA -->
				<section class="">
					<p class="d-flex justify-content-center align-items-center">
						<span class="me-3">Phân hiệu Đại học Thủy Lợi</span>

					</p>
				</section>
				<!-- Section: CTA -->
			</div>
			<!-- Grid container -->

			<!-- Copyright -->
			<div class="text-center p-3"
				style="background-color: rgba(0, 0, 0, 0.2);">
				© 2022 Copyright: <a class="text-white" href="#">Nhóm 9</a>
			</div>
			<!-- Copyright -->
		</footer>
		<!-- Footer -->
	</section>



	<!-- JS -->
	<script type="text/javascript">
		// bỏ esable để thay đổi thông tiin
		function toggleEnable() {

			document.getElementById("hoten").disabled = false;
			document.getElementById("sdt").disabled = false;
			document.getElementById("email").disabled = false;
			document.getElementById("nu").disabled = false;
			document.getElementById("nam").disabled = false;

		}
		// ẩn hiện form
		function hiddenform() {
			var x = document.getElementById("hidden");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}

		// table click input
		var tbl = document.getElementById('table'); // id cuar bang
		for (var i = 1; i < tbl.rows.length; i++) {
			tbl.rows[i].onclick = function() {
				// id cua input
				document.getElementById('idsk').value = this.cells[0].innerHTML;
				document.getElementById('tensk').value = this.cells[1].innerHTML;
				document.getElementById('bd').value = this.cells[2].innerHTML;
				document.getElementById('kt').value = this.cells[3].innerHTML;
				document.getElementById('diadiem').value = this.cells[4].innerHTML;
			};
		}
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