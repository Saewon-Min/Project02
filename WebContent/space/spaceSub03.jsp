<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../include/globalPhoto.jsp" %>
<%@ include file="../include/global.jsp" %>
    
<%@ include file="../include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

 
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />


        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../bootstrap4.6.0/css/styles.css" rel="stylesheet" />
</head>
<body>
<%
String id = (String)session.getAttribute("USER_ID");

%>
	<div class="jumbotron">
	<br /><br /><br /><br /><br />
     <div class="text-center" style="vertical-align: middle" >
            	<br />
                <h1 class="section-heading text-uppercase" >사진게시판</h1>
                <br />
            </div>

    </div>
    <div class="d-flex" id="wrapper">
		<%@ include file="../include/spaceLeft.jsp" %>


<div class="container-fluid">
			<!-- 새로 추가한 부분 -->
    
   
      <main id="main">

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio" style="margin-top: -200px">
      <div class="container" data-aos="fade-up">


        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-dog">dog</li>
              <li data-filter=".filter-cat">cat</li>
              <li data-filter=".filter-etc">etc.</li>
            </ul>
          </div>
        </div>

		<div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">
		<c:forEach items="${boardLists }" var="row" varStatus="loop">

          <div class="col-lg-4 col-md-6 portfolio-item ${row.photoflag }">
            <div class="portfolio-wrap">
              <img src="../Uploads/${row.sfile }" class="img-fluid" alt="첨부된사진">
              <div class="portfolio-info">
                <h4>${row.title }</h4>
                <p>${row.content }</p>
                <div class="portfolio-links">
                  <a href="../Uploads/${row.sfile }" data-gall="portfolioGallery" class="venobox" title="${row.title }"><i class="bx bx-plus"></i></a>
                  	<div class="dropdown dropright" style="bor"> 
                  	<button type="button" class="dropdown" data-toggle='dropdown'><i id="" class="material-icons" style="color:white;">more_vert</i></button>
                  	
                  	<div class="dropdown-menu">
                  		<a class="dropdown-item" href="../Project02/photo.editpass?mode=edit&idx=${param.idx}&flag=photo" style="font-size:15px; color:black;">수정</a>
                  		<a class="dropdown-item" href="../Project02/photo.editpass?mode=delete&idx=${param.idx}&flag=photo"  style="font-size:15px;color:black;">삭제</a>
                		
                	</div>
                	</div>	
                  	
                	
                </div>
              </div>
            </div>
          </div>


		</c:forEach>
		</div>

        <!-- 메모장에 옮긴 내용 자리-->

      </div>
    </section><!-- End Portfolio Section -->

  </main><!-- End #main -->
	
	
	
	
	
	
	<ul class="pagination d-flex justify-content-center" >
	
	${map.pagingImg }
	
	</ul>
	<ul class="pagination d-flex justify-content-end" >	
	<button type="button" class="btn btn-warning" onclick="location.href='../Project02/spacesub03.write?flag=photo';" style="width:130px; ">
	글쓰기
	</button>
	</ul>	
	
		

	
	
			</div>
        	</div>
        	
    
    
    
    
    <div id="preloader"></div>
    <a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>
    
        	
        	
  <!-- Vendor JS Files -->
  <script src="../assets/vendor/jquery/jquery.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>
  <script src="../assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="../assets/vendor/counterup/counterup.min.js"></script>
  <script src="../assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../assets/vendor/venobox/venobox.min.js"></script>
  <script src="../assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>
	
</body>
</html>