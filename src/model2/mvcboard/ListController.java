package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		if(commandStr.equals("/notice.list")) {
			flag="notice";
		}else if(commandStr.equals("/schedule.list")) {
			flag="schedule";
		}else if(commandStr.equals("/photo.list")) {
			flag="photo";
		}else if(commandStr.equals("/people.list")) {
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
		int totalCount = dao.selectCount(map);

		/* 페이지 처리 start */
		int pageSize = BoardConfig.PAGE_PER_SIZE; // 한페이지에 출력할 게시물의 개수
		int blockPage = BoardConfig.PAGE_PER_BLOCK; // 한 블럭당 출력할 페이지번호의 개수
		int totalPage = (int)Math.ceil((double)totalCount/pageSize); // 전체 페이지 수 계산
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
		map.put("flag", flag);
		System.out.println(start+" = "+end);
		/* 페이지 처리 end */


		// 실제 출력할 레코드를 가져옴
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);
		dao.close();
		
		// View에 출력할 페이지 번호를 문자열로 저장
		String pagingImg = BoardPage.pagingImg(totalCount, pageSize, blockPage, pageNum, "../mvcboard/list.do");
		
		map.put("pagingImg", pagingImg); // 페이지 번호 문자열
		map.put("totalCount", totalCount); // 게시물의 개수
		map.put("pageSize", pageSize); // 페이지 수
		map.put("pageNum", pageNum); // 현재 페이지 번호
		
		request.setAttribute("boardLists", boardLists); // 페이지에 출력할 게시물
		request.setAttribute("map", map); // 각종 파라미터 및 페이지관련 값

		if(flag=="notice") {
			
			request.getRequestDispatcher("/space/spaceSub01.jsp").forward(request, resp);
		}else if(flag=="schedule") {
			/* session.removeAttribute("flag"); */
			request.getRequestDispatcher("/space/spaceSub02.jsp").forward(request, resp);
		}else if(flag=="photo") {
			/* session.removeAttribute("flag"); */
			request.getRequestDispatcher("/space/spaceSub03.jsp").forward(request, resp);
		}else if(flag=="people") {
			request.getRequestDispatcher("").forward(request, resp);
			
		}


	
	}
	
	
	
}
