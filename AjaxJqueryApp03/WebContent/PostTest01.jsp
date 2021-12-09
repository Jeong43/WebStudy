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
<title>PostTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
.txtNum {
	width: 100px;
	text-align: right;
}
#result {
	color: red;
	font-weight: bold;
}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	// ○ 『$.post(url, data, collBack)』
	//     - 매개변수로 전달받은 URL 을 사용하여 서버에 대한 POST 요청을 전송한다.
	//     - 매개변수
	//		 ·url  	: (String) POST 함수로 연결하는 서버측 URL
	//		 ·data 	: (Object) 이름과 값의 쌍으로 프로퍼티를 가진 객체.
	//				  	  미리 구성 및 인코딩이 된 쿼리 스트링	
	//		 ·callBack : (Function) 요청이 완료되면 호출되는 함수.
	
	$(function()
	{
		$("#sendButton").click(function()
		{
			//alert("button Test");

			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			// check~!!!
			// post
			$.post("PostTest01_ok.jsp"
			, {
				su1: su1
				, su2: su2
				, oper: oper
			}, function(args)
			{
				$("#result").html(args);
			});
			//-- data → {이름: 값, 이름: 값, ... }
			
		});
	});
	

</script>

</head>
<body>

	<div>
		<h1>jQuery의 post() 함수 활용 실습</h1>
		<hr>
	</div>

	<div>
		<input type="text" id="su1" class="txt txtNum" />
		<select id="oper">
			<option value="add">덧셈</option>
			<option value="sub">뺄셈</option>
			<option value="mul">곱셈</option>
			<option value="div">나눗셈</option>
		</select>
		<input type="text" id="su2" class="txt txtNum" />
		<input type="button" value=" = " id="sendButton" class="btn" />

	</div>

	<br>

	<div id="result"></div>

	<br />

	<div>
		<input type="radio" />
		rd1
		<input type="radio" />
		rd2
	</div>

	<br />

	<div>
		<input type="text" />
	</div>

</body>
</html>