package model2.mvcboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("*.editpass")
public class PassController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(); 
		
		
		if(session.getAttribute("USER_ID")==null){
			JSFunction.alertBack(resp, "로그인 후 이용해주세요");
			return;
		}
		
		// ../notice.editpass  ../schedule.editpass  ../photo.editpass  ../people.editpass
		
		// 파라미터를 request 내장객체로 받은 후 request 영역에 저장
		req.setAttribute("mode", req.getParameter("mode"));
		String flag = req.getParameter("flag");
		System.out.println(flag);
		if(flag.equals("notice")) {
			req.getRequestDispatcher("/common/Pass.jsp?flag=notice").forward(req, resp);
		}else if(flag.equals("schedule")) {
			req.getRequestDispatcher("/common/Pass.jsp?flag=schedule").forward(req, resp);
		}else if(flag.equals("photo")) {
			req.getRequestDispatcher("/common/Pass.jsp?flag=photo").forward(req, resp);
		}else if(flag.equals("people")) {
			req.getRequestDispatcher("/common/Pass.jsp?flag=people").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		String flag = req.getParameter("flag");
		
		MVCBoardDAO dao =  new MVCBoardDAO();
		/*
		게시물의 일련번호와 비밀번호를 통해 해당 게시물이 있는지
		확인하기 위한 메소드 호출
		 */
		boolean confirmPass = dao.confirmPassword(pass, idx);
		dao.close();
		   
		// 비밀번호 검증이 완료되었다면 수정 혹은 삭제로 분기한다.
		if(confirmPass == true) {
			// 수정
			if(mode.equals("edit")) {
				
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				
				
				resp.sendRedirect("../Project02/multi.edit?idx="+idx+"&flag="+flag);
			
			// 삭제
			}else if(mode.equals("delete")) {
				dao = new MVCBoardDAO();
				
				// 첨부된 파일이 있다면 삭제하기 위해 기존 게시물을 가져온다.
				MVCBoardDTO dto = dao.selectView(idx);
				// 기존 게시물을 삭제한다.
				int result = dao.deletePost(idx);
				dao.close();
				
				// 게시물이 삭제되었다면 첨부된 파일도 삭제한다.
				if(result==1) {
					String saveFileName = dto.getSfile();
					FileUtil.deleteFile(req,"/Uploads",saveFileName);
				}
				
				if(flag.equals("notice")) {
					JSFunction.alertLocation(resp, "게시물이 삭제되었습니다.","../Project02/notice.list");
				}else if(flag.equals("schedule")) {
					JSFunction.alertLocation(resp, "게시물이 삭제되었습니다.","../Project02/schedule.list");
				}else if(flag.equals("photo")) {
					JSFunction.alertLocation(resp, "게시물이 삭제되었습니다.","../Project02/photo.list");
				}else if(flag.equals("people")) {
					JSFunction.alertLocation(resp, "게시물이 삭제되었습니다.","../Project02/people.list");
				}
				
				
				
				
			}
			
		}else {
			JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
		}
		
		
	
	}
	
	
	
}
