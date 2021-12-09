<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
</head>
<body>

	<div>
		<h1>JSTL Core 문제</h1>
		<h2>회원 정보 입력</h2>
		<hr />
	</div>

	<div>
		<form action="MemberInsert.jsp" method="post">
			<!-- 이름, 전화번호, 주소 * 5명 분 → jspl 활용 -->
			<c:forEach var="count" begin="1" end="5" step="1">
				<div>${count }번째</div>
				<div>
					이름 : <input type="text" name="name${count }" class="txt"><br>
					전화번호 : <input type="text" name="tel${count }" class="txt"><br>
					주소 : <input type="text" name="addr${count }" class="txt"><br>
					<br><br>
				</div>
			</c:forEach>
			
			<!-- submit 액션 수행 -->
			<button type="submit" class="btn">Insert</button>
		</form>
	</div>

</body>
</html>