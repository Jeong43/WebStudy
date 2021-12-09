<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로부터 넘어온 데이터 수신
	String dan = request.getParameter("dan");
	int nDan = 0;
	String res = "";

	try
	{
		nDan = Integer.parseInt(dan);
		
		for(int i=1; i<=9; i++)
			res += String.format("%d * %d = %d<br>", nDan, i, (nDan*i));
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
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 출력</h2>
	<div><%=res %></div>
</div>

</body>
</html>