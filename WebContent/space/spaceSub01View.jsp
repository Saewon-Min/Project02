<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global.jsp" %>
    
<%@ include file="../include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />


        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../bootstrap4.6.0/css/styles.css" rel="stylesheet" />
</head>
<body>

	<div class="jumbotron">
	<br /><br /><br /><br /><br />
     <div class="text-center" style="vertical-align: middle" >
       	<br />
           <h1 class="section-heading text-uppercase" >공지사항</h1>
           <br />
       </div>

    </div>
    <div class="d-flex" id="wrapper">
		<%@ include file="../include/spaceLeft.jsp" %>

			
			<div class="container-fluid">
			<table border="1" width="90%">
		    <colgroup>
		   	 <col width="15%"/>
		   	 <col width="35%"/>
		   	 <col width="15%"/>
		   	 <col width="*"/>
		    </colgroup>
		    <tr>
		   	 <td>번호</td>
		   	 <td>${dto.idx }</td>
		   	 <td>작성자</td>
		   	 <td>${dto.name }</td>
		    </tr>
		    <tr>
		   	 <td>작성일</td>
		   	 <td>${dto.postdate }</td>
		   	 <td>조회수</td>
		   	 <td>${dto.visitcount }</td>
		    </tr>
		    <tr>
		   	 <td>제목</td>
		   	 <td colspan="3">${dto.title }</td>
		    </tr>
		    <tr>
		   	 <td>내용</td>
		   	 <td colspan="3" height="100">${dto.content }</td>
		    </tr>
		    <tr>
		   	 <td>첨부파일</td>
		   	 <td>
		   	 <!-- 첨부한 파일이 있을때만 다운로드 링크 활성화 -->
		   	 <c:if test="${not empty dto.ofile }">
		   		 ${dto.ofile } <!-- 기존 파일명 출력 -->
		   		 <a href="../mvcboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile }&idx=${dto.idx }">
		   			 [다운로드]
		   		 </a>   	 
		   	 </c:if>   	 
		   	 </td>
		   	 <td>다운로드수</td>
		   	 <td>${dto.downcount }</td>
		    </tr>
			</table>
			</div>
        	</div>
       
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../bootstrap4.6.0/js/js/scripts.js"></script>
    
</body>
</html>