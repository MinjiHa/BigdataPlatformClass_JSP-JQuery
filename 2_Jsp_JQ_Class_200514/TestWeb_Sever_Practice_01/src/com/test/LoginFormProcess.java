package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginFormProcess
 */
@WebServlet("/LoginFormProcess")
public class LoginFormProcess extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");
		
		if(userName.equals("KKK") && userPassword.equals("1234")) {
			out.print(userName);
			out.print("<b> Login Success");
			
		}
		else {
			out.print("<b> Login failed");
		}
		out.print(userName);
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

}
