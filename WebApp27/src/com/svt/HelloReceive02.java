package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive02 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		// 이전 페이지의 값을 받아오기
		request.setCharacterEncoding("UTF-8");
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
				
		// 화면 출력
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String title = "최종 결과 수신 페이지";
		String subTitle = "HelloReceive02.java";
		String docType = "<!DOCTYPE html>";
		
		out.print(docType);
		out.print("<html>");
		out.print("<head>");
		out.print("<title>" + subTitle + "</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("");
		out.print("<div>");
		out.print("	<h1>" + title + "</h1>");
		out.print("	<h2>" + subTitle + "</h2>");
		out.print("	<hr />");
		out.print("</div>");
		out.print("");
		out.print("<div>");
		out.print("	<form>");
		out.print("		First Name : " + firstName + "<br>");
		out.print("		Last Name : " + lastName + "<br>");
		out.print("	</form>");
		out.print("</div>");
		out.print("");
		out.print("</body>");
		out.print("</html>");     
		
	}

}



