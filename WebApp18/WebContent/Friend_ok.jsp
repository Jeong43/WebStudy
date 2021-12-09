<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>
<!-- 반복문 필요(다중 선택으로 넘어온 결과값을 출력하기 위한 처리) -->
<%
	String str ="";
	if (ob.getIdelType() != null)
	{
		for (String value : ob.getIdelType())
			str += value + " ";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>확인</h1>
	<hr />
</div>

<div>
	<p>이름 : <%=ob.getName() %></p>
	<p>나이 : <%=ob.getAge() %></p>
	<p>성별 : <%=ob.getGender() %></p>
	<p>이상형 : <%=ob.idelResult(ob.getIdelType())%></p>
<%-- 	<p>이상형 : <%=str%></p> --%>
</div>

</body>
</html>