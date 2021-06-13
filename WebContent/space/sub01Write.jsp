<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/global.jsp" %>
    
<%@ include file="../include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판</title>
<link href="../bootstrap4.6.0/css/styles.css" rel="stylesheet" />

<script type="text/javascript">
    function formValidate(f){
   	 if(f.name.value==""){
   		 alert("작성자를 입력하세요");
   		 f.name.focus();
   		 return false;
   	 }
   	 if(f.title.value==""){
   		 alert("제목을 입력하세요");
   		 f.title.focus();
   		 return false;
   	 }
   	 if(f.content.value==""){
   		 alert("내용을 입력하세요");
   		 f.content.focus();
   		 return false;
   	 }
   	 if(f.pass.value==""){
   		 alert("비밀번호를 입력하세요");
   		 f.pass.focus();
   		 return false;
   	 }
    }
</script>  
<style type="text/css">
button{
	width:auto;
}

</style> 
</head>
<%
String id = (String)session.getAttribute("USER_ID");

%>


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
	<div class="container-fluid" align="center">
	<form name="writeFrm" method="post" enctype="multipart/form-data"
	    action="../Project02/spacesub01.write?flag=notice" onsubmit="return formValidate(this);">
	<table width="90%">
	<input type="hid den" name="user_id" value="<%=id %>" />
	<input type="hid den" name="flag" value="${param.flag }" />
    <tr>
   	 <td>작성자</td>
   	 <td>
   		 <input type="text" name="name" style="width:150px;" />
   	 </td>
    </tr>
    <tr>
   	 <td>제목</td>
   	 <td>
   		 <input type="text" name="title" style="width:90%;" />
   	 </td>
    </tr>
    <tr>
   	 <td>내용</td>
   	 <td>
   		 <textarea name="content" style="width:90%;height:100px;"></textarea>
   	 </td>
    </tr>
    <tr>
   	 <td>첨부파일</td>
   	 <td>
   		 <input type="file" name="ofile" />
   	 </td>
    </tr>
    <tr>
   	 <td>비밀번호</td>
   	 <td>
   		 <input type="password" name="pass" style="width:100px;" />
   	 </td>
    </tr>
    <tr>
   	 <td colspan="2" align="right" >
   		 <button type="submit">작성완료</button>
   		 <button type="reset">RESET</button>
   		 <button type="button" onclick="location.href='../Project02/notice.list?flag=notice';">
   			 리스트바로가기
   		 </button>
   	 </td>
    </tr>
</table>    
</form>
	
</div>
</div>


    <%@ include file="../include/bottom.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../bootstrap4.6.0/js/js/scripts.js"></script>








</body>
</html>

