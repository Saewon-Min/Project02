<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>  
        <link href="../bootstrap4.6.0/css/styles.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>댓글 수정하기</title>
<script type="text/javascript">
	function formValidate(f){
		if(f.name.value==""){
			alert("작성자를 입력하세요");
			f.name.focus();
			return false;
		}
		if(f.postdate.value==""){
			alert("날짜를 입력하세요");
			f.postdate.focus();
			return false;
		}
		if(f.comments.value==""){
			alert("내용을 입력하세요");
			f.comments.focus();
			return false;
		}
		if(f.pass.value==""){
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
	}
	

	
</script>
</head>
<body>
<div class="container" style="background-color: skyblue; margin-top:5%;" align="center" >
<h2 style="color:white;">댓글 수정하기(comment Edit)</h2>

<form name="writeFrm" method="post" 
	action="./commentEditAction.comm"
	onsubmit="return formValidate(this);">

	<input type="hidden" name="idx" value=${dto.idx } /><!-- 댓글 일련번호 -->	
	<input type="hidden" name="board_idx" value=${dto.board_idx } />
	<%-- <input type="hid den" name="pass" value=${dto.pass } /> --%>

<table width="90%" class="table table-bordered" style="background-color: lightyellow">
	<tr>
		<td>작성자</td>
		<td>
			<input type="text" name="name" style="width:150px;" value="${dto.name }" />
		</td>

		<td>비밀번호</td>
		<td>
			<input type="text" name="pass" style="width:90%;" value="" />
		</td>
	</tr>
	<tr>
		<td>댓글</td>
		<td colspan="6">
			<textarea name="comments" style="width:90%;height:100px;">${dto.comments }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="6" align="center">
			<button type="submit" class="btn btn-primary">작성완료</button>
			<button type="reset" class="btn btn-primary">RESET</button>

		</td>
	</tr>
	
</table>	
</form>
<br />
</div>
</body>
</html>

