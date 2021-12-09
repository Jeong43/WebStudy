<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String gender = request.getParameter("gender");
	String city = request.getParameter("city");
	String[] checkGroup = request.getParameterValues("checkGroup");
	String groups = "";
	
	if(checkGroup != null)
	{
		for(int i=0; i<checkGroup.length; i++)
			groups += "[" + checkGroup[i] + "] ";
	}
	
	// ※ 추후에는 수신된 데이터를... 쿼리문을 통해 DB에 입력하는
	//    처리 과정 등이 포함될 것임을 염두하며 작업을 진행할 수 있도록 하자.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<h2>회원가입 완료</h2>
	<table class="table">
		<tr>
			<th>아이디</th>
			<td><%=userId %></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><%=userPwd %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=userName %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=userTel %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=gender %></td>
		</tr>
		<tr>
			<th>지역</th>
			<td><%=city %></td>
		</tr>
		<tr>
			<th>수강과목</th>
			<td><%=groups %></td>
		</tr>
	</table>
</div>

</body>
</html>