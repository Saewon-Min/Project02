<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global.jsp" %>
    
<%@ include file="../include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login.jsp</title>

<%@ include file="../include/logincss.jsp" %>
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function loginValidate(fn){
	if(!fn.user_id.value){
		alert("아이디를 입력하세요");
		fn.user_id.focus();
		return false;
	}
	if(fn.user_pw.value==""){
		alert("패스워드를 입력하세요");
		fn.user_pw.focus();
		return false;
	}

</script>

</head>
<body>



<br /><br /><br /><br /><br /><br /><br /><br />

<%
// 체크박스 체크용 변수
String cookieCheck = "";
// 쿠키명이 loginId 인 쿠키값을 읽어온다.
String loginId =CookieManager.readCookie(request, "loginId");
// 빈값이 아니면
if(!loginId.equals("")){
	// 체크용 변수에 checked를 할당
	cookieCheck = "checked";
}
%>

<!-- 
	로그인에 실패한 경우 request영역에 속성을 저장한 후
	로그인 페이지로 포워드 하면 그 영역이 공유되어 아래
	메세지가 출력된다.
 -->
<span style="color:red; font-size:1.5em;">		
	
	<%=request.getAttribute("ERROR_MSG")==null ?
		"" : request.getAttribute("ERROR_MSG") %>
</span>

<%
/* 
	session영역에 회원 인증 정보가 없다면 로그아웃 상태이므로
	로그인 폼을 출력한다.
*/
if(session.getAttribute("USER_ID")==null){
%>
<h2 align="center">로그인 페이지</h2>
<div  align="center">
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
</div>
<div id="id01" class="modal">
  
  <form class="modal-content animate"  method="post" action="../login.log" onsubmit="return loginValidate(this);">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>

    </div>

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="user_id" required value="<%=loginId%>">

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="user_pw" required>
        
      <button type="submit">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember" value="Y" <%=cookieCheck %>> Remember me
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>
</div>

<% }else{ %>
<h2 align="center">로그아웃 페이지</h2>
<div align="center">
 <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Logout</button>
</div>
<div id="id01" class="modal">
  
  <form class="modal-content animate" action="../logout.log" >
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>

    </div>

    <div class="container" align="center" >
    	<p>
		${sessionScope.USER_NAME } 회원님
					<br />
					로그아웃 하시겠습니까?
				<br />
				
    	</p>
      <button type="submit">Logout</button>

    </div>


  </form>
</div>

<% } %>






</body>


</html>