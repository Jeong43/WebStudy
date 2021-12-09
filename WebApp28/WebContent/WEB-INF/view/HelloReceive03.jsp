<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloReceive03.jsp</title>
</head>
<body>

<div>
	<h1>수신 페이지</h1>
	<h2>HelloReceive03.jsp</h2>
	<hr />
</div>

<div>
	<form>
		First Name : ${param.firstName } <br>
		Last Name : ${param.lastName } <br>
	</form>
</div>

</body>
</html>