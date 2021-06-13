<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <link href="../bootstrap4.6.0/css/styles.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function deleteCheck() {
		var con = confirm("해당 댓글을 삭제하시겠습니까?");
		if(con==true){
			alert("댓글이 삭제되었습니다.");
			return true;
		}else{
			alert("삭제가 취소되었습니다.");
			return false;
		}
		
	}

</script>


</head>
<body>
<div class="container" style="background-color: skyblue; margin-top:5%;" align="center" >
	<h2 style="color:white;">댓글 삭제 페이지</h2>
	<form name="writeFrm" method="post" 
	action="./commentDeleteAction.comm"
	onsubmit="return deleteCheck();">

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
		<td colspan="4">
			<textarea name="comments" style="width:90%;height:100px;">${dto.comments }</textarea>
		</td>
	</tr>
	<tr align="center">    
		<td colspan="4">
			<button type="submit" class="btn btn-primary">삭제하기</button>
		</td>
	</tr>
</table>	
</form>
<br />
</div>
</body>
</html>