<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지로부터 전송된 데이터 수신
	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");
	
	// 수신된 데이터 형 변환
	int su1 = 0;
	int su2 = 0;
	
	try
	{	
		su1 = Integer.parseInt(su1Str);
		su2 = Integer.parseInt(su2Str);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
		getServletContext().log("오류: " + e.toString());
	}	

	// 테이블 안에서 1씩 증겨시켜 나갈 변수 선언 및 초기화
	int cnt = 1;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습05</h1>
	<hr>
	<p>Table.jsp ○ → Table_ok.jsp ●</p>
</div>

<div>
	<h2>결과</h2>
	<table border="1">
	<%
		for(int i=0; i<su2; i++)
		{
			out.print("<tr>");
			for(int y=0; y<su1; y++)
			{
				out.print("<td style=\"width: 40px; text-align: right;\">" + cnt++ + "</td>");
			}
			out.print("</tr>");
		}
	%>
	</table>
</div>

</body>
</html>