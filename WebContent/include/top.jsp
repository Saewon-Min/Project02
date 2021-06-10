<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>
<style>
	.nav-item{
	color:"white"; text-weight:"bold";
	}
	

.dropbtn {
  background-color: lightblue;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: skyblue;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
  background-color: info;
 
}
.navbar-toggler{
	width:70px;
}
#maptn{
width:70px;

}
.txtpwd  {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}


</style>

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
	
}



	
	
</script>

</head>
    
<body id="page-top">
	

<div id="top" style="border:0px solid #000;">
	

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color: lightblue">
       <div class="container">
       		<a href="../main/main.jsp"><img src="../images/topImage/logo_en.png" alt="로고사진" id="top_logo" 
				width=200 height=85/></a>
				
			 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"
			 	style="color:white;">
        		Menu
    		</button>
    			<div class="collapse navbar-collapse" id="navbarContent"  > 
				<ul class="navbar-nav mr-auto" >
				<li class="nav-item">

               
	               <div class="dropdown">
	                   
	                   <button class="dropbtn">
	                   	열린공간
	                   </button>
	                   
			           	<div class="dropdown-content">
			           		<a href="../Project02/notice.list?flag=notice">공지사항</a>
				           	<a href="../Project02/schedule.list?flag=schedule" >정모일정</a>
				           	<a href="../Project02/photo.list?flag=photo">사진게시판</a>
	               		</div>
	                </div>
	              </li>
	              <li class="nav-item">
	                <div class="dropdown">
	                   
	                   <button class="dropbtn">
	                   	커뮤니티
	                   </button>
	                   
			           	<div class="dropdown-content">
				           	<a href="../Project02/people.list?flag=people">반려인게시판</a>

	               		</div>
	                </div>
	                </li>
	              <li class="nav-item">
	                <div class="dropdown">
	                   
	                   <button class="dropbtn">
	                   	용품
	                   </button>
	                   
			           	<div class="dropdown-content">
				           	<a href="">사료</a>
				           	<a href="">간식</a>
				           	<a href="">장난감</a>

	               		</div>
	                </div>
	                &nbsp;&nbsp;
	                </li>
	              	<li class="nav-item">
	              	<div class="dropdown">
	                   <button class="dropbtn" id="mapbtn">
	                   	
              		 	<a href="../map/map.jsp" style="color:white; text-decoration: none">지도</a>
     					</button>
                	</div>
                	
               </li></ul>
               <ul class="navbar-nav ml-auto">
					<%
					/* 
						session영역에 회원 인증 정보가 없다면 로그아웃 상태이므로
						로그인 폼을 출력한다.
					*/
					if(session.getAttribute("USER_ID")==null){
						
					%>

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
               <li class="nav-item">
				<div>
					
					<div  align="center">
					<button id="btnModal" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">로그인</button>
					</div>
					<div id="id01" class="modal">
					  
					  <form class="modal-content animate"  method="post" action="../login.log" onsubmit="return loginValidate(this);">
					    <div class="imgcontainer">
					      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
					
					    </div>
					
					    <div class="container" style="width:50%">
					      <label for="uname"><b>UserID</b></label>
					      
					      	<span style="color:red; font-size:1.5em;" id="logDisplay">		
							
								<%-- <%=request.getAttribute("ERROR_MSG")==null ?
									"" : request.getAttribute("ERROR_MSG") %> --%>
							</span>
					      <input class="txtpwd" type="text" placeholder="Enter Username" name="user_id" required value="<%=loginId%>" />
					
					      <label for="psw"><b>Password</b></label>
					      <input class="txtpwd"  type="password" placeholder="Enter Password" name="user_pw" required>
					        
					      <button type="submit" id="subbtn">Login</button>
					      <label>
					        <input type="checkbox"  name="save_check" value="Y" <%=cookieCheck %>> Remember me
					      </label>
					    </div>
					
					    <div class="container" style="background-color:#f1f1f1">
					      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
					      <span class="psw">Forgot <a href="#">password?</a></span>
					    </div>
					  </form>
					</div>
				</div>
				</li>
			   <li class="nav-item">
				<div class="dropdown">
				<button class="dropbtn" onclick="location.href='../signUp/signUp.jsp';">
					회원가입
				</button>
				</div>
				</li> 
				</ul>
					<% }else{ %>
					<ul class="navbar-nav ml-auto">
					
					<li class="nav-item">
					<div>
					
					<div align="center">
					 <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">로그아웃</button>
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
					</div>
				</li>
				<li class="nav-item">

				<div class="dropdown">
				<button class="dropbtn" onclick="location.href='../signUp/signEdit.jsp';">
					회원정보수정
				</button>
				</div>
				</li>
					<% } %>
					
				
<!--                <li class="nav-item">
                	<div>
               		<a href="../login/login.jsp" style="color:white; text-decoration: none">로그인</a>
			    	</div>
			    </li>-->

               
               </ul>
	       </div>
           </div>
      
   </nav>

</div> 
</body>