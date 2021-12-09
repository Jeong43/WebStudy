<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>include 디렉티브 실습</h1>
	<hr>
</div>

<%@ include file="Test003.jsp" %>
<!-- 합쳐진 상태로 컴파일 실행 → 하나의 페이지로... -->

<br><br>

<div>
	<h2><%=str %></h2>
	<h2><%=name %></h2>
</div>

</body>
</html>