<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String gugudanStr = request.getParameter("gugudan");
	int gugudan = 0;
	String result = "";

	try
	{
		gugudan = Integer.parseInt(gugudanStr);

		for(int i=1; i<=9; i++)
			result += String.format("%d * %d = %d<br>", gugudan, i, (gugudan*i));
		
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
<title>Receive09.jps</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
</div>

<div>
	<h2>수신된 데이터: <%=gugudanStr %></h2>
	<%=result %>
</div>

</body>
</html>