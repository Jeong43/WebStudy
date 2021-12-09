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
<title>PostTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">
#resultDiv {
	width: 200px;
	height: 180px;
	border: 2px solid #499bd7;
}

b {
	color: pink;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#sendBtn").click(function()
		{
			//alert("sendBtn Test");

			$.post("PostTest02_ok.jsp",
			{
				title : $("#title").val(),
				content : $("#content").val()
			}, function(args)
			{
				$("#resultDiv").html(args);
			});

		});
	});
</script>

</head>
<body>

	<div>
		<h1>jQuery의 post() 활용 실습</h1>
		<hr />
	</div>

	<div>
		제목:
		<input type="text" id="title" class="txt" />
		<br /> 내용:
		<input type="text" id="content" class="txt" />
		<br />
		<input type="button" id="sendBtn" value="보내기" class="btn" />
	</div>

	<br />
	<br />

	<div id="resultDiv"></div>
</body>
</html>