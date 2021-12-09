<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect12.jsp
	// 이전 페이지(Send12.html)로부터 데이터 수신
	
	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");
	String op = request.getParameter("op");
	
	
	
	try
	{
		int su1 = Integer.parseInt(su1Str);
		int su2 = Integer.parseInt(su2Str);
		String res = "";
		
		switch(op)
		{
			case "1": res = String.format("%d", (su1+su2)); break;
			case "2": res = String.format("%d", (su1-su2)); break;
			case "3": res = String.format("%d", (su1*su2)); break;
			case "4": res = String.format("%.1f", (su1/(double)su2)); break;
		}

		// check~!!!
		// 결과 데이터 재전송~!!! → sendRedirect() 메소드 사용
		// ※ response 객체의 주요 메소드 중 하나인 『sendRedirect(String location)』
		//	  : 지정된 URL(location)로 요청을 재전송한다.
		response.sendRedirect("Receive12.jsp?su1="+su1+"&su2="+su2+"&op="+op+"&res="+res);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
%>