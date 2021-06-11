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
		var flag = "<%=request.getParameter("flag")%>";
		
		if(f.pass.value==""){
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
	
		if(flag.equals("notice")){
			
			f.action = "../Project02/notice.editpass?flag=notice";
		}else if(flag.equals("schedule")){
			f.action = "../Project02/schedule.editpass?flag=schedule";
		}else if(flag.equals("photo")){
			f.action = "../Project02/photo.editpass?flag=photo";
		}else if(flag.equals("people")){
			f.action = "../Project02/people.editpass?flag=people";
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

	<form name="writeFrm" method="post" action=""
		onsubmit="return formValidate(this);">

	<!--  
		idx : 게시물의 일련번호
		mode : 게시물의 수정 혹은 삭제를 위한 구분값
		※ hidden 입력 상자는 화면상에서 보이지 않기때문에 값이 입력됐는지
			확인하기 위해 소스보기 혹은 개발자 모드를 사용해야 한다.
			특히 EL을 사용하는 경우에는 에러가 발생하지 않으므로
			값이 있는지 반드시 확인해야 한다.
	-->
	<input type="hid den" name="idx" value=${param.idx } />	
	<input type="hid den" name="mode" value=${mode } />	
	<input type="hid den" name="flag" value=${param.flag } />	
	<div style=" background-color: lightyellow; width:50%; border-radius: 10px">
	<br /><br /><br />
	<table width="50%">
		<tr align="center">
			<td>비밀번호&nbsp;&nbsp; : &nbsp;&nbsp; <input type="password" name="pass" style="width:100px;" />
			</td>
		</tr>
	</table>
	
	<div align="center">
	<br /><br /><br />
		<button type="submit" style="width:auto;" class="btn btn-primary">검증하기</button>
		<button type="reset" style="width:auto;" class="btn btn-primary">RESET</button>

	
	</div>
	<br /><br /><br />
	</div>
		
		
	</form>
	
	</div>
</div>
	
</body>
</html>
	