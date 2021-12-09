<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지로부터 전송된 데이터 수신
	request.setCharacterEncoding("UTF-8");

	// 이름 데이터 수신
	String nameStr = request.getParameter("name");

	// 메모 데이터 수신
	String memoStr = request.getParameter("memo");
	memoStr = memoStr.replaceAll("\n", "<br>");
	//-- JDK 1.5 이후 『replaceAll()』 사용 가능.
	//   『replaceAll()』을 통해 처리한 결과물을 다시 memo 변수에 대입
	//   "안녕하세요\n반갑습니다" → "안녕하세요<br>반갑습니다"
	
	// 이상형 데이터 수신
	String[] checkArr = request.getParameterValues("checkGroup");
	// ※ 같은 name 속성의 값을 가진 데이터를 여러 개 받는 경우(다중 데이터로 수신하는 경우)
	//    이를 배열로 처리해야 한다. → 『getParameterValues()』
	
	String checkStr = "";
	if(checkArr != null)
	{
		for(String item : checkArr)
			checkStr += "[" + item + "] ";
	}
	// ※ 배열 데이터를 수신하여 처리할 경우...
	//    수신된 데이터가 전혀 없는 경우는
	//    배열의 값 자체가 null 이 되어버리기 때문에
	//    null 에 대한 확인(검사) 과정이 필요하다. check~!!!

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습04</h1>
	<hr>
	<p>CheckBox.jsp ○ → CheckBox_ok.jsp ●</p>
</div>

<div>
	<h2>결과</h2>
	<p>이름: <%=nameStr %></p>
	<p>메모: </p>
	<p><%=memoStr %></p>
	<p>이상형: <%=checkStr %></p>
</div>

</body>
</html>