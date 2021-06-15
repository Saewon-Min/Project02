<%@page import="model2.mvcboard.MVCBoardDTO"%>
<%@page import="model2.mvcboard.MVCBoardDAO"%>
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
        <style type="text/css">
        
        
        
        </style>
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
			<% 
			if(session.getAttribute("USER_ID")!= null && session.getAttribute("USER_ID").equals("admin") ){

			%>
				<button type="button" onclick="location.href='../Project02/schedule.editpass?mode=edit&idx=${param.idx}&flag=schedule';" style="width:auto;" class="btn btn-primary">
				수정하기
				</button>
				<button type="button" onclick="location.href='../Project02/schedule.editpass?mode=delete&idx=${param.idx}&flag=schedule';" style="width:auto;" class="btn btn-primary">
					삭제하기
				</button>
				
			<% 
			}
			%>
				<button type="button" onclick="location.href='../Project02/schedule.list?flag=schedule';" style="width:auto; " class="btn btn-primary">
					리스트바로가기
				</button>

<script>
function commentValidate(f){
	if(f.name.value==""){
		alert("작성자를 입력하세요");
		f.name.focus();
		return false;
	}
	if(f.pass.value==""){
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return false;
	}
	if(f.comments.value==""){
		alert("댓글 내용을 입력하세요");
		f.comments.focus();
		return false;
	}
}
</script>
<br /><br /><br />
<div align="left">
<h2 style="background-color: lightyellow; width:150px;" >댓글</h2>
</div>
<form name="commentFrm" method="post" action="../Project02/commentWrite.comm?flag=schedule" onsubmit="return commentValidate(this);">
	<!-- 해당 게시물의 일련번호로 댓글 테이블의 참조키가 된다. -->
	<input type="hidden" name="board_idx" value="${param.idx }" />
	<table border="1" width="90%" class="table table-bordered" >
		<colgroup>
			<col width="30%"/>
			<col width="40%"/>
			<col width="*"/>
		</colgroup>
		<tr>
			<td>작성자 : <input type="text" name="name" size="10" /></td>
			<td colspan="2">비밀번호 : <input type="password" name="pass" size="10" /></td>
		</tr>
		<tr>
			<td colspan="3">
				<textarea name="comments" style="width:100%;height:70px;"></textarea>
			</td>
		</tr>
	</table>
	<div align="right">
		<button class="btn btn-primary" type="submit" style="width:auto;height:auto;" >댓글작성</button>
	
	</div>

</form>

<div align="left">
<h2 style="background-color: lightyellow; width:150px;">댓글 목록</h2>
</div>
<script>
function commentEdit(idx, board_idx) {
	window.open('../common/commentEdit.comm?idx='+idx+'&board_idx='+board_idx
			,'commentPop1','top=0,left=0,width=700,height=300');
}

function commentDelete(idx, board_idx) {
	window.open('../common/commentDelete.comm?idx='+idx+'&board_idx='+board_idx
			,'commentPop','top=0,left=0,width=700,height=300');
}


</script>
<%
String id = (String)session.getAttribute("USER_ID");
%>
<!-- 
	HTML5에서 지원하는 앵커(Ancher) 기능으로 해당 페이지에서 특정
	위치를 로드하고 싶을때 아래와 같이 <a태그에 name속성을 부여한다.
	사용시에는 쿼리스트링 마지막에 #앵커명 형태로 사용하면 된다.
-->
<a name="commentsList"></a>
<table border="1" width="90%" class="table table-bordered">
	<colgroup>
		<col width="30%" />
		<col width="40%" />
		<col width="*" />
	</colgroup>
	<c:choose>
		<c:when test="${empty comments }">
			<tr>
				<td colspan="3" align="center">
					등록된 댓글이 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items= "${comments }" var="row" varStatus="loop">
				<tr>
					<td>작성자 : ${row.name }</td>
					<td>작성일 : ${row.postdate }</td>
					
					<c:set var="id" value="<%=id %>" />

  					<c:if test="${id != null and row.id eq id }" var="index">   
						<td>
							<!-- 수정, 삭제를 위해 전달되는 파라미터는 댓글의 일련번호,
								해당 게시물의 일련번호 2개가 필요하다. -->
							<input type="button" value="수정" class="btn btn-primary"
								onclick="commentEdit(${row.idx }, ${row.board_idx });"/>
							<input type="button" value="삭제"  class="btn btn-primary"
								onclick="commentDelete(${row.idx }, ${row.board_idx });"/>
							
						</td>
					</c:if>
				</tr>
				<tr>
					<td colspan="3">${row.comments }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	
	</c:choose>


</table>



			</div>
			
			
			</div>
			
			
			
        	</div>
       <%@ include file="../include/bottom.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../bootstrap4.6.0/js/js/scripts.js"></script>
    
</body>
</html>