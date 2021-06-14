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

	   	 if(f.photoflag.value==""){
	   		 alert('첨부파일 카테고리를 선택해주세요')
	   		 return false;
	   	 }
	   	 
	   	if(f.ofile.value==""){
	  		 alert('사진을 첨부해주세요')
	  		 return false;
	  	 }
	
	
	}
	

	
	
	
</script>
</head>
<body>
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
                 공지사항게시판
              </div>
              <div class="card-body">    
    
	
	
	
	
	
    <div class="d-flex" id="wrapper">
    
	
	<div class="container-fluid" align="center">
<form name="writeFrm" method="post" enctype="multipart/form-data"
	action="../Project02/editAction.admin?flag=photo"
	onsubmit="return formValidate(this);">

	<input type="hid den" name="idx" value=${dto.idx } /><!-- 일련번호 -->
	<input type="hid den" name="prevOfile" value=${dto.ofile } /><!-- 원본 파일명 -->	
	<input type="hid den" name="prevSfile" value=${dto.sfile } /><!-- 저장된 파일명 -->	
	<input type="hid den" name="prevSfile" value=${param.flag } />
<table class="table table-bordered" border="1" width="90%">
	<tr>
		<td>작성자</td>
		<td>
			<input type="text" name="name" style="width:150px;" value="${dto.name }" />
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="title" style="width:90%;" value="${dto.title }" />
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width:90%;height:100px;">${dto.content }</textarea>
		</td>
	</tr>
	<tr>
   	 <td>첨부파일 카테고리</td>
   	 <td style="font-weight:bold">
   		 강아지 <input type="radio" name="photoflag" value="filter-dog"/>&nbsp;&nbsp;&nbsp;
   		 고양이 <input type="radio" name="photoflag" value="filter-cat"/>&nbsp;&nbsp;&nbsp;
   		 그 외 반려동물 <input type="radio" name="photoflag" value="filter-etc"/>
   	 </td>
    </tr>
	<tr>
		<td>첨부파일</td>
		<td>
		<!-- 만약 첨부된 파일이 있다면 이미지를 나타낸다 -->
		<c:if test="${not empty dto.ofile }">		
			<img src="../Uploads/${dto.sfile }" style="width:100px" />
			<br />
		</c:if>
			<input type="file" name="ofile" /> 
		</td>
	</tr>	
</table>	
<div align="right">

			<button type="submit" style="width:auto;" class="btn btn-primary">작성완료</button>
			<button type="reset" style="width:auto;" class="btn btn-primary">RESET</button>
			<button type="button" style="width:auto;" class="btn btn-primary" onclick="location.href='../Project02/photoAdmin.list'">
				리스트바로가기
			</button>
</div>

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

