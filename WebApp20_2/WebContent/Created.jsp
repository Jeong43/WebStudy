<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Created.jsp</title>
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
		//------------------------- 패스워드 입력 확인
		
		f.action = "<%=cp%>/Created_ok.jsp";
		f.submit();
		
	}

	/* 
	자스 코드 구성할 때
	외부에서 코드 가져오는 코드와 내부에서 정의 하는 코드 
	따로 구성해야 한다.
	외부에서 가져오는 것는 그걸로 코드 끝난것이다.
	*/

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
						<input type="text" name="subject" size="74"
						maxlength="100" class="boxTF">
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
		
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>작 성 자</dt>
					<dd>
						<input type="text" name="name" size="35"
						maxlength="20" class="boxTF">
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
		
		
			<div class="bbsCreated_bottomLine">
				<dl>
					<dt>이 메 일</dt>
					<dd>
						<input type="email" name="email" size="35"
						maxlength="50" class="boxTF">
					</dd>
				</dl>
			</div><!-- close .bbsCreated_bottomLine -->
		
		
			<div id="bbsCreated_content">
				<dl>
					<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
					<dd>
					<textarea name="content" class="boxTA" cols="63" rows="12"></textarea>
					</dd>
				</dl>
			</div><!-- close #bbsCreated_content -->
			
			
			<div id="bbsCreated_noline">
				<dl>
					<dt>패스워드</dt>
					<dd>
						<input type="password" name="pwd" size="35"
						maxlength="10" class="boxTF">
						&nbsp;(게시물 수정 및 삭제 시 필요~!!!)
					</dd>
				</dl>
			</div><!-- close #bbsCreated_noline -->
			
			
			<div id="bbsCreated_footer">
				<input type="button" value="등록하기"  class="btn2" 
				onclick="sendIt()"/>
				<input type="reset" value="다시입력" class="btn2"
				 onclick="document.myForm.subject.focus();" />
				<input type="button" value="작성취소" class="btn2" 
				onclick="javascript:location.href='<%=cp %>/List.jsp'" />
			</div><!-- close #bbsCreated_footer -->
			
			
		
		</div><!-- close #bbsCreated -->
	</form>


</div>

</body>
</html>