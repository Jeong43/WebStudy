<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// JsonTest02_ok.jsp
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	// 반환해줄 쿼리스트링
	String result = "";
	
	// JSON 데이터(배열)
	// [{"이름1":"값1", "이름2":"값2", "이름3":"값3"}, {"이름1":"값1", "이름2":"값2", "이름3":"값3"}]
	
	// {"num":"1", "name":"최현정", "content":"내용"},
	// {"num":"2", "name":"최현정", "content":"내용"},
	// {"num":"3", "name":"최현정", "content":"내용"},
	// {"num":"4", "name":"최현정", "content":"내용"},
	// {"num":"5", "name":"최현정", "content":"내용"},
	
	// {"num":"1", "name":"최현정", "content":"내용"},
	// {"num":"2", "name":"최현정", "content":"내용"},
	// {"num":"3", "name":"최현정", "content":"내용"},
	// {"num":"4", "name":"최현정", "content":"내용"},
	// {"num":"5", "name":"최현정", "content":"내용"}	← 마지막 콤마 삭제

	// [{"num":"1", "name":"최현정", "content":"내용"},
	// {"num":"2", "name":"최현정", "content":"내용"},
	// {"num":"3", "name":"최현정", "content":"내용"},
	// {"num":"4", "name":"최현정", "content":"내용"},
	// {"num":"5", "name":"최현정", "content":"내용"}] 

	for(int n=1; n<=5; n++)
	{
		StringBuffer sb = new StringBuffer();
		
		// JsonTest01_ok.jsp 의 내용 복사&붙여넣기
		sb.append("{\"num\":\"" + n + "\"");
		sb.append(", \"name\":\"" + name + "\"");
		sb.append(", \"content\":\"" + content + "\"},");		// checek~!!! 『,』
		
		result += sb.toString();
	}
	
	// 마지막 『,』 탈락
	result = result.substring(0, result.length()-1);
	
	// json 배열 객체 구성
	result = "[" + result + "]";
	
	//①
	//out.println(result);
%>
<%--② --%>
<%=result %>