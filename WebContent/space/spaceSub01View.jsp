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

			
			<div class="container-fluid" >
			<table class="table table-bordered" width="90%" style="background-color: white; vertical-align: center;">
		    <colgroup>
		   	 <col width="15%"/>
		   	 <col width="35%"/>
		   	 <col width="15%"/>
		   	 <col width="*"/>
		    </colgroup>
		    <tr>
		   	 <th>번호</th>
		   	 <td>${dto.idx }</td>
		   	 <th>작성자</th>
		   	 <td>${dto.name }</td>
		    </tr>
		    <tr>
		   	 <th>작성일</th>
		   	 <td>${dto.postdate }</td>
		   	 <th>조회수</th>
		   	 <td>${dto.visitcount }</td>
		    </tr>
		    <tr>
		   	 <th>제목</th>
		   	 <td colspan="3"  style="text-align:left">${dto.title }</td>
		    </tr>
		    <tr >
		   	 <th cellpadding ="60px">내용</th>
		   	 <td colspan="3" height="100" style="text-align:left">${dto.content }</td>
		   	 
		    </tr>
		    <tr>
		   	 <th>첨부파일</th>
		   	 <td>
		   	 <!-- 첨부한 파일이 있을때만 다운로드 링크 활성화 -->
		   	 <c:if test="${not empty dto.ofile }">
		   		 ${dto.ofile } <!-- 기존 파일명 출력 -->
		   		 <a href="../mvcboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile }&idx=${dto.idx }">
		   			 [다운로드]
		   		 </a>   	 
		   	 </c:if>   	 
		   	 </td>
		   	 <th>다운로드수</th>
		   	 <td>${dto.downcount }</td>
		    </tr>
		    </table>
		    
		    
		    <div align="right">

				<button type="button" onclick="location.href='../Project02/notice.editpass?mode=edit&idx=${param.idx}&flag=notice';" style="width:auto;" class="btn btn-primary">
				수정하기
				</button>
				<button type="button" onclick="location.href='../Project02/notice.editpass?mode=delete&idx=${param.idx}&flag=notice';" style="width:auto;" class="btn btn-primary">
					삭제하기
				</button>
				<button type="button" onclick="location.href='../Project02/notice.list?flag=notice';" style="width:auto; " class="btn btn-primary">
					리스트바로가기
				</button>

			</div>
			
			
			</div>
			
			
			
        	</div>
       
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../bootstrap4.6.0/js/js/scripts.js"></script>
    
</body>
</html>