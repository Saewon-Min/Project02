package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.BoardConfig;
import utils.BoardPage;

@WebServlet("*.list")
public class ListController extends HttpServlet{

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		String flag = "";
		String admin = "";
				
		
		if(commandStr.equals("/notice.list")) {
			flag="notice";
		}else if(commandStr.equals("/schedule.list")) {
			flag="schedule";
		}else if(commandStr.equals("/photo.list")) {
			flag="photo";
		}else if(commandStr.equals("/people.list")) {
			flag="people";
		}else if(commandStr.equals("/noticeAdmin.list")) {
			admin="admin";
			flag="notice";
		}else if(commandStr.equals("/scheduleAdmin.list")) {
			admin="admin";
			flag="schedule";
		}else if(commandStr.equals("/photoAdmin.list")) {
			admin="admin";
			flag="photo";
		}else if(commandStr.equals("/peopleAdmin.list")) {
			admin="admin";
			flag="people";
		}
		
		
		//DAO객체 생성(커넥션 풀 사용함)
		MVCBoardDAO dao = new MVCBoardDAO();

		
		// 검색 파라미터 및 View로 전달할 여러가지 데이터 저장용 Map컬렉션 생성
		Map<String, Object> map = new HashMap<String, Object>();

		// 검색 파라미터 처리
		String searchField = request.getParameter("searchField"); // 검색할 필드명
		String searchWord = request.getParameter("searchWord"); // 검색할 단어
		

		System.out.println(flag);
		if(searchWord != null){
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		

		// 게시물 개수 카운트
		map.put("flag", flag);
		int flagCount = dao.flagCount(map);

		/* 페이지 처리 start */
		int pageSize = BoardConfig.PAGE_PER_SIZE; // 한페이지에 출력할 게시물의 개수
		int blockPage = BoardConfig.PAGE_PER_BLOCK; // 한 블럭당 출력할 페이지번호의 개수
		int totalPage = (int)Math.ceil((double)flagCount/pageSize); // 전체 페이지 수 계산
		// 페이지 번호 처리
		int pageNum = 1; // 목록 첫 진입시에는 무조건 1페이지로 지정
		String pageTemp = request.getParameter("pageNum"); 
		if(pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);

		// 한 페이지에 출력할 게시물의 범위 결정(between절에 사용)
		int start = (pageNum-1)*pageSize;
		int end = pageSize;

		map.put("start", start);
		map.put("end", end);
		System.out.println(start+" = "+end);
		/* 페이지 처리 end */


		// 실제 출력할 레코드를 가져옴
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);
		
		dao.close();
		String pagingImg = "";
		// View에 출력할 페이지 번호를 문자열로 저장
		if(flag.equals("notice")) {
			if(admin.equals("admin")) {
				pagingImg = BoardPage.pagingImg(flagCount, pageSize, blockPage, pageNum, "../Project02/noticeAdmin.list");
			}else {
				pagingImg = BoardPage.pagingImg(flagCount, pageSize, blockPage, pageNum, "../Project02/notice.list");
				
			}
			
		}else if(flag.equals("schedule")) {
			if(admin.equals("admin")) {
				pagingImg = BoardPage.pagingImg(flagCount, pageSize, blockPage, pageNum, "../Project02/scheduleAdmin.list");
			}else {
			pagingImg = BoardPage.pagingImg(flagCount, pageSize, blockPage, pageNum, "../Project02/schedule.list");
			}
		}else if(flag.equals("photo")) {
			if(admin.equals("admin")) {
				pagingImg = BoardPage.pagingImg(flagCount, pageSize, blockPage, pageNum, "../Project02/photoAdmin.list");
			}else {
		
			pagingImg = BoardPage.pagingImg(flagCount, pageSize, blockPage, pageNum, "../Project02/photo.list");
			}
		}else if(flag.equals("people")) {
			if(admin.equals("admin")) {
				pagingImg = BoardPage.pagingImg(flagCount, pageSize, blockPage, pageNum, "../Project02/peopleAdmin.list");
			}else {
		
			pagingImg = BoardPage.pagingImg(flagCount, pageSize, blockPage, pageNum, "../Project02/people.list");
			}
		}
		
		
		
		map.put("pagingImg", pagingImg); // 페이지 번호 문자열
		map.put("flagCount", flagCount); // 게시물의 개수
		map.put("pageSize", pageSize); // 페이지 수
		map.put("pageNum", pageNum); // 현재 페이지 번호
		
		request.setAttribute("boardLists", boardLists); // 페이지에 출력할 게시물
		request.setAttribute("map", map); // 각종 파라미터 및 페이지관련 값

		
		
		if(flag.equals("notice")) {
			
			if(admin.equals("admin")) {
				request.getRequestDispatcher("/admin/tables.jsp?flag=notice").forward(request, resp);
			}else {
				request.getRequestDispatcher("/space/spaceSub01.jsp").forward(request, resp);
				
			}
		}else if(flag.equals("schedule")) {
			if(admin.equals("admin")) {
				request.getRequestDispatcher("/admin/tables.jsp?flag=schedule").forward(request, resp);
			}else {
			request.getRequestDispatcher("/space/spaceSub02.jsp").forward(request, resp);
			}
		}else if(flag.equals("photo")) {
			if(admin.equals("admin")) {
				request.getRequestDispatcher("/admin/tables.jsp?flag=photo").forward(request, resp);
			}else {
			request.getRequestDispatcher("/space/spaceSub03.jsp").forward(request, resp);
			}
		}else if(flag.equals("people")) {
			if(admin.equals("admin")) {
				request.getRequestDispatcher("/admin/tables.jsp?flag=people").forward(request, resp);
			}else {
			request.getRequestDispatcher("/community/community.jsp").forward(request, resp);
			}
			
		}


	
	}
	
	
	
}
