<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.test.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Created_ok.jsp
	// subject, name, email, content, pwd 이름 dto와 다 같은지 확인 먼저!
	
	// 이전 페이지로부터 데이터 수신
	// 액션태그 쓰면 이렇게 안 해도 되지....
	// 알아서 받아와서 다 넘겨줘~ 까지 끝. 
	
	// 디폴트 생성자 없고 사용자 정의 생성자만 있으므로...
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 페이지에서 받아온 데이터에 num 값이 없다.
	// 게시물 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();
	
	// 게시물 번호 최대값에 1을 더해서 set하는 과정
	dto.setNum(maxNum+1);
	
	// IP Address 확인
	// request.getRemoteAddr()
	// 요청객체의 원격지에 있는 주소를 얻어오겠다. 는 메소드!
	// 클라이언트(브라우저)의 IP Adress 확인
	dto.setIpAddr(request.getRemoteAddr());
	
	
	dao.insertData(dto);
	
	DBConn.close();
	
	// 안내
	response.sendRedirect("List.jsp");
	
	
	// 로컬 호스트가 글쓴거라 아이피가 아래와 같이 이상하게 남는다..
	// From : 0:0:0:0:0:0:0:1
	// http://211.238.142.150:8090/WebApp20/List.jsp
	// 강의실 가서 여기에 들어가서 글 남겨보기!
	
	
	/* 혼자 작성해봤지만..
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int maxNum = dao.getMaxNum();
	
	String subject = request.getParameter("subject");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");

	BoardDTO dto = new BoardDTO();
	dto.setNum(maxNum+1);
	dto.setSubject(subject);
	dto.setName(name);
	dto.setEmail(email);
	dto.setContent(content);
	dto.setPwd(pwd);
	
	
	int result = 0;
	
	result = dao.insertData(dto);	
	if(result>0)
		response.sendRedirect("Listed.jsp"); */
%>
