package com.Exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginProcess
 */
@WebServlet("/LoginProcess")
public class LoginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		// TODO Auto-generated method stub
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userPwdCheck = request.getParameter("userPwdCheck");
		String userGender = request.getParameter("userGender");
		
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);
		session.setAttribute("userPwd", userPwd);
		session.setAttribute("userPwdCheck", userPwdCheck);
		session.setAttribute("userGender", userGender);
		
		if(userId.equals("test") && userPwd.equals("1234") && userPwdCheck.equals("1234") && userGender != null) {
			out.print("<br><br>Login Success.<br>");
			out.print("Your ID is : " + userId + "<br>");
			out.print("Your PW is : " + userPwd + "<br>");
			out.println();
		
			
			out.print("Your Gender is : "+ userGender + "<br>");
			out.println();
			out.print("Good Boy");
		} else {
			out.print("Please Check your ID & PW<br><br>");
			request.getRequestDispatcher("Login.html").forward(request, response);
		}
		out.close();		
				
	}

}
