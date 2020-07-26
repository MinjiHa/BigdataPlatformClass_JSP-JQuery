package com.test;

// https://stackoverflow.com/questions/42138715/chrome-cookies-not-working-after-tomcat-web-server-reboot
// Coookie 설정 방법..!

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginProcess3
 */
@WebServlet("/LoginProcess3")
public class LoginProcess3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	public boolean validateUser3(String userId, String userPwd) {
		if(userId.equals("KKK") && userPwd.equals("1234")) {
			return true;
		}
		else {
			return false;
		}
			
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		boolean loginFlag = this.validateUser3(userId, userPwd);
		
		if(loginFlag) {
			Cookie c = new Cookie("loginCheck", "Y");
			c.setPath("../");
			res.addCookie(c);
			out.print("Login successful");
			out.print("<a href='Login'> Go to login</a>");
		}
		
		else {
			Cookie c = new Cookie("loginCheck", "N");
			c.setPath("../");
			res.addCookie(c);
			out.print("Login Error : ");
			out.print("<a href='Login'>Go to login</a>");
		}
		out.print("</body></html>");
		out.close();
	}
}