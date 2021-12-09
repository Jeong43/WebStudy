<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");
	String op = request.getParameter("op");
	
	String res = "";
	
	try
	{
		int su1 = Integer.parseInt(su1Str);
		int su2 = Integer.parseInt(su2Str);
		
		switch(op)
		{
			case "+": res = String.format("%d + %d = %d", su1, su2, (su1+su2)); break;
			case "-": res = String.format("%d - %d = %d", su1, su2, (su1-su2)); break;
			case "*": res = String.format("%d * %d = %d", su1, su2, (su1*su2)); break;
			case "/": res = String.format("%d / %d = %.1f", su1, su2, (su1/(double)su2)); break;
		}
		
		request.setAttribute("result", res);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<jsp:forward page="Receive11.jsp"></jsp:forward>

</body>
</html>