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

	<div class="jumbotron">
	<br /><br /><br /><br /><br />
     <div class="text-center" style="vertical-align: middle" >
       	<br />
           <h1 class="section-heading text-uppercase" ></h1>
           <br />
     </div>

    </div>
    <div class="d-flex" id="wrapper">
    
	<%@ include file="../include/spaceLeft.jsp" %>
	<div class="container-fluid" align="center">
<form name="writeFrm" method="post" enctype="multipart/form-data"
	action="../Project02/multi.edit?flag=photo"
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
			<button type="button" style="width:auto;" class="btn btn-primary" onclick="location.href='../Project02/photo.list'">
				리스트바로가기
			</button>
</div>

</form>

	</div>
</div>
</body>
</html>

