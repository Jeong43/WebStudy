<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<%-- <div>
<%=ob.result() %> 
</div> --%>

<%-- <div>
	제목 : <%=ob.getTitle() %><br>
	글쓴이 : <%=ob.getName() %><br>
	내용 : <%=ob.getContents() %>
</div> --%>

<div>
	<h1>작성된 기본 방명록 화면</h1>
</div>

<div>
	<table class="table">
			<tr>
				<th>작성자</th>
				<td>
					<%=ob.getName() %>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<%=ob.getTitle() %>
				</td>
			</tr>
			<tr>
				<th>방명록 내용</th>
				<td>
					<%=ob.getContents() %>
				</td>
			</tr>
		</table>
</div>

</body>
</html>