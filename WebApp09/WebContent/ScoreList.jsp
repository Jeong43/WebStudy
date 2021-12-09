<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//결과값 변수
	String str ="";

	// 데이터 베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(select)
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ((KOR+ENG+MAT)/3) AS AVG"
				+ " FROM TBL_SCORE ORDER BY SID";
	
	// 작업 객체 생성 및 준비된 쿼리문 수행
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	// 결과 ResultSet 에 대한 처리 → 반복문 구성
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th id='numTitle'>번호</th>";
	str += "<th id='nameTitle'>이름</th>";
	str += "<th id='scoreTitle'>국어점수</th>";
	str += "<th id='scoreTitle'>영어점수</th>";
	str += "<th id='scoreTitle'>수학점수</th>";
	str += "<th id='scoreTitle'>총점</th>";
	str += "<th id='scoreTitle'>평균</th>";
	str += "</tr>";
	
	while(rs.next())
	{
		str += "<tr>";
		str += "<td class='list'>" + rs.getString("SID") + "</td>";
		str += "<td class='list'>" + rs.getString("NAME") + "</td>";
		str += "<td class='list'>" + rs.getString("KOR") + "</td>";
		str += "<td class='list'>" + rs.getString("ENG") + "</td>";
		str += "<td class='list'>" + rs.getString("MAT") + "</td>";
		str += "<td class='list'>" + rs.getString("TOT") + "</td>";
		str += "<td class='list'>" + String.format("%.1f", rs.getDouble("AVG")) + "</td>";
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel = "stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	#numTitle {width: 50px;}
	#nameTitle {width: 100px;}
	#scoreTitle {width: 150px;}
	.list {text-align: center;}
	input {width: 200px;}
	button {width: 200px; height: 30px; font-weight: bold;}
	.errMsg {font-size: small; color: red; display: none;}
</style>

<script type="text/javascript">

	function formCheck()
	{	
		var uName = document.getElementById("userName");
		var uKor = document.getElementById("userKor");
		var uEng = document.getElementById("userEng");
		var uMat = document.getElementById("userMat");

		var nMsg = document.getElementById("nameErrMsg");
		var kMsg = document.getElementById("korErrMsg");
		var eMsg = document.getElementById("engErrMsg");
		var mMsg = document.getElementById("matErrMsg");

		nMsg.style.display = "none";
		kMsg.style.display = "none";
		eMsg.style.display = "none";
		mMsg.style.display = "none";
		
		if(uName.value == "")
		{
			nMsg.style.display = "inline";
			uName.focus();
			return false;
		}
	
		if(uKor.value == "" || isNaN(uKor.value) || Number(uKor.value) < 0 || Number(uKor.value) > 100)
		{
			kMsg.style.display = "inline";
			uKor.focus();
			return false;
		}
		
		if(uEng.value == "" || isNaN(uEng.value) || Number(uEng.value) < 0 || Number(uEng.value) > 100)
		{
			eMsg.style.display = "inline";
			uEng.focus();
			return false;
		}
		
		if(uMat.value == "" || isNaN(uMat.value) || Number(uMat.value) < 0 || Number(uMat.value) > 100)
		{
			mMsg.style.display = "inline";
			uMat.focus();
			return false;
		}

		return true;
	}

</script>

</head>
<body>

<!-- 
○ WebApp09

- 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력 받아
  총점과 평균을 계산하여 출력해줄 수 있는 프로그램을 구현한다.
- 리스트 출력 시 번호를 오름차순으로 정렬하여 출력할 수 있도록 한다.
- 데이터베이스 연동하여 처리한다. (TBL_SCORE, SCORESEQ 활용)
- 즉, 성적처리 프로그램을 데이터베이스 연동하여 JSP 로 구성할 수 있도록한다.

데이터베이스 연결 및 데이터 처리
--------------------------------------------------------------
성적 처리

이름(*)		[ textbox ] → 이름 입력 확인
국어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
영어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
수학점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인

< 성적 추가 > → button

번호	이름	국어점수	영어점수	수학점수	총점	평균
  1 	이다영	   90			80			70		xxx		xx.x
  2 	윤유동	   80			70			60		xxx		xx.x
  3 	최수지	   70			60			50		xxx		xx.x


○ WebApp09_scott.sql
   ScoreList.jsp
   ScoreInsert.jsp
   com.util.DBConn.java
 
 -->
 
<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<!-- 데이터 입력 -->
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameErrMsg">이름을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="userKor" name="userKor" class="txt">
					<span class="errMsg" id="korErrMsg">1~100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="userEng" name="userEng" class="txt">
					<span class="errMsg" id="engErrMsg">1~100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="userMat" name="userMat" class="txt">
					<span class="errMsg" id="matErrMsg">1~100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<input type="submit" class="btn" value="성적 추가" 
					style="width: 288px; height: 35px; font-weight: bold;">
				</td>
			</tr>
		</table>
	</form>
</div>

<br> 

<div>
	<!-- 처리 결과 -->
	<%=str %>
</div>
 
</body>
</html>