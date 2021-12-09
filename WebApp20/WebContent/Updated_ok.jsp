<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%
	// 이전 페이지로부터 수신한 값
	String numStr = request.getParameter("num");
	int num = Integer.parseInt(numStr);
	dto.setNum(num);
	
	String pageNum = request.getParameter("pageNum");

	// DB 연결
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// DAO의 수정 메소드 실행
	int result = dao.updateData(dto);
	
	//result 값에 따른 분기 처리 가능
	
	// DB 연결 종료
	dao.close();
	
	// 페이지 재요청
	response.sendRedirect(cp + "/List.jsp?num=" + dto.getNum() + "&pageNum=" + pageNum);
	
%>