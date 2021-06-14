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
import model2.mvcboard.MVCBoardDAO;
import model2.mvcboard.MVCBoardDTO;
import utils.JSFunction;
@WebServlet("*.admin") 
public class adminController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		// 마지막 요청명을 통해 각 기능의 메소드를 호출한다.
		if(commandStr.equals("/edit.admin")) {
			edit(req, resp);
		}else if(commandStr.equals("/delete.admin")) {
			delete(req,resp);
		}
		
		
		
		
		
		
		
	}
	



	public void edit(HttpServletRequest req, HttpServletResponse resp) 
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



	public void delete(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
	}












}
