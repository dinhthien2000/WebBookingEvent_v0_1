<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />

    <title>Home Page</title>
    <link rel="stylesheet" href="css/slide.css" type="text/css" />
    <link rel="stylesheet" href="css/grid.css" type="text/css"/>
    <link rel="stylesheet" href="css/btntop.css" type="text/css"/>
    <!-- Bootstrap CSS -->

    <style>
      ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
      }
      li {
        float: left;
      }

      li a {
        display: block;
        padding: 5px;

        display: inline;
      }
      table {
        width: 100%;
      }
    </style>
  </head>
  <body>
    <table>
      <thead>
        <tr>
          <th>
            <ul class="menu">
              <li><a href="home.html">Home</a></li>
              <li><a href="#sapdienra">Sự kiện sắp diễn ra</a></li>
              <li><a href="#toanbo">Toàn bộ sự kiện</a></li>
              <li><a href="#noitochuc">Nơi tổ chức</a></li>
            </ul>
          </th>
          <th>
            <ul>
              <div style="padding-left: 10px; align-items: right; float: right">
                <li><p></p></li>
                <li>
                  <a href="login.html"
                    ><button style="width: 80px; height: 30px">Login</button></a
                  >
                </li>
              </div>
            </ul>
          </th>
        </tr>
      </thead>

      <tbody>
        <tr>
          <p></p>
          <td style="padding: 50px 0" colspan="2">
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
          </td>
        </tr>

        <tr id="sapdienra">
          <!-- sắp diễn ra  -->
          <td colspan="2"style="padding: 50px 0">
            <h2 style="text-align: center">Sắp diễn ra</h2>
			
			
			
			
			<div class="grid">

						<article>
							<img src="img/meo ho u.jpg" alt="Sample photo">
							<div class="text">
								<h3>Seamlessly visualize quality</h3>
								<p>Collaboratively administrate empowered markets via
									plug-and-play networks.</p>
								<button>Here's why</button>
							</div>
						</article>
						<article>
							<img src="img/meo ho u.jpg" alt="Sample photo">
							<div class="text">
								<h3>Completely Synergize</h3>
								<p>Dramatically engage seamlessly visualize quality
									intellectual capital without superior collaboration and
									idea-sharing.</p>
								<button>Here's how</button>
							</div>
						</article>
						<article>
							<img src="img/meo ho u.jpg" alt="Sample photo">
							<div class="text">
								<h3>Dynamically Procrastinate</h3>
								<p>Completely synergize resource taxing relationships via
									premier niche markets.</p>
								<button>Read more</button>
							</div>
						</article>
						<article>
							<img src="img/meo ho u.jpg" alt="Sample photo">
							<div class="text">
								<h3>Best in class</h3>
								<p>Imagine jumping into that boat, and just letting it sail
									wherever the wind takes you...</p>
								<button>Just do it...</button>
							</div>
						</article>
						<article>
							<img src="img/meo ho u.jpg" alt="Sample photo">
							<div class="text">
								<h3>Dynamically innovate supply chains</h3>
								<p>Holisticly predominate extensible testing procedures for
									reliable supply chains.</p>
								<button>Here's why</button>
							</div>
						</article>
						<article>
							<img src="img/meo ho u.jpg" alt="Sample photo">
							<div class="text">
								<h3>Sanity check</h3>
								<p>Objectively innovate empowered manufactured products
									whereas parallel platforms.</p>
								<button>Stop here</button>
							</div>
						</article>


					</div>
           
           
           
           
          </td>
        </tr>

        <tr id="toanbo">
          <!-- toàn bộ -->
          <td colspan="2" style="padding: 50px 0">
            <h2 style="text-align: center">Toàn bộ</h2>

            <div class="container">
              <div class="row">
                <div class="col-sm-4 col-xs-6">
                  <div class="box-container">
                    <div class="box-img">
                      <img src="http://placeholders.org/320x250" />
                    </div>
                    <h4 class="box-title">box title or name</h4>
                    <div class="box-heading text-uppercase">
                      assignment time
                    </div>
                    <div class="box-btns">
                      <div class="btn-group">
                        <a class="btn btn-primary text-uppercase">profile</a>
                        <a class="btn btn-primary text-uppercase">quiz</a>
                        <a class="btn btn-primary text-uppercase">create</a>
                      </div>
                    </div>
                    <div class="box-id">001</div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-6">
                  <div class="box-container">
                    <div class="box-img">
                      <img src="http://placeholders.org/320x250" />
                    </div>
                    <h4 class="box-title">box title or name</h4>
                    <div class="box-heading text-uppercase">
                      assignment time
                    </div>
                    <div class="box-btns">
                      <div class="btn-group">
                        <a class="btn btn-primary text-uppercase">profile</a>
                        <a class="btn btn-primary text-uppercase">quiz</a>
                        <a class="btn btn-primary text-uppercase">create</a>
                      </div>
                    </div>
                    <div class="box-id">002</div>
                  </div>
                </div>
                <div class="col-sm-4 col-xs-6">
                  <div class="box-container">
                    <div class="box-img">
                      <img src="http://placeholders.org/320x250" />
                    </div>
                    <h4 class="box-title">box title or name</h4>
                    <div class="box-heading text-uppercase">
                      assignment time
                    </div>
                    <div class="box-btns">
                      <div class="btn-group">
                        <a class="btn btn-primary text-uppercase">profile</a>
                        <a class="btn btn-primary text-uppercase">quiz</a>
                        <a class="btn btn-primary text-uppercase">create</a>
                      </div>
                    </div>
                    <div class="box-id">003</div>
                  </div>
                </div>
              </div>
            </div>
          </td>
        </tr>

        <tr id="noitochuc">
      

          <td colspan="2" style="padding: 50px 0">
            <h2 style="padding: 50px 0 ; text-align: center;">Nơi tổ chức</h2>
            
            
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

          </td>
        </tr>

        <tr>
            <td colspan="2">
                <!-- footer -->
            </td>
        </tr>

      </tbody>
    </table>
    <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
    <script src="js/slide.js" type="text/javascript"></script>
    <script src="js/btntop.js" type="text/javascript"></script>
  </body>
</html>
