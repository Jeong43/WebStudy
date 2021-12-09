<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr>
</div>

<div>
	<form name="guestForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td><%=ob.getName() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=ob.getTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=ob.getContent().replaceAll("\n", "<br>") %></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>