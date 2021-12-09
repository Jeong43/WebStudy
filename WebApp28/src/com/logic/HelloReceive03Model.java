/*==================================
	MVCSample02Model.java
	- Model 역할을 수행할 클래스
==================================*/

package com.logic;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive03Model
{
	public String actionCount(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String result = "";
		
		// 이전 페이지의 값을 받아오기
		request.setCharacterEncoding("UTF-8");
		
		request.getParameter("firstName");
		request.getParameter("lastName");
		
		/*
		// ${param.firstName } 으로 수신할 경우, setAttribute 하지 않아도 됨.
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");

		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		*/ 
		
		
		// 호출		
		result = "WEB-INF/view/HelloReceive03.jsp";
		
		return result;
	}
	
	
}
