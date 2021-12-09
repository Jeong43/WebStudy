<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역
	// 이전 페이지로부터 넘어온 데이터 수신
	String danStr = request.getParameter("dan");
	int n = 0;
	int[] res = new int[9];

	try
	{
		n = Integer.parseInt(danStr);
		
		for(int i=0; i<9; i++)
			res[i] = n * (i+1);
	}
	catch(Exception e)
	{
		System.out.println(e.toString()); 					// → 콘솔
		getServletContext().log("오류: " + e.toString());	// → log 기록
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습02</h1>
	<hr>
	<p>Gugudan.jsp ○ → Gugudan_ok.jsp ●</p>
</div>

<!-- html 주석문 -->
<%-- jsp 주석문 --%> 
<%---> 브라우저를 만드는 시점에서 보이지 않으므로, 페이지 소스를 확인해도 보이지 않는다. --%>


<%-- 나의 풀이 --%>
<%--
	<div>
		<h1>결과</h1>
		<p><%=dan %> * 1 = <%=res[0] %></p>	
		<p><%=dan %> * 2 = <%=res[1] %></p>	
		<p><%=dan %> * 3 = <%=res[2] %></p>	
		<p><%=dan %> * 4 = <%=res[3] %></p>	
		<p><%=dan %> * 5 = <%=res[4] %></p>	
		<p><%=dan %> * 6 = <%=res[5] %></p>	
		<p><%=dan %> * 7 = <%=res[6] %></p>	
		<p><%=dan %> * 8 = <%=res[7] %></p>	
		<p><%=dan %> * 9 = <%=res[8] %></p>	
	</div> 
--%>


<%-- 함께 풀이 --%>
<div>
	<h1>결과</h1>
	<%
		for(int i=1; i<=9; i++)
			out.print(n + " * " + i + " = " + (n*i) + "<br>");
	%>
</div>

<br><br><br>

<%-- 함께 풀이2 --%>
<%
	for(int i=1; i<=9; i++)
	{
%>
		<%=n %> * <%=i %> = <%=(n*i) %> <br>
<%
	}
%>











</body>
</html>