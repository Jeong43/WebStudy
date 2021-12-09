<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역 → 이전 페이지로부터 전송된 데이터 수신
	request.setCharacterEncoding("UTF-8");		//check~!!!
		
	String nameStr = request.getParameter("name"); 				//-- 텍스트박스... 단일값 수신
	String genderStr = request.getParameter("gender"); 			//-- 라디오버튼... 단일값 수신
	String majorStr = request.getParameter("major");			//-- 선택상자... 단일값 수신
	String[] hobbyArr = request.getParameterValues("hobby"); 	
	//-- 다중선택이 가능한 선택상자... 『getParameterValues()』로 수신 → 배열 반환
	
	
	// 성별 처리
	String gender = "";
	if(genderStr.equals("F"))
		gender = "여자";
	else if(genderStr.equals("M"))
		gender = "남자";
	else 
		gender = "확인불가";
	
	// 취미 처리
	String hobby = "";
	if(hobbyArr != null)
	{
		for(String item : hobbyArr)
			hobby += "[" + item + "] ";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습03</h1>
	<hr>
	<p>RadioSelect.jsp ○ → RadioSelect_ok.jsp ●</p>
</div>

<div>
	<h2>결과</h2>
	<p>이름: <%=nameStr %></p>
	<p>성별: <%=genderStr %>(<%=gender %>)</p>
	<p>전공: <%=majorStr %></p>
	<p>취미: <%=hobby %></p>
</div>


</body>
</html>