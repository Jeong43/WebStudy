<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 데이터베이스의 테이블(TBL_MEMBER)이
	//   회원 데이터 추가 액션 처리 수행
	//   ... 이후, 다시 리스트 페이지를 요청할 수 있도록 안내
	
	request.setCharacterEncoding("UTF-8");
	
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();

	try
	{
		dao.connection();
		
		MemberDTO member = new MemberDTO();
		member.setName(uName);
		member.setTel(uTel);
		
		dao.add(member);
		
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

	// check~!!!
	// sendRedirect(목록 페이지를 클라이언트가 다시 요청할 수 있도록 안내)
	response.sendRedirect("MemberSelect.jsp");
	
%>