<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ include file="../admin/topHead.jsp" %>
    <%@ include file="../include/global.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <link href="../bootstrap4.6.0/css/styles.css" rel="stylesheet" />
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
<body class="sb-nav-fixed">
        <%@ include file="../admin/topNav.jsp" %>
        <div id="layoutSidenav">
            <%@ include file="../admin/leftsidenav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Tables</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="../Project02/noticeAdmin.list">공지사항</a></li>
                    <li class="breadcrumb-item "><a href="../Project02/scheduleAdmin.list">정모일정</a></li>
                    <li class="breadcrumb-item "><a href="../Project02/photoAdmin.list">사진게시판</a></li>
                    <li class="breadcrumb-item "><a href="../Project02/peopleAdmin.list">반려인게시판</a></li>
                    
                </ol>  
                
          <div class="card mb-4">
              <div class="card-header">
                  <i class="fas fa-table me-1"></i>
                게시판
              </div>
              <div class="card-body">    


    <div class="d-flex" id="wrapper">
    
	<div class="container-fluid" align="center">
	<form name="writeFrm" method="post" enctype="multipart/form-data"
	    action="../Project02/adminWriteAction.admin?flag=${param.flag }" onsubmit="return formValidate(this);">
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
   		 <button type="button" onclick="location.href='../Project02/noticeAdmin.list';">
   			 리스트바로가기
   		 </button>
   	 </td>
    </tr>
</table>    
</form>
	
</div>
</div>


</div>
      	</div>
            </div>
      	</main>
           </div>
           </div>
                
         <footer class="py-4 bg-light mt-auto">
             <div class="container-fluid px-4">
                 <div class="d-flex align-items-center justify-content-between small">
                     <div class="text-muted">Copyright &copy; Your Website 2021</div>
                     <div>
                         <a href="#">Privacy Policy</a>
                         &middot;
                         <a href="#">Terms &amp; Conditions</a>
                     </div>
                 </div>
             </div>
         </footer>
           
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>






</body>
</html>

