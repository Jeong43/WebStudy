<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%-- 
<%
	String nickName = request.getParameter("nickName");
%>
<%=nickName %>님 안녕하세요. 
--%>
${param.nickName }님 안녕하세요.
반갑습니다.