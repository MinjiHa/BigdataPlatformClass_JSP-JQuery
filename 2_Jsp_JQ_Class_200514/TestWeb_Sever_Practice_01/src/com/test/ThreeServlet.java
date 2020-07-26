package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ThreeServlet")

public class ThreeServlet extends GenericServlet{
	


	@Override
	public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Service started");
		
		arg1.setContentType("text/html");
		PrintWriter out = arg1.getWriter();
		out.print("<html><body>");
		out.print("<h1> Hello Servlet, It's Three Servlet </h1>");
		out.print("</body></html>");
		System.out.println("Servlet three is serviced");
	}
}