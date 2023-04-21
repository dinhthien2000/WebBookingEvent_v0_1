
<%@page import="phdhtl.cntt.util.ConnectData"%>
<%@page import="java.util.Date"%>
<%@page import="phdhtl.cntt.util.DateSQLConvert"%>
<%@page import="phdhtl.cntt.model.taoSKModel"%>
<%@page import="phdhtl.cntt.dao.accountDAO"%>
<%@page import="phdhtl.cntt.util.connect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/btntop.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/not-su.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Sofia|Bitter|Podkova">

<style>
body {
	background-color: #e6e6eb;
}

.card-img-top {
	height: 250px;
}

.img-standart {
	height: 100%;
	width: 100%;
}

.card-grid {
	height: 100%;
}

.ctn {
	margin: 0 10%;
	padding: 20px 0;
}

.ctn1 {
	margin: 5px 0;
	/* padding: 20px 0; */
}

.ctn12 {
	margin: 0 10%;
	padding: 20px 0;
	border-radius: 10px;
}

.carousel-indicators {
	background-color: gray;
}

.navbar {
	height: 70px;
}

.toanbo {
	margin: 10px 0;
	font-family: "Sofia", sans-serif;
}

.sapdienra {
	margin: 10px 0;
	font-family: "Bitter", sans-serif;
}

