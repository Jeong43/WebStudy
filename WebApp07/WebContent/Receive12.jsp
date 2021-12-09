<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Redirect12.jsp)로부터 데이터(num1, num2, op, str) 수신
	// → 직접 Redirect12.jsp 로부터 데이터를 넘겨받는 것이 아니라
	//    클라이언트가 새로운 요청을 하는 과정에서 넘긴 값을 수신하게 되는 개념
	
	String su1 = request.getParameter("su1");
	String su2 = request.getParameter("su2");
	String op = request.getParameter("op");
	String res = request.getParameter("res");

	switch(op)
	{
		case "1": op = "+"; break;
		case "2": op = "-"; break;
		case "3": op = "*"; break;
		case "4": op = "/"; break;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive12.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 12</h1>
	<hr>
</div>

<div>
	<h2>결과</h2>
	<%=su1 %> <%=op %> <%=su2 %> = <%=res %>
</div>

</body>
</html>