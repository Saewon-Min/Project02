package model2.mvcboard;

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
import javax.servlet.jsp.JspWriter;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("*.write")
public class WriteController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("USER_ID")==null){
			JSFunction.alertBack(resp, "로그인 후 이용해주세요");
				
			return;
		}
		
		
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
	
		if(commandStr.equals("/spacesub01.write")) {
			req.getRequestDispatcher("/space/sub01Write.jsp").forward(req, resp);
		}else if(commandStr.equals("/spacesub02.write")) {
			req.getRequestDispatcher("/space/sub02Write.jsp").forward(req, resp);

		}else if(commandStr.equals("/spacesub03.write")) {
			req.getRequestDispatcher("/space/sub03Write.jsp").forward(req, resp);

		}else if(commandStr.equals("/community.write")) {
			req.getRequestDispatcher("/community/communityWrite.jsp").forward(req, resp);
		}
		
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		
		if(commandStr.equals("/spacesub01.write")) {
			noticeWrite(req, resp);
		}else if(commandStr.equals("/spacesub02.write")) {
			scheduleWrite(req, resp);
		}else if(commandStr.equals("/spacesub03.write")) {
			photoWrite(req, resp);
		}else if(commandStr.equals("/community.write")) {
			communityWrite(req, resp);
		}
	}
	
	
	
	
	
	private void noticeWrite(HttpServletRequest req, HttpServletResponse resp) 
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
				resp.sendRedirect("../Project02/notice.list");
				
			}else {
				resp.sendRedirect("../Project02/spacesub01.write");
				
			}
			
		}else {
			// 파일 첨부를 위한 객체 생성이 안된 경우
			JSFunction.alertLocation(resp, "글 작성 중 오류가 발생했습니다.","../Project02/spacesub01.write");
		}
		
		
		
	}
	private void scheduleWrite(HttpServletRequest req, HttpServletResponse resp) 
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
				resp.sendRedirect("../Project02/schedule.list");
			}else {
				resp.sendRedirect("../Project02/spacesub02.write");
			}
			
		}else {
			// 파일 첨부를 위한 객체 생성이 안된 경우
			JSFunction.alertLocation(resp, "글 작성 중 오류가 발생했습니다.","../Project02/spacesub02.write");
		}
		
		
		
		
	}
	private void photoWrite(HttpServletRequest req, HttpServletResponse resp) 
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
				resp.sendRedirect("../Project02/photo.list");
			}else {
				resp.sendRedirect("../Project02/spacesub03.write");
			}
			
		}else {
			// 파일 첨부를 위한 객체 생성이 안된 경우
			JSFunction.alertLocation(resp, "글 작성 중 오류가 발생했습니다.","../Project02/spacesub03.write");
		}		
		
		
		
	}
	private void communityWrite(HttpServletRequest req, HttpServletResponse resp) 
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
				resp.sendRedirect("../Project02/people.list");
			}else {
				resp.sendRedirect("../Project02/community.write");
			}
			
		}else {
			// 파일 첨부를 위한 객체 생성이 안된 경우
			JSFunction.alertLocation(resp, "글 작성 중 오류가 발생했습니다.","../Project02/community.write");
		}		
		
		
		
	}
	
	
	
	
	
}
