package project02;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import model2.mvcboard.CommentDAO;
import model2.mvcboard.CommentDTO;
import model2.mvcboard.MVCBoardDAO;
import model2.mvcboard.MVCBoardDTO;
import utils.JSFunction;
@WebServlet("*.admin") 
public class adminController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("USER_ID")!=null) {
			if(!(session.getAttribute("USER_ID").equals("admin"))) {
				JSFunction.alertLocation(resp, "관리자만 접근할수 있는 페이지입니다.", "../main/main.jsp");
				return;
			}
			
		}else {
			JSFunction.alertLocation(resp, "로그인 후 사용해주세요","../main/main.jsp");
			return;
		}
		
		
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		
		// 마지막 요청명을 통해 각 기능의 메소드를 호출한다.
		if(commandStr.equals("/edit.admin")) {
			edit(req, resp);
		}else if(commandStr.equals("/editAction.admin")) {
			editAction(req,resp);
		}else if(commandStr.equals("/deleteAction.admin")) {
			deleteAction(req,resp);
		}else if(commandStr.equals("/adminWrite.admin")) {
			write(req, resp);
		}else if(commandStr.equals("/adminWriteAction.admin")) {
			writeAction(req, resp);
		}else if(commandStr.equals("/adminWritePhoto.admin")) {
			photoWrite(req, resp);
		}else if(commandStr.equals("/commentWrite.admin")) {
			commentWrite(req, resp);
		}else if(commandStr.equals("/commentEdit.admin")) {
			commentEdit(req, resp);
		}else if(commandStr.equals("/commentEditAction.admin")) {
			commentEditAction(req, resp);
		}else if(commandStr.equals("/commentDeleteAction.admin")) {
			commentDeleteAction(req, resp);
		}
		
		
		
		
		
		
		
	}
	
	public void write(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String flag = req.getParameter("flag");
		
		if(flag.equals("photo")) {
			req.getRequestDispatcher("/admin/photoWrite.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("/admin/write.jsp").forward(req, resp);
		}
		
		
		
		
		
		
	}
	public void writeAction(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		
		// 서블릿에서 디렉토리의 물리적 경로 얻어오기
				String saveDirectory = req.getServletContext().getRealPath("/Uploads");
				// 서블릿에서 컨텍스트 초기화 파라미터 얻어오기
				ServletContext application = this.getServletContext();
				// 파일 업로드 제한 용량
				int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
				// 파일 업로드 처리
				MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
				HttpSession session = req.getSession();

				
				if(mr!= null) {
					// 파일 외 파라미터 받기
					String id = (String)session.getAttribute("USER_ID");
					String name = mr.getParameter("name");
					String title = mr.getParameter("title");
					String content = mr.getParameter("content");
					String pass = mr.getParameter("pass");
					String flag = mr.getParameter("flag");
					
					System.out.println(flag);
					
					MVCBoardDTO dto = new MVCBoardDTO();
					dto.setName(name);
					dto.setTitle(title);
					dto.setContent(content);
					dto.setPass(pass);
					dto.setId(id);
					dto.setFlag(flag);
					
					
					// 서버에 저장된 파일명 변경하기
					String fileName = mr.getFilesystemName("ofile");
					
					if(fileName!=null) {
						String nowTime = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
						int extIdx = fileName.lastIndexOf(".");
						String newFileName = nowTime + fileName.substring(extIdx,fileName.length());
						
						File oldFile = new File(saveDirectory + File.separator+fileName);
						File newFile = new File(saveDirectory + File.separator+newFileName);
						oldFile.renameTo(newFile);
						
						dto.setOfile(fileName);
						dto.setSfile(newFileName);
						
						
					}
					
					// DAO에서 insert 처리
					MVCBoardDAO dao = new MVCBoardDAO();
					int result = dao.insertWrite(dto);
					dao.close();
					if(result==1) {
						if(flag.equals("notice")) {
							resp.sendRedirect("../Project02/noticeAdmin.list");
						}else if(flag.equals("schedule")) {
							resp.sendRedirect("../Project02/scheduleAdmin.list");
						}else if(flag.equals("people")) {
							resp.sendRedirect("../Project02/peopleAdmin.list");
						}
					}else {
						resp.sendRedirect("../Project02/adminWrite.admin");
						
					}
					
				}else {
					// 파일 첨부를 위한 객체 생성이 안된 경우
					JSFunction.alertLocation(resp, "글 작성 중 오류가 발생했습니다.","../Project02/adminWrite.admin");
				}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	public void photoWrite(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// 서블릿에서 디렉토리의 물리적 경로 얻어오기
				String saveDirectory = req.getServletContext().getRealPath("/Uploads");
				// 서블릿에서 컨텍스트 초기화 파라미터 얻어오기
				ServletContext application = this.getServletContext();
				// 파일 업로드 제한 용량
				int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
				// 파일 업로드 처리
				MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
				HttpSession session = req.getSession();

				
				if(mr!= null) {
					// 파일 외 파라미터 받기
					String id = (String)session.getAttribute("USER_ID");
					String name = mr.getParameter("name");
					String title = mr.getParameter("title");
					String content = mr.getParameter("content");
					String pass = mr.getParameter("pass");
					String flag = mr.getParameter("flag");
					String photoflag = mr.getParameter("photoflag");
					
					System.out.println(flag);
					
					MVCBoardDTO dto = new MVCBoardDTO();
					dto.setName(name);
					dto.setTitle(title);
					dto.setContent(content);
					dto.setPass(pass);
					dto.setId(id);
					dto.setFlag(flag);
					dto.setPhotoflag(photoflag);
					
					
					// 서버에 저장된 파일명 변경하기
					String fileName = mr.getFilesystemName("ofile");
					
					if(fileName!=null) {
						String nowTime = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
						int extIdx = fileName.lastIndexOf(".");
						String newFileName = nowTime + fileName.substring(extIdx,fileName.length());
						
						File oldFile = new File(saveDirectory + File.separator+fileName);
						File newFile = new File(saveDirectory + File.separator+newFileName);
						oldFile.renameTo(newFile);
						
						dto.setOfile(fileName);
						dto.setSfile(newFileName);
						
						
					}
					
					// DAO에서 insert 처리
					MVCBoardDAO dao = new MVCBoardDAO();
					int result = dao.insertPhotoWrite(dto);
					dao.close();
					if(result==1) {
						resp.sendRedirect("../Project02/photoAdmin.list");
					}else {
						resp.sendRedirect("../Project02/adminWritePhoto.admin");
					}
					
				}else {
					// 파일 첨부를 위한 객체 생성이 안된 경우
					JSFunction.alertLocation(resp, "글 작성 중 오류가 발생했습니다.","../Project02/adminWritePhoto.admin");
				}		
	}
	
	public void edit(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		HttpSession session = req.getSession(); 
		String flag = req.getParameter("flag");
		
		// 파라미터로 전달된 일련번호를 통해 기존 게시물을 조회한다.
		String idx = req.getParameter("idx");
		System.out.println("adminController idx : "+idx);
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		
		// 하나의 레코드를 저장한 DTO객체를 request영역에 저장한 후 View로 포워드
		req.setAttribute("dto", dto);
		
		if(flag.equals("admin")) {
			req.getRequestDispatcher("/admin/edits.jsp").forward(req, resp);
		}else if(flag.equals("photo")) {
			req.getRequestDispatcher("/admin/EditPhoto.jsp").forward(req, resp);
		}
		
		
	}


	public void editAction(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		ServletContext application = this.getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		
		
		
		if(mr!= null) {
			// 파일을 제외한 나머지 폼값 받기
			
			// -hidden 입력상자로 받을 파라미터
			String idx = mr.getParameter("idx");
			String prevOfile = mr.getParameter("prevOfile");
			String prevSfile = mr.getParameter("prevSfile");
			
			String photoflag = mr.getParameter("photoflag");
			
			// -일반 입력상자로 받을 파라미터
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");

			
		
			
			MVCBoardDTO dto = new MVCBoardDTO();		
			dto.setIdx(idx);
			dto.setName(name);
			dto.setTitle(title);
			dto.setContent(content);
			
			dto.setPhotoflag(photoflag);
			
			// 새롭게 업로드 된 파일의 이름을 얻어온다.
			String fileName = mr.getFilesystemName("ofile");
			System.out.println("filename : "+fileName);
			
			
			if(fileName!=null) {
				// 새롭게 등록된 파일이 있다면 파일명 변경을 위해 파일명을 결정하고
				String nowTime = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				int extIdx = fileName.lastIndexOf(".");
				String newFileName = nowTime + fileName.substring(extIdx,fileName.length());
				
				// 저장된 파일의 파일명을 변경한다.
				File oldFile = new File(saveDirectory + File.separator+fileName);
				File newFile = new File(saveDirectory + File.separator+newFileName);
				oldFile.renameTo(newFile);
				
				// 새로운 파일명으로 DTO에 저장한다.
				dto.setOfile(fileName);
				dto.setSfile(newFileName);
				
				// 기존에 등록된 파일을 삭제한다.
				FileUtil.deleteFile(req, "/Uploads", prevSfile);
				
			}else {
				/*
				새롭게 등록된 파일이 없다면 기존 파일명을 유지하기 위해
				hidden 입력상자의 내용을 그대로 적용한다.
				 */
				dto.setOfile(prevOfile);
				dto.setSfile(prevSfile);
			}
			
			//String flag = req.getParameter("flag");
			
			// 레코드 업데이트 처리
			
			
			
			MVCBoardDAO dao = new MVCBoardDAO();
			int result = dao.adminUpdatePost(dto);
			
			dao.close();
			if(result==1) {
				
				resp.sendRedirect("../Project02/admin.view?idx="+idx+"&flag=admin");
				
			}else {
				JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요",
						"../Project02/admin.view?idx="+idx+"&flag=admin");
			}
			
		}else {

			
			JSFunction.alertBack(resp, "글 수정 중 오류가 발생했습니다.");
		}
	}




	public void deleteAction(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String idx = req.getParameter("idx");
		
	
		MVCBoardDAO dao =  new MVCBoardDAO();
		

		// 첨부된 파일이 있다면 삭제하기 위해 기존 게시물을 가져온다.
		MVCBoardDTO dto = dao.selectView(idx);
		// 기존 게시물을 삭제한다.
		int result = dao.deletePost(idx);
		dao.close();
		
		// 게시물이 삭제되었다면 첨부된 파일도 삭제한다.
		if(result==1) {
			String saveFileName = dto.getSfile();
			FileUtil.deleteFile(req,"/Uploads",saveFileName);
		}else {
			JSFunction.alertBack(resp, "게시물 삭제 중 오류가 발생했습니다.");
		}
		
		
		JSFunction.alertLocation(resp, "게시물이 삭제되었습니다.","../Project02/noticeAdmin.list");
		
				
		
	}


	public void commentWrite(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		/*
		서블릿에서 기능 처리를 위한 메소드는 doGet(), doPost()와 동일하게
		request, response 객체를 매개변수로 사용하고,
		ServletException, IOException 에 대한 예외처리를 해주는게 좋다.
		 */
		System.out.println("댓글쓰기");
		
		// 폼 값 받기
		String id = (String) session.getAttribute("USER_ID");
		String board_idx = req.getParameter("board_idx");
		String name = req.getParameter("name");
		String pass = req.getParameter("pass");
		String comments = req.getParameter("comments");
		
		
		// DTO 객체에 저장
		CommentDTO dto = new CommentDTO();
		dto.setId(id);
		dto.setBoard_idx(board_idx);
		dto.setName(name);
		dto.setPass(pass);
		dto.setComments(comments);
		
		// DAO 객체 생성 및 메소드 호출
		CommentDAO dao = new CommentDAO();
		
		int result = dao.commentInsert(dto);
		if(result == 1) {
			
			resp.sendRedirect("../Project02/admin.view?idx="+board_idx+"&flag=admin"+"#commentsList");
			
		}else {
			JSFunction.alertBack(resp, "댓글 작성에 실패했습니다.");
		}
		
	}

	public void commentEdit(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String board_idx = req.getParameter("board_idx");


		CommentDAO dao = new CommentDAO();
		CommentDTO dto = dao.commentView(idx,board_idx);

		// 하나의 레코드를 저장한 DTO객체를 request영역에 저장한 후 View로 포워드
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/admin/EditComment.jsp").forward(req, resp);
	}

	public void commentEditAction(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String board_idx = req.getParameter("board_idx");
		String name = req.getParameter("name");
		String postdate = req.getParameter("postdate");
		String comments = req.getParameter("comments");
		

		CommentDTO dto = new CommentDTO();		
		dto.setComments(comments);
		dto.setBoard_idx(board_idx);
		dto.setIdx(idx);

		
		CommentDAO dao = new CommentDAO();
			int result = dao.adminCommentUpdate(dto);
			dao.close();
			
			if(result==1) {
				JSFunction.alertOpenerReloadClose(resp,"댓글이 수정되었습니다.");	
				
			}else {
				JSFunction.alertBack(resp, "댓글 수정 중 오류가 발생했습니다.");
				
			}
			
		
	}


	public void commentDeleteAction(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String board_idx = req.getParameter("board_idx");

		CommentDAO dao =  new CommentDAO();

			int result = dao.adminDeleteComment(idx,board_idx);
			dao.close();
			
			
			if(result==1) {
				JSFunction.alertBack(resp,"댓글이 삭제되었습니다.");			
			}	
			else {
				JSFunction.alertBack(resp, "댓글 삭제를 실패했습니다.");
			}
		
	}




}
