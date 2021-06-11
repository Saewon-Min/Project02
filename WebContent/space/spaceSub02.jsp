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
			<form method="get">
				<table width="90%" style="border:none">
				<input type="hid den" name="user_id" value="<%=id %>" />
				
				<tr>
					<td align='center'>
						<select name="searchField">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="searchWord" />
						<input type="submit" value="검색하기" />
					</td>
				</tr>
				</table>
				</form>
			  <table class="table table-hover">
			    <thead>
			      <tr style="text-align: center">
					<th width="10%">번호</th>
					<th width="40%">제목</th>
					<th width="10%">작성자</th>
					<th width="10%">조회수</th>
					<th width="15%">작성일</th>
					<th width="15%">첨부파일</th>
			      </tr>
			    </thead>
		<c:choose>
		<c:when test="${empty boardLists }">
			<tr>
				<td colspan="5" align="center">
					등록된 게시물이 없습니다.
				</td>
			
			</tr>
	</c:when>
	<c:otherwise>
		<!-- 게시물이 있는 경우 확장 for문 형태의 forEach태그 사용 -->
		<c:forEach items="${boardLists }" var="row" varStatus="loop">

		<tr align="center">
			<td>
				${map.flagCount - (((map.pageNum-1) * map.pageSize)
					+ loop.index) }
			</td>
			<td align="left">
				<a href="../Project02/multi.view?idx=${row.idx }&flag=schedule">${row.title }</a>
			</td>
			<td>${row.name }</td>
			<td>${row.visitcount }</td>
			<td>${row.postdate }</td>
			<td>
			<!-- 첨부된 파일이 있는경우에만 다운로드 링크 출력됨 -->
			<c:if test="${not empty row.ofile }">
				<!-- 파일 다운로드 시 다운로드 횟수를 증가시켜야 하므로
					게시물의 일련번호가 필요함 -->
				<a href="../mvcboard/download.do?ofile=${row.ofile 
					}&sfile=${row.sfile }&idx=${row.idx }">[Down]</a>
			</c:if>
			</td>

		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
	</table>

	<ul class="pagination d-flex justify-content-center" >
	
	${map.pagingImg }
	
	</ul>
	<ul class="pagination d-flex justify-content-end" >	
	<button type="button" class="btn btn-warning" onclick="location.href='../Project02/spacesub02.write?flag=schedule';" style="width:130px; ">
	글쓰기
	</button>
	</ul>
	
	</div>
      	</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../bootstrap4.6.0/js/js/scripts.js"></script>

</body>
</html>