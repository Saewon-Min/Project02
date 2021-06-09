package project02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import homework.MembershipDAO;
import model.MemberDAO;
import utils.CookieManager;
import utils.JSFunction;

@WebServlet("*.log")
public class loginController  extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		if(commandStr.equals("/login.log")) {
			login(request, response);
		}else if(commandStr.equals("/logout.log")) {
			logout(request, response);
		}
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
			
			
			String id = request.getParameter("user_id");
			String pw = request.getParameter("user_pw");
		
			String remember = request.getParameter("remember");
			
			
			if("must".equals(id) && "1234".equals(pw)){
				// 아이디 저장 체크박스에 체크한 경우 쿠키를 생성한다.
				if(remember !=null && remember.equals("Y")){
					// 쿠키명 : loginId, 쿠키값 : 입력한 아이디, 유효시간 : 1일
					CookieManager.makeCookie(response, "loginId", id, 86400*30);
				
				// 체크박스에 체크하지 않은 경우 쿠키를 삭제한다.
				}else{
					CookieManager.deleteCookie(response, "loginId");
				}
				// 메세지를 경고창으로 띄우고 로그인 페이지로 이동한다.
				JSFunction.alertLocation(response, "로그인 성공", "../main/main.jsp");

			// 로그인 실패하는 경우
			}else{
				JSFunction.alertBack(response, "로그인 실패");
			}
			
			
			
			HttpSession session = request.getSession();
			// DAO객체 생성 및 DB연결
			MembershipDAO dao = new MembershipDAO();
			
			// 폼 값으로 받은 아이디, 패스워드를 통해 로그인 처리 메소드 호출
			Map<String, String> map= dao.getMember(id, pw);
			
			/*
			연습문제]
				회원정보를 MemberDTO에 저장한 후 반환했던 부분을
				Map컬렉션에 저장한 후 반환하여 처리할 수 있도록 수정하시오.
			 */
			
			if(map.get("id") != null){
				// 로그인에 성공한 경우 session영역에 회원 인증 정보를 저장한다.
				
				session.setAttribute("USER_ID", map.get("id"));
				session.setAttribute("USER_PW", map.get("pass"));
				session.setAttribute("USER_NAME", map.get("name"));
				
				
				// 로그인 페이지로 이동
				/* response.sendRedirect("./login/login.jsp"); */
				response.sendRedirect("./main/main.jsp"); 
				
			}else{
				JSFunction.alertBack(response, "일치하는 회원정보가 없습니다.");
				
				// 로그인 실패시 request 영역에 속성을 저장한다.
				//request.setAttribute("ERROR_MSG", "일치하는 회원정보가 없습니다.");
				// 로그인 페이지로 포워드(전달)한다.
				
				//request.getRequestDispatcher("./main/main.jsp").forward(request, response);
				 
				 
			}
			
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("USER_ID");
		session.removeAttribute("USER_PW");
		
		// 세션영역 전체를 한꺼번에 삭제
		session.invalidate();
		
		response.sendRedirect("./main/main.jsp");
	}
	
	
}













