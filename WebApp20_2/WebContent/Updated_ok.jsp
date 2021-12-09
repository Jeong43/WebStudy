<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.test.BoardDTO"></jsp:useBean>  
<jsp:setProperty property="*" name="dto"/>
<%
	// Update_ok.jsp
	
	// 추가
	String pageNum = request.getParameter("pageNum");
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.updateData(dto);
	
	DBConn.close();
	
	response.sendRedirect(cp + "/List.jsp?num="+ dto.getNum() + "&pageNum=" + pageNum);
	
	/* 
	
	선생님 제가 아티클에서 수정할 게시물 번호(num)넘겨줄 때 dto.getNum()이 안되길래
	num으로 받아온 거 넘겨도 된다고 하셔서 num으로 넘겼었거든요 
	거기서부터 문제인 것 같아요... dto가 넘어가지 않았던 거...
	
	지금 게시물 수정하고 나면 num=0 pageNum=null이에요
	아마 게시물도 수정 안 된 것 같아요
	
	아까 혼자 풀고 나서는 그래도 수정까지는 됐었거든요..?(변명..ㅠㅠ)
	*/
%>