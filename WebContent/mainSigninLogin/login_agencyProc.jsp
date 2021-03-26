<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");
AgencyDao dao=AgencyDao.getInstance();
boolean loginResult=dao.logIn(id,password);
String msg;
String url;
if(loginResult){
	msg="로그인 성공";
	url="../agency/main_agency.jsp";
	session.setAttribute("mid",id);
	session.setAttribute("usertype","agency");
}else {
	msg="아이디와 비밀번호를 확인해주세요";
	url="login_agency.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>