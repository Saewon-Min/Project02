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
</style>

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
				           	<a href="../space/spaceSub01.jsp"><a href="../mvcboard/list.do">공지사항</a></a>
				           	<a href="../space/spaceSub02.jsp">정모일정</a>
				           	<a href="../space/spaceSub03.jsp">사진게시판</a>
	               		</div>
	                </div>
	              </li>
	              <li class="nav-item">
	                <div class="dropdown">
	                   
	                   <button class="dropbtn">
	                   	커뮤니티
	                   </button>
	                   
			           	<div class="dropdown-content">
				           	<a href="">반려인게시판</a>

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
	              	<div>
	                   <button class="dropbtn">
	                   	
              		 	<a href="../map/map.jsp" style="color:white; text-decoration: none">지도</a>
     					</button>
                	</div>
                	
               </li></ul>
               <ul class="navbar-nav ml-auto">
               <li class="nav-item">
                <div>
               		<a href="../login/login.jsp" style="color:white; text-decoration: none">로그인</a>
			    	</div>
			    </li>
			    <li class="nav-item">
			    	<div>
			    	
			    	<a href="../signUp/signUp.jsp" style="color:white; text-decoration: none">회원가입</a>
               </div>
               </li></ul>
	       </div>
           </div>
      
   </nav>

</div> 
</body>