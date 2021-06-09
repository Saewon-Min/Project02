<%@page import="homework.MembershipDTO"%>
<%@page import="homework.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MembershipDAO dao = new MembershipDAO();
String userid = request.getParameter("user_id"); //  사용자가 입력한것
boolean check = dao.memberCheck(userid);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id_overapping.jsp</title>
<script type="text/javascript">
	function idUse(f){
		
		<% if(check==false){%>
			opener.document.loginFrm.user_id.value = 
			document.overlapFrm.user_id.value;
		
			self.close();
		<%} %>
			
	}
	function idUse2(){
		
		opener.document.loginFrm.user_id.value = 
			document.overlapFrm.user_id.value;
		self.close();
		
		
	}
	
</script>
</head>
<body>
	
	<% if(check==true){ %>
	<div class="container" style="background-color: lightblue" align="center">
	<h2 style="color:white;">아이디 중복확인 하기</h2>

	<h3>사용자가 입력한 아이디 : ${param.user_id }</h3>
	<h3>중복된 아이디가 존재합니다</h3>
	<h3>새로운 아이디를 입력해주세요</h3>
	<form name="overlapFrm" onsubmit="return idUse(this.form);" >
		<input type="text" name="user_id" size="20" />
		<input type="submit" value="아이디사용하기"  />
	</form>
	</div>
	
	<% }else{  %>
	
	<div class="container" style="background-color: lightblue" align="center">
	
	<h2 style="color:white;">아이디 중복확인 하기</h2>

		<h3>사용자가 입력한 아이디 : ${param.user_id }</h3> 
		<h3>사용가능한 아이디입니다</h3>
		<form name="overlapFrm">
			<input type="hidden" name="user_id" value="${param.user_id }"/>
			<input type="button" value="아이디사용하기" onclick="idUse2();" />
		</form>
		</div>
		
	<% } %>
	  
	
	
	
	
	
</body>
</html>