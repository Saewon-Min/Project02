<%@page import="homework.MembershipDTO"%>
<%@page import="homework.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MembershipDAO dao = new MembershipDAO();
String id = request.getParameter("id"); //  사용자가 입력한것
MembershipDTO dto = dao.memberView(id);




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>id_overapping.jsp</title>
<script type="text/javascript">
function idUse(f){
	try{
		
		MembershipDTO dto = dao.memberView(f.retype_id);
		if(!dto.getId().equals(null)){
		opener.document.loginFrm.user_id.value = 
			document.overlapFrm.retype_id.value;
		self.close();
	
	}catch(NullPointerException e){
		alert('중복된 아이디가 존재합니다');
	}
	
}
</script>
</head>
<body>
	<div class="container" style="background-color: lightblue" align="center">
	
	<%   
	try{
	if(!dto.getId().equals(null)){ %>
	<h2 style="color:white;">아이디 중복확인 하기</h2>

	<h3>사용자가 입력한 아이디 : <%=request.getParameter("id") %></h3>
	<h3>중복된 아이디가 존재합니다</h3>
	<h3>새로운 아이디를 입력해주세요</h3>
	<form name="overlapFrm">
		<input type="text" name="retype_id" size="20" />+
		<input type="button" value="아이디사용하기" onclick="idUse(this.form);" />
	</form>
	</div>
	
	<% }
	}catch(NullPointerException e){ %>
	
	
	
	<h2 style="color:white;">아이디 중복확인 하기</h2>
	
	<!-- JSP의 request내장객체의 getParameter()를 통해 파라미터를 받아온다. --> 
	<h3>사용자가 입력한 아이디 : <%=request.getParameter("id") %></h3>
	
	<h3>사용가능한 아이디입니다</h3>
	<form name="overlapFrm">
		<input type="button" value="아이디사용하기" onclick="idUse(this.form);" />
	</form>
	
	<% } %>
	
	
	
	
	
	
</body>
</html>