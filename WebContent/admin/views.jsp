<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String id = (String)session.getAttribute("USER_ID");

%>
<html lang="en">
    <%@ include file="../admin/topHead.jsp" %>
    <%@ include file="../include/global.jsp" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <link href="../bootstrap4.6.0/css/styles.css" rel="stylesheet" />
    
    <body class="sb-nav-fixed">
        <%@ include file="../admin/topNav.jsp" %>
        <div id="layoutSidenav">
            <%@ include file="../admin/leftsidenav.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                   <div class="container-fluid" >
			<table class="table table-bordered" width="90%" style="background-color: white; vertical-align: center;">
		    <colgroup>
		   	 <col width="15%"/>
		   	 <col width="35%"/>
		   	 <col width="15%"/>
		   	 <col width="*"/>
		    </colgroup>
		    <tr>
		   	 <th>번호</th>
		   	 <td>${dto.idx }</td>
		   	 <th>작성자</th>
		   	 <td>${dto.name }</td>
		    </tr>
		    <tr>
		   	 <th>작성일</th>
		   	 <td>${dto.postdate }</td>
		   	 <th>조회수</th>
		   	 <td>${dto.visitcount }</td>
		    </tr>
		    <tr>
		   	 <th>제목</th>
		   	 <td style="text-align:left">${dto.title }</td>
		   	 <th>첨부파일 카테고리</th>
		   	 <td>${dto.photoflag }</td>
		    </tr>
		    <tr >
		   	 <th cellpadding ="60px">내용</th>
		   	 <td colspan="3" height="100" style="text-align:left">${dto.content }</td>
		   	 
		    </tr>
		    <tr>
		   	 <th>첨부파일</th>
		   	 <td>
		   	 <!-- 첨부한 파일이 있을때만 다운로드 링크 활성화 -->
		   	 <c:if test="${not empty dto.ofile }">
		   		 ${dto.ofile } <!-- 기존 파일명 출력 -->
		   		 <a href="../mvcboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile }&idx=${dto.idx }">
		   			 [다운로드]
		   		 </a>   	 
		   	 </c:if>   	 
		   	 </td>
		   	 <th>다운로드수</th>
		   	 <td>${dto.downcount }</td>
		    </tr>
		    </table>
		    
		    
		    <div align="right">
		   
				<button type="button" onclick="location.href='../Project02/photo.list?flag=photo';" style="width:auto; " class="btn btn-primary">
					리스트바로가기
				</button>

			</div>
			
			
			</div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>