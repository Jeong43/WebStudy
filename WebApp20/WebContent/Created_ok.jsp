<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"></jsp:setProperty>

<%
	Connection conn = null;
	BoardDAO dao = null;
	
	try
	{	
		// ○ 데이터 베이스 연결 및 DAO 객체 생성
		conn = DBConn.getConnection();
		dao = new BoardDAO(conn);
		
		// ○ DTO 객체에 값 추가 입력
		// maxNum 확인
		int maxNum = dao.getMaxNum();
		dto.setNum(maxNum + 1);
		
		// IP Address 확인
		// → request.getRemoteAddr(); → 클라이언트(브라우저)의 IP Address 확인
		String ipAddr = request.getRemoteAddr();
		dto.setIpAddr(ipAddr);
		
		// ○ DTO 객체 추가
		dao.insertData(dto);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

	response.sendRedirect("List.jsp");
	
%>