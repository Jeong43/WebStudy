<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	request.setAttribute("result", "뾰로롱");
%>
<%
	String su1 = request.getParameter("su1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test3.jsp</title>
</head>
<body>

<div>
	<h1>EL 관련 실습</h1>
	<hr />
</div>

<div>
	<form action=""	method="post"> <!-- 수신처가 없을 경우 → 자기자신 -->
		정수1 <input type="text" name="su1" class="txt"/><br />
		정수2 <input type="text" name="su2" class="txt" /><br />
		<button type="submit" class="btn">결과확인</button>
	</form>
</div>

<div>
	<h2>폼 데이터 수신</h2>
	<h3>1: <%=su1 %></h3>
	<h3>2: <%=request.getParameter("su1") %></h3>
	<h3>3(su1): ${param.su1 }</h3>
	<h3>3(su2): ${param.su2 }</h3>
</div>

<br><br>

<div>
	<h2>폼 데이터를 받아 연산 수행</h2>
	<h3>방법 ①</h3>
	<%
		String s1 = request.getParameter("su1");
		String s2 = request.getParameter("su2");
		
		int s = 0;
		
		if(s1 != null && s2 != null)
			s = Integer.parseInt(s1) + Integer.parseInt(s2);
	%>
	<h4>합: <%=s %></h4>
	
	<h3>방법 ②</h3>
	<h4>합: ${param.su1 + param.su2 }</h4>
	<!-- 파라미터 수신, 캐스팅이 알아서 자동 수행
	 	 null을 대하는 방식(0으로 치환)... check~!! -->
	 	 
	<!-- 서블릿 컨테이너(JSP 관련 처리, HTML 주석은 보인다!)
		 → HTML -->
</div>

<br><br>

<div>
	<h2>setAttribute() 로 넘긴 데이터 수신</h2>
	<h3>방법 ①</h3>
	<h4><%=request.getAttribute("result") %></h4>

	<h3>방법 ②</h3>
	<h4>${result }</h4>

</div>


</body>
</html>