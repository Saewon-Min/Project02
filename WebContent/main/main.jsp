<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
    <%@ include file="../include/global.jsp" %>
		  <style>
		  /* Make the image fully responsive */
		   .carousel-inner img {
		    width: 100%; 
		    height: 80%;
		
		  } 
		  
		   .carousel-control-next-icon {
		      background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='white' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E");
		 		
		  }
		  .carousel-control-prev-icon {
		      background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='white' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E");
		
		  }
		  
		  
		  .text-center{
		  	background-color:#FFC800;
		  	
		  }
		  .text-center h2{
		  	color:white;
		  	
		  }
  </style> 
        
    </head>
    <body >
   	<%@ include file="../include/top.jsp" %>
        <!-- Navigation-->
	
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading" style="background-color: skyblue">Welcome To Our Homepage!</div>
                <div class="masthead-heading text-uppercase" style="color: black">It's Nice To Meet You</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
            </div>
            <div id="main_visual" style="margin-right:10%; margin-left:10%" >
			<br />
			<!-- 여기부터 메인화면 강아지 사진 탭 -->
			<div id="demo" class="carousel slide" data-ride="carousel">
		
			  <!-- Indicators -->
			  <ul class="carousel-indicators">
			    <li data-target="#demo" data-slide-to="0" class="active"></li>
			    <li data-target="#demo" data-slide-to="1"></li>
			    <li data-target="#demo" data-slide-to="2"></li>
			    <li data-target="#demo" data-slide-to="3"></li>
			  </ul>
			  
			  <!-- The slideshow -->
			  <div class="carousel-inner">
			    <div class="carousel-item active" >
			      <img src="../images/centerImage/walk.jpg" alt="walk Image" >
			    </div>
			    <div class="carousel-item" >
			      <img src="../images/centerImage/cat.jpg" alt="cat Image">
			    </div>
			    <div class="carousel-item" >
			      <img src="../images/centerImage/dog.jpg" alt="dog Image">
			    </div>
			    <div class="carousel-item" >
			      <img src="../images/centerImage/puppy.jpg" alt="puppy Image" >
			    </div>
			    
			  </div>
			  
			  <!-- Left and right controls -->
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon" ></span>
			  </a>
			</div>
		</div>
        </header>
        <!-- Services-->
        <%@ include file="../space/space.jsp" %>

        
        <!-- Team-->
        
        
        <%@ include file="../include/bottom.jsp" %>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../bootstrap4.6.0/js/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/map-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
