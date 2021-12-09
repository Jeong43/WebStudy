<%@page import="java.net.URLDecoder"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	// 경로 알려준다.(상대경로로)
%>
<%
	//○ 주요 인스턴스 생성
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	MyUtil myUtil = new MyUtil();

	
	//○ 넘어온(요청된) 페이지 확인
	// 현재 표시되어야 하는 페이지
	String pageNum = request.getParameter("pageNum");
	int currentPage = 1;
	if(pageNum != null)
		currentPage = Integer.parseInt(pageNum);

	// 이전 페이지
	String strNum = request.getParameter("num");
	int num = 0;
	if(strNum != null)
		num = Integer.parseInt(strNum);
	
	// 검색 키와 검색 값 수신
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	if (searchKey != null) 	//-- 검색 기능을 통해 페이지가 요청되었을 경우
	{
		// 넘어온 값이 GET 방식이라면...
		// → GET 은 한글 문자열을 인코딩해서 보내기 때문에...
		// → equalsIgnoreCase() : 문자열을 같은 방식으로 통일해서 맞추는 기능(cf: Upper, lower)
		if(request.getMethod().equalsIgnoreCase("GET"))
		{
			// 디코딩 처리
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
			
	}
	else					//-- 기본적인 페이지 요청이 이루어졌을 경우
	{
		searchKey = "subject";
		searchValue = "";
	}
	
	
	//○ 필요한 값 구하기
	// 전체 데이터 개수 구하기
	int dataCount = dao.getDataCount(searchKey, searchValue);
	
	// 전체 페이지를 기준으로 총 페이지 수 계산
	int numPerPage = 10;	// 한 페이지에 표시할 데이터 개수
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);

	// 전체 페이지 수보다 표시할 페이지가 큰 경우
	// 표시할 페이지를 전체 페이지로 처리
	// → 한마디로, 데이터를 삭제해서 페이지가 줄어들었을 경우
	if(currentPage > totalPage)
		currentPage = totalPage;
	
	// 데이터베이스에서 가져올 시작과 끝 위치
	int start = (currentPage-1) * numPerPage + 1;
	int end = currentPage * numPerPage;
	
	// 실제 리스트 가져오기
	List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);
	
	
	//○ 페이징 처리 -- 검색 처리 시 파라미터값 받아올 변수
	String param = "";

	if(!searchValue.equals(""))	// 검색 값이 존재한다면...
	{
		param += "?searchKey=" + searchKey;
		param += "&searchValue=" + searchValue;
	}
	
	String listUrl = "List.jsp" + param;
	String pageIndexList = myUtil.pageIndexLists(currentPage, totalPage, listUrl);
	
	
	//○ 글 내용 보기 주소
	String articleUrl = cp + "/Article.jsp";
	
	if(param.equals(""))
	{
		articleUrl = articleUrl + "?pageNum=" + currentPage;
	}
	else
	{
		articleUrl = articleUrl + param + "&pageNum=" + currentPage;
	}
	
	DBConn.close();	
	
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp %>/css/list.css" type="text/css"/>

<script type="text/javascript">

	function sendIt()
	{
		var f = document.searchForm;
		
		// 검색 키워드에 대한 유효성 검사 코드 활용 가능~!!!
		
		// check~!!!
		f.action = "<%=cp%>/List.jsp";
		f.submit();
		
	}
	
</script>

</head>
<body>

<%-- <%=cp %> --%>

<div id="bbsList">

	<div id="bbsList_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	
	<div id="bbsList_header">
		<div id="leftHeader">
			<!-- check~!!! → form 구성 -->
			<form action="" name="searchForm" method="post">
				<select name="searchKey" class="selectFiled">
					<%
					if(searchKey.equals("subject")) 
					{
					%>
					<option value="subject" selected="selected">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
					<%
					}
					else if(searchKey.equals("name")) 
					{
					%>
					<option value="subject">제목</option>
					<option value="name" selected="selected">작성자</option>
					<option value="content">내용</option>
					<%
					}
					else 
					{
					%>
					<option value="subject" selected="selected">제목</option>
					<option value="name">작성자</option>
					<option value="content" selected="selected">내용</option>
					<%
					}
					%>
				</select>
				<input type="text" name="searchValue" class="textFiled" value=<%=searchValue %>>
				<input type="button" value="검색" class="btn2"
				onclick="sendIt()">
			</form>
		</div><!-- close #leftHeader -->
	
		<div id="rightHeader">
			<input type="button" value="글올리기" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Created.jsp'">
		</div><!-- close #rightHeader -->
		
	</div><!-- close #bbsList_header -->

	
	<div id="bbsList_list">
		
		<div id="title">
			<dl>
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="name">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>
		</div>
		
		<div id="lists">
					 <%
			 for(BoardDTO dto: lists)
			 {
			 %>
			 <dl>
				<dd class="num"><%=dto.getNum() %></dd>
				
				<dd class="subject">
					<a href="<%=articleUrl %>&num=<%=dto.getNum() %>"><%=dto.getSubject() %></a>
				</dd>
				
				<dd class="name"><%=dto.getName() %></dd>
				<dd class="created"><%=dto.getCreated() %></dd>
				<dd class="hitCount"><%=dto.getHitCount() %></dd>
			</dl>
			 <%
			 }
			 %>
			 
		</div>

		<div id="footer">
			<!-- <p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 55</p> -->
			<!-- <p>등록된 게시물이 존재하지 않습니다.</p> -->
			<p>
			<%
			if(dataCount != 0)
			{
			%>
				<!-- 페이징 처리 후, 바로가기 링크 클릭시 아직 이동은 안 되지만(currentPage = 1로 해서.)
				 페이지 요청하면서 페이지 번호가 같이 보내지는 것 확인 가능. -->
				<%=pageIndexList %>
			<%
			}
			else
			{
			%>
				등록된 게시물이 존재하지 않습니다.
			<%
			}
			%>			
			</p>
		</div>
	
	</div><!-- close #bbsList_list -->
	
</div>






</body>
</html>








