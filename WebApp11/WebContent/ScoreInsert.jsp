<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//-- 데이터 입력 액션 처리 페이지
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	ScoreDAO dao = null;
	
	try
	{
		int kor = Integer.parseInt(korStr);
		int eng = Integer.parseInt(engStr);
		int mat = Integer.parseInt(matStr);
		
		dao = new ScoreDAO();
				
		// MemberDTO 구성
		ScoreDTO score = new ScoreDTO();
		score.setName(name);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		// dao 의 add() 메소드 호출 → insert 쿼리문 수행
		dao.add(score);
		
		// insert 액션의 정상 처리 여부 확인 후 추가 코드 구성 가능~!!!
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
	
	// 리다이렉트
	response.sendRedirect("ScoreList.jsp");
%>