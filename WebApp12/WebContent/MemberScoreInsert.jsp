<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String sid = request.getParameter("sid");
	String korStr = request.getParameter("kor");
	int kor = Integer.parseInt(korStr);
	String engStr = request.getParameter("eng");
	int eng = Integer.parseInt(engStr);
	String matStr = request.getParameter("mat");
	int mat = Integer.parseInt(matStr);
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();

		MemberScoreDTO score = new MemberScoreDTO();
		score.setSid(sid);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		dao.add(score);
		
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
	
	response.sendRedirect("MemberScoreSelect.jsp");

%>