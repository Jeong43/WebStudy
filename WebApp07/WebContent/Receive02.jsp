<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("userName");
	
	int kor, eng, mat, tot;
	kor=eng=mat=tot=0;
	
	double avg = 0;
	
	try
	{ 
		String korStr = request.getParameter("kor");
		kor = Integer.parseInt(korStr);			
		String engStr = request.getParameter("eng");
		eng = Integer.parseInt(engStr);	
		String matStr = request.getParameter("mat");
		mat = Integer.parseInt(matStr);
		
		tot = kor + eng + mat;
		avg = tot/3.0;
	
	}
	catch(Exception e)
	{
		System.out.print(e.toString());
	} 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {font-weight: bold; font-size: 15pt;}	
</style>
</head>
<body>


<div>
	<h1>데이터 송수신 실습02</h1>
	<hr>
</div>

<div>
	<h2>성적처리 완료</h2>
	<span style="color: blue;"><%=name %></span> 님, 성적처리가 완료되었습니다.<br>
	회원님의 점수는	국어:<span style="color: red;"><%=kor %></span>점,
	영어:<span style="color: red;"><%=eng %></span>점,
	수학:<span style="color: red;"><%=mat %></span>점 입니다. <br>
	총점은 <span style="color: olive;"><%=tot %></span>점,
	평균은 <span style="color: olive;"><%=String.format("%.1f", avg) %></span>점입니다.
</div>

</body>
</html>