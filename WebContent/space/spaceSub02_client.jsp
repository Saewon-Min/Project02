<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global.jsp" %>
    
<%@ include file="../include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String id = (String)session.getAttribute("USER_ID");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />


        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../bootstrap4.6.0/css/styles.css" rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
</head>
<body>
	<div class="jumbotron">
	<br /><br /><br /><br /><br />
     <div class="text-center" style="vertical-align: middle" >
            	<br />
                <h1 class="section-heading text-uppercase" >정모 일정</h1>
                <br />
            </div>

    </div>
    <div class="d-flex" id="wrapper">
    		<%@ include file="../include/spaceLeft.jsp" %>
            

<div class="container-fluid">
			
	
	<ul class="pagination d-flex justify-content-end" >	
	<% 

	if(session.getAttribute("USER_ID")!= null && session.getAttribute("USER_ID").equals("admin") ){
	%>
	<button type="button" class="btn btn-warning" onclick="location.href='../Project02/spacesub02.write?flag=schedule';" style="width:130px; ">
	글쓰기
	</button>
	<% 
	}
	%>
	</ul>
	
	</div>
      	</div>
      	
      	<%@ include file="../include/bottom.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../bootstrap4.6.0/js/js/scripts.js"></script>

</body>
</html>