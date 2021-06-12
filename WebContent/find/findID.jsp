<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../include/global.jsp" %>
		 
   	<%@ include file="../include/top.jsp" %>
        <!-- Navigation-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
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
	
		
		$(function(){
			
			
			$('#findbtn').click(function(){
				$.ajax({
					// 요청할 서버의 URL
					url : 'http://localhost:8082/Project02/findID.log',
					// 콜백데이터 형식
					dataType : "html",
					// 요청시 전송방식
					type : "get",
					// get방식일때의 컨텐츠 타입
					contentType : 'application/x-www-form-urlencoded; charset=euc-kr',

					// 파라미터
					data : {
						find_name : $('#name').val(),
						find_email : $('#email').val()
					},
					// 성공, 실패시의 콜백메소드
					success : sucFunc,
					error : errFunc
				});
			});
			
			
			
		});

		function sucFunc(resData){
			
			$('#ajaxDisplay').html(resData);
		}
		
		function errFunc(){
			alert("에러발생, 디버깅하세요");
		}
		
		
		
		
		
		
		
		
	</script>
	
	
        <!-- Masthead-->
        <header class="masthead">
            <div class="container" align="center">
            <form action="" >
                <div style="background-color: skyblue; width:40%;" ><h1>아이디 찾기</h1></div>
				<br />
               	<table style="color:black;width:500px;height:200px;text-align:center; background-color:lightyellow; ">
               		
               		<tr>
               		<th>회원 이름</th>
               		<td><input type="text" name="find_name" id="name" placeholder="이름을 입력해주세요"/></td>
               		</tr>
               		
					<tr>
               		<th>이메일</th>
               		<td> <input type="text" name="find_email" id="email" placeholder="이메일을 입력해주세요"/></td>
               		</tr>		
					<tr>
					<td></td>
					<td id="ajaxDisplay" style="color:black;"></td>
					</tr>
					<tr>
					<td colspan="2">
						<button style="width:auto" id="findbtn">아이디 찾기</button>
					
					</td>
					
					</tr>
				
					
               	</table>
               		
            </form>    
                
            </div>
            
		
        </header>

        

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