#sapdienra {
	font-family: "Podkova", sans-serif;
}
</style>
<title>Home page</title>
</head>
<body>


	<%
	Connection connection = connect.getConnection();
	%>



	<!-- menu -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/views/homeB.jsp"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Trang
						chủ <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#sapdienra">Sắp
						diễn ra</a></li>
				<li class="nav-item"><a class="nav-link" href="#tintuc">Tin
						tức</a></li>
				<li class="nav-item"><a class="nav-link" href="#toanbo">Toàn
						bộ</a></li>
				<li class="nav-item"><a class="nav-link" href="#noitochuc">Nơi
						tổ chức</a></li>



				<%
				if (session.getAttribute("user") != null) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/views/taosk.jsp">Tạo
						sự kiện</a></li>

				<li class="nav-item dropdown"><a
					class="navbar-brand dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-expanded="false">
						Hello <%=session.getAttribute("user")%>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/logoutServlet">Đăng
							xuất</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/views/xemthongtin.jsp">Thông
							tin cá nhân</a>
					</div></li>
				<%
				} else {
				%>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-expanded="false"> Tài
						khoản </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/views/login.jsp">Đăng
							nhập</a> <a class="dropdown-item"
							href="${pageContext.request.contextPath}/views/admin.jsp">Admin</a>

						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/views/register.jsp">Đăng
							ký</a>
						<div class="dropdown-divider"></div>

					</div></li>
				<%
				}
				%>

			</ul>
			
		</div>
	</nav>




	<!-- Slide -->
	<!-- sự kiẹn Nỗi bật  -->

	<div id="carouselExampleControls" class="carousel slide ctn1"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath}/views/img/tls1.jpg"
					class="d-block w-100" alt="..." style="height: 500px">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/views/img/tls2.jpg"
					class="d-block w-100" alt="..." style="height: 500px">
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/views/img/tls3.jpg"
					class="d-block w-100" alt="..." style="height: 500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-target="#carouselExampleControls" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-target="#carouselExampleControls" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
		</button>
	</div>




	<!-- Card view -->
	<!-- Sắp diễn ra -->
	<div
		style="margin: 0 10%; padding: 20px 0; border-bottom-right-radius: 20px; border-bottom-left-radius: 20px; border: 1px; border-bottom-style: solid; border-bottom-color: red;">
		<h2 id="sapdienra"
			style="text-align: center; padding-top: 15px; color: red;">Sắp
			diễn ra</h2>

	</div>

	<div class="row row-cols-1 row-cols-md-3 ctn ">


		<%
		accountDAO d = new accountDAO();

		String sql = "SELECT * FROM `taosukien` ORDER BY tgbatdau LIMIT 6";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet rs = preparedStatement.executeQuery();

		while (rs.next()) {
			int kq = d.countSL(rs.getString("tensk"), rs.getString("nguoitao"));
			DateSQLConvert c = new DateSQLConvert();
			String bd = c.date(rs.getDate("tgbatdau"));
			String kt = c.date(rs.getDate("tgketthuc"));
		%>

		<div class="col mb-4 sapdienra">
			<div class="card">
				<img
					src="${pageContext.request.contextPath}/views/img/<%=rs.getString("img") %>"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">
						Tên sự kiện :
						<%=rs.getString("tensk")%></h5>
					<p class="card-text">
						Thời gian bắt đầu :
						<%=bd%>.
					</p>
					<p class="card-text">
						Thời gian kết thúc :
						<%=kt%>.
					</p>
					<p class="card-text">
						Địa điểm :
						<%=rs.getString("diadiem")%>.
					</p>
					<p class="card-text">
						Ghi chú :
						<%=rs.getString("note")%>.
					</p>
					<p class="card-text">
						Người tạo :
						<%=rs.getString("nguoitao")%>.
					</p>
					<p class="card-text">
						Số lượng người tham gia :
						<%=kq%>/<%=rs.getInt("soluongcothethamgia")%>.
					</p>

					<p class="card-text">
						
							<a
									href="${pageContext.request.contextPath}/views/chitietsk.jsp?tensk=<%=rs.getString("tensk")%>&diadiem=<%=rs.getString("diadiem")%>"> Xem chi
									tiết</a>

					</p>


					<a
						href="${pageContext.request.contextPath}/views/thamgia.jsp?
							tensk=<%=rs.getString("tensk")%>&
							bd=<%=rs.getDate("tgbatdau")%>&
							kt=<%=rs.getDate("tgketthuc")%>&
							diadiem=<%=rs.getString("diadiem")%>&
							nguoitao=<%=rs.getString("nguoitao")%>">
						<button type="button" class="btn btn-primary text-uppercase">
							Tham gia</button>
					</a>
				</div>
			</div>
		</div>

		<%
		}
		%>
	</div>




	<%-- 	<!-- Nơi tổ chức  -->
	<h2 id="" style="text-align: center;">Nơi tổ chức</h2>
	<div id="carouselExampleIndicators" class="carousel slide ctn"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" class="active"></li>
			<li data-target="#carouselExampleIndicators"></li>
			<li data-target="#carouselExampleIndicators"></li>
		</ol>
		<div class="carousel-inner">

			<div class="carousel-item active">



				<div class="card-deck">
					<div class="card">
						<img src="${pageContext.request.contextPath}/views/img/meohou.jpg"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
					<div class="card">
						<img src="${pageContext.request.contextPath}/views/img/test.jpg"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This card has supporting text below as a
								natural lead-in to additional content.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
					<div class="card">
						<img src="${pageContext.request.contextPath}/views/img/meohou.jpg"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This card
								has even longer content than the first to show that equal height
								action.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
				</div>




			</div>

			<div class="carousel-item">

				<div class="card-deck">
					<div class="card">
						<img src="${pageContext.request.contextPath}/views/img/test.jpg"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
					<div class="card">
						<img src="${pageContext.request.contextPath}/views/img/meohou.jpg"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This card has supporting text below as a
								natural lead-in to additional content.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
					<div class="card">
						<img src="${pageContext.request.contextPath}/views/img/test.jpg"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This card
								has even longer content than the first to show that equal height
								action.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
				</div>



			</div>
			<div class="carousel-item">


				<div class="card-deck">
					<div class="card">
						<img src="${pageContext.request.contextPath}/views/img/meohou.jpg"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
					<div class="card">
						<img src="${pageContext.request.contextPath}/views/img/test.jpg"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This card has supporting text below as a
								natural lead-in to additional content.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
					<div class="card">
						<img src="${pageContext.request.contextPath}/views/img/meohou.jpg"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This card
								has even longer content than the first to show that equal height
								action.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
				</div>



			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-target="#carouselExampleIndicators" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-target="#carouselExampleIndicators" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
		</button>
	</div> --%>


	<!-- Nơi tổ chức  -->

	<h2 id="noitochuc" style="text-align: center;">Nơi tổ chức</h2>

	<div id="carouselExampleControls1" class="carousel slide ctn12"
		data-ride="carousel">
		<div class="carousel-inner">

			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath}/views/img/webbg.jpg"
					class="d-block w-100" alt="..." style="height: 500px; width: 100%">
			</div>
			<%
			String sqlslide = "Select * from noitochuc";
			preparedStatement = connection.prepareStatement(sqlslide);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
			%>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/views/img/<%=rs.getString("img") %>"
					class="d-block w-100" alt="..." style="height: 500px; width: 100%">
				<div class="carousel-caption d-none d-md-block">
					<h5>Nơi tổ chức</h5>
					<p>
						Phòng
						<%=rs.getString("tenp")%></p>
				</div>
			</div>
			<%
			}
			%>
		</div>



		<button class="carousel-control-prev" type="button"
			data-target="#carouselExampleControls1" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-target="#carouselExampleControls1" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
		</button>
	</div>



	<!-- toàn bộ  -->
	<div
		style="margin: 0 10%; padding: 20px 0; border-bottom-left-radius: 20px; border: 1px; border-bottom-style: solid; border-bottom-color: green;">
		<h2 id="toanbo"
			style="color: green; margin: auto; padding-left: 15px; text-align: left;">


			Toàn bộ</h2>
	</div>



	<%
	String sql1 = "select * from taosukien";
	preparedStatement = connection.prepareStatement(sql1);

	rs = preparedStatement.executeQuery();
	while (rs.next()) {
	%>


	<div class="row ctn" id="toanbo1">
		<%
		while (rs.next()) {
			// đếm số lượng người tham gia
			int kq = d.countSL(rs.getString("tensk"), rs.getString("nguoitao"));

			// fomat date dd-mm-yyyy
			DateSQLConvert c = new DateSQLConvert();
			String bd = c.date(rs.getDate("tgbatdau"));
			String kt = c.date(rs.getDate("tgketthuc"));
		%>

		<div class="col-6 toanbo" style="">

			<div class="card mb-6 card-grid" style="boder-radius: 100px;">
				<div class="row no-gutters card-grid">
					<div class="col-md-6">
						<img class="img-standart"
							src="${pageContext.request.contextPath}/views/img/<%=rs.getString("img") %>"
							alt="...">
					</div>
					<div class="col-md-6 card-grid">
						<div class="card-body">
							<h5 class="card-title" style="color: green"><%=rs.getString("tensk")%></h5>
							<p class="card-text">
								Ngày bắt đầu :
								<%=bd%>.
							</p>
							<p class="card-text">
								Ngày kết thúc :
								<%=kt%>.
							</p>
							<p class="card-text">
								Địa điểm :
								<%=rs.getString("diadiem")%>.
							</p>
							<p class="card-text">
								Người tạo :
								<%=rs.getString("nguoitao")%>.
							</p>
							<p class="card-text">
								Giới thiệu :
								<%=rs.getString("note")%>.
							</p>
							<p class="card-text">
								<a
									href="${pageContext.request.contextPath}/views/chitietsk.jsp?tensk=<%=rs.getString("tensk")%>&diadiem=<%=rs.getString("diadiem")%>"> Xem chi
									tiết</a>

							</p>
							<a
								href="${pageContext.request.contextPath}/views/thamgia.jsp?
							tensk=<%=rs.getString("tensk")%>&
							bd=<%=rs.getDate("tgbatdau")%>&
							kt=<%=rs.getDate("tgketthuc")%>&
							diadiem=<%=rs.getString("diadiem")%>&
							nguoitao=<%=rs.getString("nguoitao")%>">
								<button type="button" class="btn btn-primary text-uppercase">
									Tham gia</button>
							</a>
							<p class="card-text">

								<small class="text-muted" style="margin: 50px 0;">Số
									lượng người tham gia : <%=kq%> /<%=rs.getString("soluongcothethamgia")%></small>
							</p>
						</div>
					</div>
				</div>
			</div>



		</div>

		<%
		}
		%>


		<%-- 		<div class="col-6">



			<div class="card mb-6 card-grid">
				<div class="row no-gutters card-grid">
					<div class="col-md-4">
						<img class="img-standart"
							src="${pageContext.request.contextPath}/views/img/meohou.jpg"
							alt="...">
					</div>
					<div class="col-md-8 card-grid">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
				</div>
			</div>




		</div> --%>

		<!-- Row -->
	</div>
	<%
	}
	%>




	<!-- tin tức  -->

	<%-- <h2 id="tintuc" style="text-align: center;">Tin tức</h2>
	<div class="row ctn">
		<div class="col">

			<div class="card mb-3">
				<img src="${pageContext.request.contextPath}/views/img/meohou.jpg"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>


		</div>
		<div class="col">

			<div class="card ">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
				<img src="${pageContext.request.contextPath}/views/img/test.jpg"
					class="card-img-top" alt="...">
			</div>


		</div>
	</div> --%>












	<!-- Footer  -->


	<section class="">
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


	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>










	<script type="text/javascript">
		$('.carousel').carousel({
			interval : 150
		})
	</script>


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
	$('#toanbo1').pagination({
	    dataSource: [1, 2, 3, 4, 5, 6, 7, ... , 100],
	    pageSize: 5,
	    showPrevious: false,
	    showNext: false,
	    callback: function(data, pagination) {
	        // template method of yourself
	        var html = template(data);
	        dataContainer.html(html);
	    }
	})
	</script>

	<script src="${pageContext.request.contextPath}/views/js/btntop.js"
		type="text/javascript"></script>


	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://pagination.js.org/dist/2.1.5/pagination.js"></script>
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