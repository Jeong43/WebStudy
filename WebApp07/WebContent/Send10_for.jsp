<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ① 이전 페이지(Send10.jsp)로부터 넘어온 데이터(userName) 수신
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	// ② 이 페이지에서 수행한 추가 작업
	request.setAttribute("message", "안녕하세요.");
	
	
	// 리퀘스트 디스패쳐를 사용하면 되지만,
	// 지금은 이해할 수 없으므로... jsp 액션태그를 이용했음
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_for.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<h2>포워드</h2>
</div>

<div>
	<p>이름: <%=userName %></p>
	<!-- ③ ※ 포워딩 -->
	<jsp:forward page="Receive10.jsp"></jsp:forward>
</div>

</body>
</html>