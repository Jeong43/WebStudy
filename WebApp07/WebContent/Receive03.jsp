<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2;
	su1 = su2 = 0;
	String res = "";
	
	try
	{
		su1 = Integer.parseInt(su1Str);
		su2 = Integer.parseInt(su2Str);
		
		switch(op)
		{
			case "+" : res = String.valueOf(su1 + su2); break;
			case "-" : res = String.valueOf(su1 - su2); break;
			case "*" : res = String.valueOf(su1 * su2); break;
			case "/" : res = String.format("%.1f", su1/(double)su2); break;
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	<p>입력하신 <span style="font-size: 25pt;"><%=su1 %></span>과 
	<span style="font-size: 25pt;"><%=su2 %></span>의 
	연산 결과는 <span style="color: pink;"><%=res %></span> 입니다.</p>
</div>

</body>
</html>