package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginProcess")
public class LoginProcess extends HttpServlet{
	
	
	public boolean validateUser(String userId, String userPwd) {
		if(userId.equals("KKK") && userPwd.equals("1234")) {
			return true;
		}
		else
			return false;
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		
		boolean loginFlag = this.validateUser(userId, userPwd);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		
		out.print("<html><body>");
		if(loginFlag) {
			out.print("Login Success");
		}
		else {
			out.print("Login Error");
		}
		
		//out.print(userId + ", " + userPwd);
		out.print("</body></html>");
		out.close();
	}
}
