<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="1kb" autoFlush="false" %> --%>
<!-- HTTP 상태 500 – 내부 서버 오류 
	근본 원인 (root cause)
	java.io.IOException: 오류: JSP 버퍼 오버플로우
	
	-> 버퍼의 크기는 작은데, 버퍼를 자동으로 비우는 기능도 꺼져있음.
-->
<%-- <%@ page buffer="10kb" autoFlush="false" %> --%>
<!-- 버퍼 크기를 충분히 늘림 → 정상처리 -->
<%-- <%@ page buffer="1kb" autoFlush="true" %> --%>
<!-- 버퍼 크기를 자동으로 비우는 기능을 켜둠 → 정상처리 -->
<%@ page buffer="8kb" autoFlush="true" %>
<!-- 기본값 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	<hr>
</div>

<div>
	<h2>반복문 구성</h2>
	<%
	for(int i=1; i<1000; i++)
	{
	%>	1234<%
	}
	%>
</div>



</body>
</html>