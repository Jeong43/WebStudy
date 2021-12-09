<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function sendIt()
	{
		var f = document.forms[0];
		
		if(!f.name.value)
		{
			alert("이름을 입력해주세요.");
			f.name.focus();
			return;
		}
		
		if(!f.title.value)
		{
			alert("제목을 입력해주세요.");
			f.title.focus();
			return;
		}
		
		if(!f.content.value)
		{
			alert("내용을 입력해주세요.");
			f.content.focus();
			return;
		}
		
		f.submit();
	}

</script>

</head>
<body>

<div>
	<h1>방명록 작성</h1>
	<hr />
</div>

<div>
	<form action="Guest_ok.jsp" method="post" name="guestForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td><input type="text" class="txt" name="name"/></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" class="txt" name="title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="30" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn"
					style="width: 100%;">
						방명록 작성
					</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>