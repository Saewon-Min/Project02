package project02;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homework.MembershipDAO;
import homework.MembershipDTO;
import utils.JSFunction;

@WebServlet("*.member")
public class memberController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		if(commandStr.equals("/write.member")) {
			writeMember(request, response);
		}else if(commandStr.equals("/edit.member")) {
			editMember(request, response);
		}else if(commandStr.equals("/delete.member")) {
			deleteMember(request, response);
		}
		
		
	}
	
	public void writeMember(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String userId = request.getParameter("user_id"); 
		String userPass = request.getParameter("pass1"); 
		String name = request.getParameter("name"); 
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday"); 
		String zipcode = request.getParameter("zipcode"); 
		String address1 = request.getParameter("address1"); 
		String address2 = request.getParameter("address2"); 
		String email1 = request.getParameter("email1"); 
		String email2 = request.getParameter("email2"); 
		String mobile1 = request.getParameter("mobile1"); 
		String mobile2 = request.getParameter("mobile2"); 
		String mobile3 = request.getParameter("mobile3"); 
		String tel1 = request.getParameter("tel1"); 
		String tel2 = request.getParameter("tel2"); 
		String tel3 = request.getParameter("tel3");

		MembershipDTO dto = new MembershipDTO();

		
		dto.setId(userId);
		dto.setPass(userPass);
		dto.setName(name);
		dto.setGender(gender);
		dto.setBirth(birthday);
		dto.setZipcode(zipcode);
		dto.setAddress(address1+" "+address2);
		dto.setEmail(email1+"@"+email2);
		dto.setPhone(mobile1+"-"+mobile2+"-"+mobile3);
		dto.setHomephone(tel1+"-"+tel2+"-"+tel3);
		
		MembershipDAO dao = new MembershipDAO();
		
		
		int iResult = dao.memberRegist(dto);
		dao.close();
		
		if(iResult==1){
			response.sendRedirect("./signUp/signUp.jsp");
		}else if(iResult==-1){
			JSFunction.alertBack(response,"중복된 아이디가 존재합니다.");
		}else{
			JSFunction.alertBack(response,"회원가입에 실패하였습니다.");
		}
		
		
	}
	
	
	public void editMember(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
	}
	
	public void deleteMember(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
	}
}
