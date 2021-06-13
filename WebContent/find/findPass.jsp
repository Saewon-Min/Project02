<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../include/global.jsp" %>
		 
   	<%@ include file="../include/top.jsp" %>
        <!-- Navigation-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	        <link href="../bootstrap4.6.0/css/styles.css" rel="stylesheet" />
	
	<script>
		function validate(f) {
			if(f.find_name.value==""){
				alert('이름을 입력해주세요');
				f.find_name.focus();
				return false;
			}
			if(f.find_email.value==""){
				alert('이메일을 입력해주세요');
				f.email.focus();
				return false;
			}
		}
	
	
		
	</script>
	
	
        <!-- Masthead-->
        <header class="masthead">
            <div class="container" align="center">
            <form action="../Project02/findPass.log" onsubmit="return validate(this);" method="post">
                <div style="background-color: skyblue; width:40%;" ><h1>비밀번호 찾기</h1></div>
				<br />
               	<table style="color:black;width:500px;height:200px;text-align:center; background-color:lightyellow; ">
               		<tr>
	               		<th>아이디</th>
	               		<td><input type="text" name="find_id"  placeholder="아이디를 입력해주세요"/></td>
               		</tr>
               		<tr>
	               		<th>회원 이름</th>
	               		<td><input type="text" name="find_name"  placeholder="이름을 입력해주세요"/></td>
               		</tr>
               		
					<tr>
	               		<th>이메일</th>
	               		<td> <input type="text" name="find_email"  placeholder="이메일을 입력해주세요"/></td>
               		</tr>		
					<tr>
						<%
						if(request.getAttribute("pass")!=null){ %>
						<th><%=request.getAttribute("name") %>님의 패스워드 : </th>
						<td id="ajaxDisplay" style="color:black;">${pass }</td>
						<% } %>
					</tr>
					<tr>
						<td>
						<button type="button" style="width:auto" onclick="location.href='../find/findID.jsp'">아이디 찾기</button>
					
						</td>
						<td>
						<button style="width:auto" id="findbtn" type="submit">비밀번호 찾기</button>
					
						</td>
					
					</tr>
				
					
               	</table>
               		
            </form>    
                
            </div>
            
		
        </header>

        <%@ include file="../include/bottom.jsp" %>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../bootstrap4.6.0/js/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/map-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
