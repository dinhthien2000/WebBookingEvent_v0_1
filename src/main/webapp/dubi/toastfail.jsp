<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/not-fail.css" />


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
</head>
<body>
	<div class="notification-fail" id="noti">

		<div class="col headerfail">
			<p>Thông báo</p>

		</div>


		<div class="col bodyfail">
			<p>Thất bại</p>
			
		</div>

	</div>
	<script>
	
	const targetDiv = document.getElementById("noti");
	const btn = document.getElementById("noti");
	btn.onclick = function () {
	  if (targetDiv.style.display !== "none") {
	    targetDiv.style.display = "none";
	  } else {
	    targetDiv.style.display = "block";
	  }
	};
	</script>
</body>
</html>