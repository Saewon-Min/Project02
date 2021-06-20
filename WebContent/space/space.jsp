<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
<section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">열린공간</h2>
                    <h3 class="section-subheading text-muted">반려인들이 소통하는 공간입니다.</h3>
                </div>
                <div class="row text-center" style="background-color:white">
                    <div class="col-md-4" id="notice">
                        <span class="fa-stack fa-4x">
                           <a href="../Project02/notice.list">
                           <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-bell fa-stack-1x fa-inverse"></i>
							</a>
                        </span>
                        <h4 class="my-3">공지사항</h4>
                    </div>
                    <div class="col-md-4" id="schedule">
                        <span class="fa-stack fa-4x">
                        	<a href="../Project02/schedule.list">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-calendar-alt fa-stack-1x fa-inverse"></i>
                            </a>
                        </span>
                        <h4 class="my-3">정모 일정</h4>
                    </div>
                    <div class="col-md-4" id="photo">
                        <span class="fa-stack fa-4x">
                        	<a href="../Project02/photo.list">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-photo-video fa-stack-1x fa-inverse"></i>
                            </a>
                        </span>
                        <h4 class="my-3">사진게시판</h4>
                    </div>
                </div>
            </div>
        </section>
        
        
        
</body>
</html>