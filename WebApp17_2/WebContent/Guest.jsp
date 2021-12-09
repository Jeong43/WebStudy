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
		//확인
		//alert("함수 호출 확인");
	}

</script>
</head>
<body>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
</div>

<div>
	<form action="Guest_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" class="txt">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" class="txt">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" name="contents" cols="30"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" onclick="sendIt()" class="btn"
					style="width: 100%;">
						방명록 작성
					</button>
					<!-- <button type="submit" class="btn"
					style="width: 100%;">
						방명록 작성
					</button> -->
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>