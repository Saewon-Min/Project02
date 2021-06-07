package utils;

public class BoardPage {

	public static String pagingStr(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqUrl) {
		
		String pagingStr = "";
		int totalPage = (int)(Math.ceil(((double)totalCount/pageSize)));
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;
		/*
		계산된 pageTemp가 1이라면 이전 블럭이 없는 상태이므로
		첫페이지, 이전블럭 링크를 출력하지 않는다.
		*/
		if(pageTemp != 1) {
			pagingStr += "<a href='"+reqUrl +"?pageNum=1'>[첫페이지]</a> ";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+reqUrl +"?pageNum="+(pageTemp-1)+"'>[이전블럭]</a> ";
			
			
		}
		
		int blockCount = 1;
		
		/*
		PAGE_PER_BLOCK이 인수로 전달되어 블럭당 표시할 페이지 번호의
		개수를 표현한다. 아래는 그 개수만큼 반복하여 페이지번호를
		출력하는 부분이다.
		 */
		while(blockCount<=blockPage && pageTemp<=totalPage) {
			/*
			현재 진입한 페이지번호에는 링크를 걸지 않는다.
			현재 페이지를 제외한 나머지에만 링크를 걸어준다.
			 */
			if(pageTemp==pageNum) {
				pagingStr += "&nbsp;"+pageTemp+"&nbsp;";
			}
			else {
				pagingStr += "&nbsp;<a href='"+reqUrl+"?pageNum="+pageTemp+"'>"
						+pageTemp+"</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
			
		}
		/*
		다음 블럭이 있을때만 출력한다.
		 */
		if(pageTemp<= totalPage) {
			pagingStr += "<a href='"+reqUrl +"?pageNum="+pageTemp+"'>[다음블럭]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+reqUrl +"?pageNum="+totalPage+"'>[마지막페이지]</a>";
		}
		return pagingStr;
	}
	
	
	
	
	
	
	
	
	
	public static String pagingStr(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqUrl, String queryStr) {
		
		String pagingStr = "";
		int totalPage = (int)(Math.ceil(((double)totalCount/pageSize)));
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;
		/*
		계산된 pageTemp가 1이라면 이전 블럭이 없는 상태이므로
		첫페이지, 이전블럭 링크를 출력하지 않는다.
		*/
		if(pageTemp != 1) {
			pagingStr += "<a href='"+reqUrl +"?pageNum=1&"+queryStr+"'>[첫페이지]</a> ";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+reqUrl +"?pageNum="+(pageTemp-1)+"&"+queryStr+"'>[이전블럭]</a> ";
			
			
		}
		
		int blockCount = 1;
		
		/*
		PAGE_PER_BLOCK이 인수로 전달되어 블럭당 표시할 페이지 번호의
		개수를 표현한다. 아래는 그 개수만큼 반복하여 페이지번호를
		출력하는 부분이다.
		 */
		while(blockCount<=blockPage && pageTemp<=totalPage) {
			/*
			현재 진입한 페이지번호에는 링크를 걸지 않는다.
			현재 페이지를 제외한 나머지에만 링크를 걸어준다.
			 */
			if(pageTemp==pageNum) {
				pagingStr += "&nbsp;"+pageTemp+"&nbsp;";
			}
			else {
				pagingStr += "&nbsp;<a href='"+reqUrl+"?pageNum="+pageTemp+"&"+queryStr+"'>"
						+pageTemp+"</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
			
		}
		/*
		다음 블럭이 있을때만 출력한다.
		 */
		if(pageTemp<= totalPage) {
			pagingStr += "<a href='"+reqUrl +"?pageNum="+pageTemp+"&"+queryStr+"'>[다음블럭]</a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+reqUrl +"?pageNum="+totalPage+"&"+queryStr+"'>[마지막페이지]</a>";
		}
		return pagingStr;
	}
	
	
	
	// 페이지번호와 블럭을 이미지로 처리한 메소드
	public static String pagingImg(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqUrl) {
		
		String pagingStr = "";
		int totalPage = (int)(Math.ceil(((double)totalCount/pageSize)));
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;
		/*
		계산된 pageTemp가 1이라면 이전 블럭이 없는 상태이므로
		첫페이지, 이전블럭 링크를 출력하지 않는다.
		*/
		if(pageTemp != 1) {
			
			pagingStr += " <ul class='pagination'> ";
			pagingStr += " <li class='page-item'><a class='page-link' href='"+reqUrl +"?pageNum=1'><i class='fas fa-angle-double-left' style='font-size:12px;color:blue'></i></a></li> ";
			pagingStr += " &nbsp;";
			pagingStr += " <li class='page-item'><a class='page-link' href='"+reqUrl +"?pageNum="+(pageTemp-1)+"'><i class='fas fa-angle-double-right' style='font-size:12px;color:blue'></i></a></li> ";
			pagingStr += " </ul> ";
			
		}
		
		
		/*
		 * <ul class="pagination"> <li class="page-item"><a class="page-link"
		 * href="#">Previous</a></li> <li class="page-item"><a class="page-link"
		 * href="#">1</a></li> <li class="page-item active"><a class="page-link"
		 * href="#">2</a></li> <li class="page-item"><a class="page-link"
		 * href="#">3</a></li> <li class="page-item"><a class="page-link"
		 * href="#">Next</a></li> </ul>
		 */
		
		
		
		
		int blockCount = 1;
		
		/*
		PAGE_PER_BLOCK이 인수로 전달되어 블럭당 표시할 페이지 번호의
		개수를 표현한다. 아래는 그 개수만큼 반복하여 페이지번호를
		출력하는 부분이다.
		 */
		while(blockCount<=blockPage && pageTemp<=totalPage) {
			/*
			현재 진입한 페이지번호에는 링크를 걸지 않는다.
			현재 페이지를 제외한 나머지에만 링크를 걸어준다.
			 */
			if(pageTemp==pageNum) {
				pagingStr += "&nbsp;"+pageTemp+"&nbsp;";
			}
			else {
				pagingStr += "&nbsp;<a href='"+reqUrl+"?pageNum="+pageTemp+"'>"
						+pageTemp+"</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
			
		}
		/*
		다음 블럭이 있을때만 출력한다.
		 */
		if(pageTemp<= totalPage) {
			pagingStr += "<a href='"+reqUrl +"?pageNum="+pageTemp+"'><img src='../images/paging3.gif' /></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+reqUrl +"?pageNum="+totalPage+"'><img src='../images/paging4.gif' /></a>";
		}
		return pagingStr;
	}
	
	
	
	
	
}
