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
<html lang="en">
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
#hidden{

	display:none;
}

 #table tr{
                cursor: pointer;transition: all .25s ease-in-out;
            }
 #table tr:hover{background-color: violet;}
</style>
<title>Hello, world!</title>
</head>
<body>


	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">Navbar</a>
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

		<div class="tabsss">

			<ul class="nav nav-tabs" id="myTab" role="tablist">

				<li class="nav-item" role="presentation"><a
					class="nav-link active" id="home-tab" data-toggle="tab"
					href="#home" role="tab" aria-controls="home" aria-selected="true">Xem
						sự kiện đã tạo</a></li>

				<li class="nav-item" role="presentation"><a class="nav-link"
					id="contact-tab" data-toggle="tab" href="#contact" role="tab"
					aria-controls="contact" aria-selected="false">Thông tin cá nhân</a></li>

				<li class="nav-item" role="presentation"><a class="nav-link"
					id="profile-tab" data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">Đổi mật khẩu</a></li>

			</ul>





			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">

					<h2 class="header">Sự kiện đã tạo</h2>


					<table class="table" id="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">#</th>
								<th scope="col">Tên sự kiện</th>
								<th scope="col">Thời gian bắt đầu</th>
								<th scope="col">Thời gian kết thúc</th>
								<th scope="col">Địa điểm</th>
								<th scope="col">Người đã tham gia</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							
							<%
								Connection connection =connect.getConnection();	
								String username = (String) session.getAttribute("user");
								
								
								
								
								%>
							
							
							<%
								String XEMNgSUKIEN_STRING= "Select * from taosukien where nguoitao=?;";
								PreparedStatement preparedStatement = connection.prepareStatement(XEMNgSUKIEN_STRING);
								preparedStatement.setString(1, username);
								
								ResultSet rs= preparedStatement.executeQuery();
								
								while(rs.next()){
									DateSQLConvert c = new DateSQLConvert();
									String bd =c.date(rs.getDate("tgbatdau"));
									String kt =c.date(rs.getDate("tgketthuc"));
							%>
							<tr class="">
								<td><%=rs.getInt("idsk") %> </td>
								<td><%=rs.getString("tensk") %> </td>
								<td><%=bd %> </td>
								<td><%=kt %> </td>
								<td><%=rs.getString("diadiem") %> </td>
								<td>
								<button type="button" class="btn btn-outline-warning" onclick="hiddenform()" >Chỉnh	sửa</button>
								</td>
							</tr>			
							<%} %>
							
						</tbody>
					</table>

					<div >

						<form action="" method="post" id="hidden">
							<table>
								<h2 style="text-align: center">Chỉnh sửa</h2>
								<tr>
									<td>Tên sự kiện</td>
									<td><input type="text" id="tensk" name="tensk" placeholder="Tên sự kiện"/></td>
								</tr>
								<tr>
									<td>Ngày bắt đầu</td>
									<td><input type="text" id="bd" name="bd" placeholder="" value=""/></td>
								</tr>
								
								<tr>
									<td>Ngày kết thúc</td>
									<td><input type="text" id="kt" name="kt" placeholder="" value=""/></td>
								</tr>
								
								<tr>
									<td>Địa điểm</td>
									<td><input type="text" id="diadiem" name="diadiem" placeholder="Địa điểm" /></td>
								</tr>
								
								
								
								<tr>
									<td></td>


									<td>
										<button type="submit" class="btn btn-outline-primary">Sửa</button>
										<button type="submit" class="btn btn-outline-danger">Xóa</button>  
									</td>
								</tr>
								
								</table>
									

									
						</form>


					</div>




				</div>


				

				<div class="tab-pane fade" id="contact" role="tabpanel"
					aria-labelledby="contact-tab">

					<h2 class="header"></h2>

					<div >

						<form action="" method="post" id="">
							<table>
								<h2 style="text-align: center">Thông tin cá nhân</h2>
								<tr>
								<td>
								<input type="button" id="lock" value="chỉnh sửa" onclick="toggleEnable()" />
								</td>
								</tr>
								
								
								<%
								String sql= "Select * from user where username=?;";
								preparedStatement = connection.prepareStatement(sql);
								preparedStatement.setString(1, username);
								
								rs= preparedStatement.executeQuery();
								
								while(rs.next()){

									
								%>
								<tr>
									<td>Họ tên</td>
									<td><input type="text" id="hoten" name="hoten" placeholder="Họ tên" value="<%=rs.getString("hoten")%>"  disabled /></td>
								</tr>
								<tr>
									<td>Số điện thoại</td>
									<td><input type="number" id="sdt" name="sdt" placeholder="Số điện thoại" value="<%=rs.getString("sdt")%>" disabled /></td>
								</tr>
								
								<tr>
									<td>Email</td>
									<td><input type="email" id="email" name="email" placeholder="Email" value="<%=rs.getString("email")%> " disabled/></td>
								</tr>
								
								<tr>
									<td>Giới tính :</td>
									<%if(rs.getBoolean("gioitinh")==true){ %>
									<td>
									<input id="n" type="radio" name="gioitinh" value="true" checked disabled /><span>Nam</span>
									<input  id="nu" type="radio" name="gioitinh" value="false" disabled /><span>Nu</span>
									</td>
									<td>
									<%}else{ %>
										<input id="n" type="radio" name="gioitinh" value="true" disabled /><span>Nam</span>
										<input id="nu" type="radio" name="gioitinh" value="false" checked disabled /><span>Nu</span>
										
									<%} %>
									</td>
								</tr>
								
								<% } %>
								
								<tr>
									<td></td>


									<td>
										<button type="submit" class="btn btn-outline-primary">Sửa</button>
										<button type="submit" class="btn btn-outline-danger">Xóa</button>  
									</td>
								</tr>
								
								</table>
									

									
						</form>


					</div>



				</div>
			</div>






			<div class="tab-pane fade" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">

				<h2 class="header"></h2>

					<form action="" method="post" id="hidden">
							<table>
								<h2 style="text-align: center">Đổi mật khẩu</h2>
								<tr>
									<td>Mật khẩu cũ</td>
									<td><input type="password" id="mkc" name="mkc" placeholder=""/></td>
								</tr>
								<tr>
									<td>Mật khẩu mới</td>
									<td><input type="password" id="mkm" name="mkm" placeholder="" value=""/></td>
								</tr>
																
								
								
								<tr>
									<td>
										<p></p>
									</td>


									<td>
										<button type="submit" class="btn btn-outline-primary">Sửa</button>
										<button type="submit" class="btn btn-outline-danger">Xóa</button>  
									</td>
								</tr>
								
								</table>
									

									
						</form>




			</div>

			<!-- <input type="submit" id="lock1" value="chỉnh sửa"
				onclick="toggleEnable()" /> <input type="text" id="m"
				class="disable1 input" disabled /> <input type="text" id="s"
				class="disable1 input" disabled />


			<div></div> -->






			<script type="text/javascript">
				function toggleEnable() {

					document.getElementById("hoten").disabled = false;
					document.getElementById("sdt").disabled = false;
					document.getElementById("email").disabled = false;
					document.getElementById("n").disabled = false;
					document.getElementById("nam").disabled = false;
					

				}
				
				
				function hiddenform() {
					  var x = document.getElementById("hidden");
					  if (x.style.display === "none") {
						    x.style.display = "block";
						  } else {
						    x.style.display = "none";
						  }					
					  }
				var tbl = document.getElementById('table'); // id cuar bang
				for (var i = 1; i < tbl.rows.length; i++){
					tbl.rows[i].onclick  = function(){
						// id cua input
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