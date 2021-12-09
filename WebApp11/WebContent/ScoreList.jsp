<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	ScoreDAO dao = null;

	String memberCount = "";
	StringBuffer str = new StringBuffer();
	
	try
	{
		dao = new ScoreDAO();
		
		// 인원수
		memberCount = "<span id='memberCount'>전체 인원 수: " + dao.count() + "명</span>";
		
		// 리스트		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th>");
		str.append("<th>국어점수</th><th>영어점수</th><th>수학점수</th>");
		str.append("<th>총점</th><th>평균</th></tr>");
		
		for(ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + score.getSid() + "</td>");
			str.append("<td class='record'>" + score.getName() + "</td>");
			str.append("<td class='record'>" + score.getKor() + "</td>");
			str.append("<td class='record'>" + score.getEng() + "</td>");
			str.append("<td class='record'>" + score.getMat() + "</td>");
			str.append("<td class='record'>" + score.getTot() + "</td>");
			str.append("<td class='record'>" + String.format("%.1f", score.getAvg()) + "</td>");
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
<title>ScoreList.jsp</title>
<link rel = "stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.errMsg {font-size: small; color: red; display: none;}
</style>

<script type="text/javascript">
	function formCheck()
	{
		var name = document.getElementById("name");
		var nameMsg = document.getElementById("nameMsg");
		
		var kor = document.getElementById("kor");
		var korMsg = document.getElementById("korMsg");
		
		var eng = document.getElementById("eng");
		var engMsg = document.getElementById("engMsg");
		
		var mat = document.getElementById("mat");
		var matMsg = document.getElementById("matMsg");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (name.value == "")
		{
			nameMsg.style.display = "inline";
			name.focus();
			return false;
		}
		
		if (kor.value == "" || isNaN(kor.value) || Number(kor.value) < 0 || Number(kor.value) > 100)
		{
			korMsg.style.display = "inline";
			kor.focus();
			return false;
		}
		
		if (eng.value == "" || isNaN(eng.value) || Number(eng.value) < 0 || Number(eng.value) > 100)
		{
			engMsg.style.display = "inline";
			eng.focus();
			return false;
		}
		
		if (mat.value == "" || isNaN(mat.value) || Number(mat.value) < 0 || Number(mat.value) > 100)
		{
			matMsg.style.display = "inline";
			mat.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" class="txt" id="name" name="name">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어성적</th>
				<td>
					<input type="text" class="txt" id="kor" name="kor">
					<span class="errMsg" id="korMsg">1 ~ 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>영어성적</th>
				<td>
					<input type="text" class="txt" id="eng" name="eng">
					<span class="errMsg" id="engMsg">1 ~ 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>수학성적</th>
				<td>
					<input type="text" class="txt" id="mat" name="mat">
					<span class="errMsg" id="matMsg">1 ~ 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" id="dtn">성적추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<div>
	<!-- 처리 결과 -->
	<%=str %>
</div>

</body>
</html>