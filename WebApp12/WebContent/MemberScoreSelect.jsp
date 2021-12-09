<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh' style='width: 50px;'>번호</td>");
		str.append("<th class='nameTh' style='width: 100px;'>이름</td>");
		str.append("<th style='width: 100px;'>국어점수</td>");
		str.append("<th style='width: 100px;'>영어점수</td>");
		str.append("<th style='width: 100px;'>수학점수</td>");
		str.append("<th style='width: 100px;'>총점</td>");
		str.append("<th style='width: 100px;'>평균</td>");
		str.append("<th style='width: 100px;'>석차</td>");
		str.append("<th style='width: 170px;'>회원관리</td>");
		str.append("</tr>");
		
		for(MemberScoreDTO dto : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + dto.getSid() + "</td>");
			str.append("<td>" + dto.getName() + "</td>");
			str.append("<td class='txtScore'>" + dto.getKor() +"</td>");
			str.append("<td class='txtScore'>" + dto.getEng() +"</td>");
			str.append("<td class='txtScore'>" + dto.getMat() +"</td>");
			str.append("<td class='txtScore'>" + dto.getTot() +"</td>");
			str.append("<td class='txtScore'>" + String.format("%.2f", dto.getAvg()) +"</td>");
			str.append("<td class='txtScore'>" + dto.getRank() +"</td>");
			
			// 성적 처리 항목(입력, 수정, 삭제)
			/*
			str.append("<td>");
			str.append("<a href='MemberScoreInsertForm.jsp?sid=" + dto.getSid() + "'>");
			str.append("<button type='button' class='btn01'>입력</button></a>");
			str.append("<a href='MemberScoreUpdateForm.jsp?sid=" + dto.getSid() + "'>");
			str.append("<button type='button' class='btn01'>수정</button></a>");
			str.append("<a href='javascript:memberScoreDelete(" + dto.getSid() + ", \"" + dto.getName() + "\"" + ")'>");
			str.append("<button type='button' class='btn01'>삭제</button></a>");
			str.append("</td>");
			str.append("</tr>");
			*/
			
			if(dto.getKor()==-1 && dto.getEng()==-1 && dto.getMat()==-1)
			{
				str.append("<td>");
				
				str.append("<a href='MemberScoreInsertForm.jsp?sid=" + dto.getSid() + "'>");
				str.append("<button type='button' class='btn01'>입력</button></a>");
				
				str.append("<button type='button' class='btn02'>수정</button>");
				str.append("<button type='button' class='btn02'>삭제</button>");
				
				str.append("</td>");
			}
			else
			{
				str.append("<td>");
				
				str.append("<button type='button' class='btn02'>입력</button>");
				
				str.append("<a href='MemberScoreUpdateForm.jsp?sid=" + dto.getSid() + "'>");
				str.append("<button type='button' class='btn01'>수정</button></a>");
				str.append("<a href='javascript:memberScoreDelete(" + dto.getSid() + ", \"" + dto.getName() + "\"" + ")'>");
				str.append("<button type='button' class='btn01'>삭제</button></a>");
				
				str.append("</td>");
			}
			
			str.append("</tr>");
		}
		
		str.append("</table>");
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreSelect.jsp</title>
<link rel = "stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

	function memberScoreDelete(sid, name)	
	{
		// ※ name 문자열 넘기는 과정에서 따옴표 구성 주의~!!! 
		
		var res = confirm("번호: " + sid + ", 이름: " + name + "\n이 회원의 성적 정보를 삭제하시겠습니까?");
		//-- confirm 창은 true(확인) 또는 false(취소)를 반환
		
		if(res)
			window.location.href="MemberScoreDelete.jsp?sid=" + sid;
		
	}

</script>

</head>
<body>

<div>
	<h1>회원 <span style="color: blue;">성적</span> 관리 및 출력 페이지</h1>
	<hr>
</div>

<div>
	<a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>

<div>
	<!-- 리스트 출력 -->
	<%= str %>
</div>


</body>
</html>