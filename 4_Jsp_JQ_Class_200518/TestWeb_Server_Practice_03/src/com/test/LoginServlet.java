package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServelt
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("Check_0\n");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.getRequestDispatcher("link.html").include(request, response);
		System.out.print("Check_1\n");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		System.out.print("Check_2\n");
		
		if(name.equals("KKK") && password.equals("1234")) {
			System.out.print("Check_3\n");
			out.print("Welcome, " + name);
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("password", password);
			System.out.print("Check_4\n");
		}
		else {
			System.out.print("Check_5\n");
			out.print("Missmatch name or password");
			request.getRequestDispatcher("Login2.html").include(request, response);
		}
		
		
		/*
		 * response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		request.getRequestDispatcher("link.html").include(request,response);
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		if(name.equals("test") && password.equals("1234")) {
			out.print("Welcome, " + name);
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			session.setAttribute("password", password);
		} else {
			out.print("Mismatch name and password error!");
			request.getRequestDispatcher("login2.html").include(request, response);
		}
		
	}
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
