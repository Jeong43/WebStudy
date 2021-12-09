<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	// 이전 페이지로부터 데이터(userName, userTel) 수신
	// 한글 데이터 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");

	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");
	
	// 데이터 베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(insert)
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
			+ "VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", uName, uTel);

	// DB 액션 처리 → 작업 객체 생성 및 쿼리문 수행
	Statement stmt = conn.createStatement();
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if (result<1)
	{
		// 에러 페이지로 연결
		response.sendRedirect("Err.jsp");
	}
	else
	{
		// 리스트 페이지 주소를 다시 요청
		// → 원하는 대로 리스트 내용 변한 것 확인
		response.sendRedirect("Test002.jsp");
	}

%>