<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/slide.css" type="text/css" />

</head>
<body>
	    <!-- slide -->
            <div class="slideshow-container">
              <div class="mySlides fade">
                <div class="numbertext">1 / 3</div>
                <img src="img/meo ho u.jpg" style="width: 100% ;height : 500px" />
                <div class="text">Caption Text</div>
              </div>

              <div class="mySlides fade">
                <div class="numbertext">2 / 3</div>
                <img src="img/meo ho u.jpg "style="width: 100% ;height : 500px " />
                <div class="text">Caption Two</div>
              </div>

              <div class="mySlides fade">
                <div class="numbertext">3 / 3</div>
                <img src="img/test.jpg "style="width: 100% ;height : 500px" />
                <div class="text">Caption Three</div>
              </div>

              <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
              <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
            <br />

            <div style="text-align: center">
              <span class="dot" onclick="currentSlide(1)"></span>
              <span class="dot" onclick="currentSlide(2)"></span>
              <span class="dot" onclick="currentSlide(3)"></span>
            </div>
            
            
            
<script src="js/slide.js" type="text/javascript"></script>
</body>
</html>