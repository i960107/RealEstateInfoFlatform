<%@page import="agency.AgencyDao"%>
<%@page import="members.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");
MemberDao dao=MemberDao.getInstance();
boolean loginResult=dao.logIn(id,password);
String msg;
String url;
if(loginResult){
	msg="로그인 성공";
	url="main.jsp";
	session.setAttribute("mid",id);
	session.setAttribute("usertype","member");
System.out.println(session.getAttribute("mid"));
}else {
	msg="아이디와 비밀번호를 확인해주세요";
	url="login.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>

 

