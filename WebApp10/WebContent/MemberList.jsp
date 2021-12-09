<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원 수: ";
	
	try
	{
		dao = new MemberDAO();
		
		
		// 인원수
		memberCount += dao.count() + "명</span>";
		
		
		// 리스트		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>전화번호</th></tr>");
		
		for(MemberDTO member : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + member.getSid() + "</td>");
			str.append("<td class='record'>" + member.getName() + "</td>");
			str.append("<td class='record'>" + member.getTel() + "</td>");
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
<title>MemberList.jsp</title>
<link rel = "stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	input {width: 200px; border-radius: 6px;}
	button {width: 200px; height: 25px; font-family: 맑은 고딕; font-weight: bold;}
	.record {text-align: center;}
	.errMsg {font-size: small; color: red; display: none;}
</style>

<script type="text/javascript">
	
	function formCheck()
	{
		var userName = document.getElementById("userName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if (userName.value == "")
		{
			nameMsg.style.display = "inline";
			userName.focus();
			return false;
		}
		
		return true;
		
	}
</script>

</head>
<body>

<div>
	<h1>데이터베이스 연동 회원관리 실습</h1>
	<hr>
</div>

<div>
	<p>DAO, DTO 개념 적용</p>
	<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" id="btnAdd">회원 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<div>
<!-- 
	<span id="memberCount">전체 인원 수: 5명</span>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
		</tr>
		<tr>
			<td class="record">1</td>
			<td class="record">최현정</td>
			<td class="record">010-1111-1111</td>
		</tr>
		<tr>
			<td class="record">2</td>
			<td class="record">이윤서</td>
			<td class="record">010-1111-1111</td>
		</tr>
		<tr>
			<td class="record">3</td>
			<td class="record">정효진</td>
			<td class="record">010-1111-1111</td>
		</tr>
		<tr>
			<td class="record">4</td>
			<td class="record">장민지</td>
			<td class="record">010-1111-1111</td>
		</tr>
	</table>
 -->	
 
	<!-- 인원 수 확인 -->
	<%=memberCount %>
	
	<!-- 번호 이름 전화번호 리스트 구성 -->
	<%=str.toString() %>

</div>


</body>
</html>