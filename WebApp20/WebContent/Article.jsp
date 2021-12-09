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
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 페이지(List.jps → 목록페이지)로부터 데이터(num, pageNum) 수신
	String pageNum = request.getParameter("pageNum");	//-- 페이지 번호
	String strNum = request.getParameter("num");		//-- 게시물 번호
	int num = Integer.parseInt(strNum);
	
	// 해당 게시물의 조회수 증가
	dao.updateHitCount(num);
	
	// 해당 게시물의 상세 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// 이전, 다음 게시물 번호 확인
	int beforeNum = dao.getBeforeNum(num);
	int nextNum = dao.getNextNum(num);

	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if(beforeNum != -1)
		dtoBefore = dao.getReadData(beforeNum);
	
	if(nextNum != -1)
		dtoNext = dao.getReadData(nextNum);
	
	
	// check~!!!
	// ①삭제한 게시글을 클릭한 경우 ②주소를 변경하여 접근한 경우
	if(dto == null)
		response.sendRedirect("List.jsp");
	
	// 게시글 본문 라인 수 확인
	int lineSu = dto.getContent().split("\n").length;
	
	// 게시물 내용
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	// 안녕하세요\n반갑습니다\n맛점하세요\n
	// → 안녕하세요<br>반갑습니다<br>맛점하세요<br>
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">

</head>
<body>

<div id="bbs">
	
	<div id="bbs_title">
	 게 시 판 (JDBC 연동 버전)  
	</div>
	 
	<div id="bbsArticle">
	
		<div id="bbsArticle_header">
			<!-- 게시물의 제목입니다. -->
			<%=dto.getSubject() %>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<!-- <dd>정미화</dd> -->
				<dd><%=dto.getName() %></dd>
				
				<dt>라인수</dt> <!-- 해당 게시물의 글이 몇 줄인지 확인 -->
				<!-- <dd>1</dd> -->
				<dd><%=lineSu %></dd>
			</dl>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<!-- <dd>2011-11-05</dd> -->
				<dd><%=dto.getCreated() %></dd>
				<dt>조회수</dt>
				<!-- <dd>251</dd> -->
	            <dd><%=dto.getHitCount() %></dd>
			</dl>
		</div>
		
		<div id="bbsArticle_content">
			<table style="width: 600px">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150px">
						<!-- 어쩌구 저쩌구 이러쿵 저러쿵 내용입니다. -->
						<%=dto.getContent() %>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="bbsArticle_bottomLine">
     		<!-- 이전글 : (104) 취미 분야 게시물 -->
     		<%
     		if(beforeNum != -1)
     		{
     		%>
     		<a href='<%=cp %>/Article.jsp?pageNum=<%= pageNum%>&num=<%=beforeNum %>'>이전글 : (<%=beforeNum %>) <%=dtoBefore.getSubject() %></a>
     		<%
     		}
     		else
     		{
     		%>
     		이전글 : 게시글이 존재하지 않습니다.
     		<%
     		}
     		%>
   		</div>
   
   		<div class="bbsArticle_noLine">
      		<!-- 다음글 : (106) 학습 분야 게시물 -->
      		<%
     		if(nextNum != -1)
     		{
     		%>
      		<a href='<%=cp %>/Article.jsp?pageNum=<%= pageNum%>&num=<%=nextNum %>'>다음글 : (<%=nextNum %>) <%=dtoNext.getSubject() %></a>
      		<%
     		}
     		else
     		{
     		%>
     		다음글 : 게시글이 존재하지 않습니다.
     		<%
     		}
     		%>
   		</div>
	</div><!-- close #bbsArticle -->
	
	<div class="bbsArticle_noLine" style="text-align: right;">
		<!-- From : 211.238.142.150 -->
		From : <%=dto.getIpAddr() %>
	</div>
	
	<div id="bbsArticle_footer">
		
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2"
			onclick="javascript:location.href='<%=cp %>/Updated.jsp?num=<%=dto.getNum() %>&pageNum=<%=pageNum %>'">
			<input type="button" value="삭제" class="btn2"
			onclick="javascript:location.href='<%=cp %>/Delete.jsp?num=<%=dto.getNum() %>'">
		</div>
		
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2"
			onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'">
		</div>
	
	</div> <!-- close #bbsArticle_footer -->
	
</div> <!-- close #bbs -->



</body>
</html>