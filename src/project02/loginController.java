package project02;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;

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
		
			HttpSession session = request.getSession();
			// DAO객체 생성 및 DB연결
			MemberDAO dao = new MemberDAO();
			
			// 폼 값으로 받은 아이디, 패스워드를 통해 로그인 처리 메소드 호출
			Map<String, String> map= dao.getMemberMap(id, pw);
			
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
				response.sendRedirect("./login/login.jsp");
				
			}else{
				// 로그인 실패시 request 영역에 속성을 저장한다.
				request.setAttribute("ERROR_MSG", "등록된 회원이 아닙니다.");
				// 로그인 페이지로 포워드(전달)한다.
				request.getRequestDispatcher("./login/login.jsp").forward(request, response);
			}
			
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("USER_ID");
		session.removeAttribute("USER_PW");
		
		// 세션영역 전체를 한꺼번에 삭제
		session.invalidate();
		
		response.sendRedirect("./login/login.jsp");
	}
	
	
}













