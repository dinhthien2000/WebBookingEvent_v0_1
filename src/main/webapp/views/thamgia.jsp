<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tham gia</title>


<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/css/not-fail.css" />

<style>

/* 	.form-control{
	
	margin-top: 15px; padding-right: 0; padding-left: 62%;
	} */
.disable {
	pointer-events: none;
	background: #dcedd5;
	/*display : none;*/
}

.homh2{

text-algin: center;

}
</style>

</head>
<body>




	<div class="container">


		<div style="margin: 0 10%;">
			<div style="margin: 20px 0px"></div>
			<h2>Đăng ký tham gia</h2>
			<div style="margin: 20px 0px"></div>
			<form action="${pageContext.request.contextPath}/thamgiaServlet" method="post">


				<div class="row">
					<div class="col">
						<div class="form-group">
							<label class=" " for="tensk">Tên sự kiện :</label> <input
								type="text" class="form-control disable" id="tensk"
								placeholder="Tên sự kiện" name="tensk" value="${param.tensk }">
						</div>


					</div>

				</div>


				<div class="row">
					<div class="col">
						<div class="form-group">
							<label class=" " for="bd">Thời gian bắt đầu :</label> <input
								type="date" class="form-control disable" id="bd"
								placeholder="Thời gian bắt đầu" name="bd" value="${param.bd }">
						</div>


					</div>

				</div>
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label class=" " for="kt">Thời gian kết thúc :</label>
							<input type="date" class="form-control disable" id="kt"
								placeholder="Thời gian kết thúc" name="kt" value="${param.kt }">
						</div>


					</div>

				</div>

				<div class="row">
					<div class="col">
						<div class="form-group">
							<label class=" " for="diadiem">Địa điểm :</label> <input
								type="text" class="form-control disable" id="diadiem"
								placeholder="Địa điểm " name="diadiem" value="${param.diadiem }">
						</div>


					</div>

				</div>

				<div class="row">
					<div class="col">
						<div class="form-group">
							<label class=" " for="nguoitao">Người tạo :</label> <input
								type="text" class="form-control disable" id="nguoitao"
								placeholder="Người tạo" name="nguoitao" value="${param.nguoitao }">
						</div>


					</div>

				</div>

				<div class="row">
					<div class="col">
						<div class="form-group">
							<label class="" for="hotendk">Họ tên đăng ký :</label> <input
								type="text" class="form-control" id="hotendk"
								placeholder="Họ tên đăng ký" name="hotendk" value="">
						</div>


					</div>

				</div>

				<div class="row">
					<div class="col">
						<div class="form-group">
							<label class="" for="mssv">Mã số sinh viên :</label> <input
								type="text" class="form-control" id="mssv"
								placeholder="Mã số sinh viên" name="mssv" value="">
						</div>


					</div>

				</div>

				<div class="row">
					<div class="col">
						<div class="form-group">
							<label class="" for="email">Email :</label> <input
								type="text" class="form-control" id="email" placeholder="Email"
								name="email" value="">
						</div>


					</div>

				</div>
				
				
				
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label class="" for="email">Số điện thoại :</label> <input
								type="number" class="form-control" id="sdt" placeholder="Số điện thoại"
								name="sdt" value="" maxlength="10">
						</div>


					</div>

				</div>





				<div class="row">
					<div class="col">

						<div
							style="margin-top: 15px; padding-right: 0; padding-left: 72%;">
							<button type="submit" class="btn btn-outline-success"
								style="width: 100px; height: 50px;">Đăng ký</button>
							<button type="reset" class="btn btn-outline-primary"
								style="width: 100px; height: 50px;">Làm mới</button>
						</div>

					</div>
				</div>
				<p class="homeh2" style="margin-bottom:40px;">
					<a href="${pageContext.request.contextPath}/views/chitietsk.jsp?tensk=${param.tensk}&diadiem=${param.diadiem}">Xem chi tiết</a>
				</p>
				<h2 class="homeh2" style="margin-bottom:40px;">
					<a href="${pageContext.request.contextPath}/views/homeB.jsp">Home page</a>
				</h2>
			</form>
			

		</div>


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