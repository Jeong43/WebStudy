<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 수정 액션 요청 시 넘어온 데이터(num) 수신
	int num = Integer.parseInt(request.getParameter("num"));

	// 추가
	String pageNum = request.getParameter("pageNum");

	// 삭제 액션 요청 처리 과정에서 추가
	String statusStr = request.getParameter("status");
	int status = Integer.parseInt(statusStr);

	// DB 연결
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	BoardDTO dto = dao.getReadData(num);
	
	DBConn.close();
	
	if(dto==null)
		response.sendRedirect("List.jsp");
	// 내가 작성하고 패스워드 공개했어. 근데 그 게시물을 진희가 지웠어. 중호가 들어왓다가 없어서 리다이렉트됨.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Updated.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/css/created.css" type="text/css"/>

<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<script type="text/javascript">

	function sendIt()
	{
		f = document.myForm;
		
		//제목 입력 확인-------------------------
		str = f.subject.value;
		str = str.trim();
		
		// ※ javascript에는 trim()이 존재하지 않음.
		//    외부에서 참조한 util.js에 만들어두었음
		
		// 테스트
		// alert("|" + str + "|");
		
		if(!str)
		{
			alert("\n제목을 입력하세요~!!!");
			f.subject.focus();
			return;
		}
		//------------------------- 제목 입력 확인
		
		
		//이름 입력 확인-------------------------
		str = f.name.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n작성자 이름을 입력하세요~!!!");
			f.name.focus();
			return;
		}
		//------------------------- 이름 입력 확인
		
		
		//이메일 입력 확인-------------------------
		// 필수입력사항이 아니므로 입력이 돼있을 때에만 확인하겠다.
		if(f.email.value)
		{
			if(!isValidEmail(f.email.value))
			{
				alert("\n정상적인 이메일 형식을 입력하세요~!!!");
				f.email.focus();
				return;
			}
		}
		//------------------------- 이메일 입력 확인
		
		
		//패스워드 입력 확인-------------------------
		str = f.pwd.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n패스워드를 입력하세요~!!!");
			f.pwd.focus();
			return;
		}
		
		// 숨겨둔 패스워드와 값 비교
		var pwdSource = f.pwdSource.value;
		if(str != pwdSource)
		{
			alert("\n패스워드가 맞지 않습니다~!!!");
			f.pwd.focus();
			return;
		}
		
		
		//------------------------- 패스워드 입력 확인
		
		<%-- f.action = "<%=cp%>/Updated_ok.jsp?num=<%=num%>"; --%>
		
		f.action = "<%=cp%>/Updated_ok.jsp";
		f.submit();
		
	}
	
	function removeIt()
	{
		f = document.myForm;
		
		str = f.pwd.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n패스워드를 입력하세요~!!!");
			f.pwd.focus();
			return;
		}
		
		// 숨겨둔 패스워드와 값 비교
		var pwdSource = f.pwdSource.value;
		if(str != pwdSource)
		{
			alert("\n패스워드가 맞지 않습니다~!!!");
			f.pwd.focus();
			return;
		}

		f.action = "<%=cp%>/Delete_ok.jsp";
		f.submit();
	}
	
	

</script>
</head>
<body>

<div id="bbs">

	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	
	<form action="" method="post" name="myForm">
		
		<div id="bbsCreated">
			
			
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
					<dd>
						<%
						if(status==1)
						{
						%>
						<input type="text" name="subject" size="74"
						maxlength="100" class="boxTF"
						value="<%=dto.getSubject()%>">
						<%
						}
						else
						{
						%>
						<input type="text" name="subject" size="74"
						maxlength="100" class="boxTF"
						value="<%=dto.getSubject() %>" disabled="disabled">
						<%
						}
						%>
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
		
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작 성 자</dt>
					<dd>
						<%
						if(status==1)
						{
						%>
						<input type="text" name="name" size="35"
						maxlength="20" class="boxTF"
						value="<%=dto.getName()%>">
						<%
						}
						else
						{
						%>
						<input type="text" name="name" size="35"
						maxlength="20" class="boxTF"
						value="<%=dto.getName()%>" disabled="disabled">
						<%
						}
						%>
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
		
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>이 메 일</dt>
					<dd>
						<%
						if(status==1)
						{
						%>
						<input type="email" name="email" size="35"
						maxlength="50" class="boxTF"
						value="<%=dto.getEmail()%>">
						<%
						}
						else
						{
						%>
						<input type="email" name="email" size="35"
						maxlength="50" class="boxTF"
						value="<%=dto.getEmail()%>" disabled="disabled">
						<%
						}
						%>
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
		
		
			<div id="bbsCreated_content">
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
						<%
						if(status==1)
						{
						%>
						<textarea name="content" class="boxTA" 
						cols="63" rows="12"><%=dto.getContent() %></textarea>
						<%
						}
						else
						{
						%>
						<textarea name="content" class="boxTA" 
						cols="63" rows="12" disabled="disabled"><%=dto.getContent() %></textarea>
						<%
						}
						%>
					</dd>
				</dl>
			</div><!-- close #bbsCreated_content -->
			
			
			<div id="bbsCreated_noline">
				<dl>
					<dt>패스워드</dt>
					<dd>
						<input type="hidden" name="pwdSource" value="<%=dto.getPwd()%>">
						<input type="password" name="pwd" size="35"
						maxlength="10" class="boxTF">
						<!-- 여기에 패스워드 두면 이전 값이 채워져있으므로...
						숨겨둔 패스워드(넘어온 데이터)와 같은지 비교해서 수정 권한을 확인하게 된다. -->
						&nbsp;(게시물 수정 및 삭제 시 필요~!!!)
					</dd>
				</dl>
			</div><!-- close #bbsCreated_noline -->
			
			
			<div id="bbsCreated_footer">
			
				<!-- Updated_ok.jsp 페이지 요청 과정에서 반드시 번호데이터를 넘겨주어야 한다. -->
				<%-- <input type="hidden" name="num" value="<%=dto.getNum()%>"> --%>
				<input type="hidden" name="num" value="<%=dto.getNum()%>">
				<input type="hidden" name="pageNum" value="<%=pageNum%>">
			
				<%
				if(status==1)
				{
				%>
				<input type="button" value="수정하기"  class="btn2" 
				onclick="sendIt()"/>
				<input type="reset" value="다시입력" class="btn2"
				onclick="document.myForm.subject.focus();" />
				<input type="button" value="수정취소" class="btn2" 
				onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>&num=<%=dto.getNum() %>'" />
				<%
				}
				else
				{				
				%>
				<input type="button" value="삭제하기"  class="btn2" 
				onclick="removeIt()"/>
				<input type="button" value="삭제취소" class="btn2" 
				onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>&num=<%=dto.getNum() %>'" />
				<%
				}
				%>
			</div><!-- close #bbsCreated_footer -->
			
		</div><!-- close #bbsCreated -->
		
	</form>
</div>

</body>
</html>