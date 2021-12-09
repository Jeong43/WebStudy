<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 한글 데이터 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");

	
	//이전 페이지로부터 데이터 수신
	String uName = request.getParameter("userName");
	String uKorStr = request.getParameter("userKor");
	String uEngStr = request.getParameter("userEng");
	String uMatStr = request.getParameter("userMat");
	
	try
	{
		int uKor = Integer.parseInt(uKorStr);
		int uEng = Integer.parseInt(uEngStr);
		int uMat = Integer.parseInt(uMatStr);
		
		// 데이터 베이스 연결
		Connection conn = DBConn.getConnection();
		
		// 쿼리문 준비(insert)
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				+ " VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
	
		// DB 액션 처리 → 작업 객체 생성 및 쿼리문 수행
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uName);
		pstmt.setInt(2, uKor);
		pstmt.setInt(3, uEng);
		pstmt.setInt(4, uMat);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		DBConn.close();
	}
	
	response.sendRedirect("ScoreList.jsp");

%>