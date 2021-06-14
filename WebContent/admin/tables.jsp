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
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="../Project02/noticeAdmin.list">공지사항</a></li>
                            <li class="breadcrumb-item "><a href="../Project02/scheduleAdmin.list">정모일정</a></li>
                            <li class="breadcrumb-item "><a href="../Project02/photoAdmin.list">사진게시판</a></li>
                            <li class="breadcrumb-item "><a href="../Project02/peopleAdmin.list">반려인게시판</a></li>
                            
                        </ol>  
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                               공지사항게시판
                            </div>
                            <div class="card-body">
                                    <div class="d-flex" id="wrapper">
    
		
    
    
            <!-- Page content wrapper-->
            
			
			<div class="container-fluid" >
			
			  <table class="table table-hover">
			    <thead>
			      <tr style="text-align: center">
					<th width="10%">번호</th>
					<th width="30%">제목</th>
					<th width="10%">작성자</th>
					<th width="5%">조회수</th>
					<th width="15%">작성일</th>
					<th width="10%">첨부파일</th>
					<th width="10%">수정</th>
					<th width="10%">삭제</th>
			      </tr>
			    </thead>
		<c:choose>
		<c:when test="${empty boardLists }">
			<tr>
				<td colspan="8" align="center">
					등록된 게시물이 없습니다.
				</td>
			
			</tr>
	</c:when>
	<c:otherwise>
		<!-- 게시물이 있는 경우 확장 for문 형태의 forEach태그 사용 -->
		<c:forEach items="${boardLists }" var="row" varStatus="loop">

		<tr align="center">
			<td>
				${map.flagCount - (((map.pageNum-1) * map.pageSize)
					+ loop.index) }
			</td>
			<td align="left">
				<a href="../Project02/admin.view?idx=${row.idx }&flag=admin">${row.title }</a>
			</td>
			<td>${row.name }</td>
			<td>${row.visitcount }</td>
			<td>${row.postdate }</td>
			<td>
			<!-- 첨부된 파일이 있는경우에만 다운로드 링크 출력됨 -->
			<c:if test="${not empty row.ofile }">
				<!-- 파일 다운로드 시 다운로드 횟수를 증가시켜야 하므로
					게시물의 일련번호가 필요함 -->
				<a href="../mvcboard/download.do?ofile=${row.ofile 
					}&sfile=${row.sfile }&idx=${row.idx }">[Down]</a>
			</c:if>
			</td>
			<td>
			<button type="button" onclick="location.href='../Project02/edit.admin?idx=${param.idx}';" style="width:auto;" class="btn btn-primary">
				수정하기
				</button>
			</td>
			<td>
				<button type="button" onclick="location.href='../Project02/delete.admin?idx=${param.idx}';" style="width:auto;" class="btn btn-primary">
					삭제하기
				</button>
			
			</td>
		</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>

	<ul class="pagination d-flex justify-content-center" >
	
	${map.pagingImg }
	
	</ul>
	<ul class="pagination d-flex justify-content-end" >	
	
	<% 

	if(session.getAttribute("USER_ID")!= null && session.getAttribute("USER_ID").equals("admin") ){
	%>
	<button type="button" class="btn btn-warning" onclick="location.href='../Project02/spacesub01.write?flag=notice';" style="width:130px; ">
	글쓰기
	</button>
	<% 
	}
	%>
	
	
	</ul>
	
	

	
	</div>
      	</div>
                            </div>
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
