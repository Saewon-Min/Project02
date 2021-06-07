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
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>

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
      <input type="text" placeholder="Enter Username" name="user_id" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="user_pw" required>
        
      <button type="submit">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
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