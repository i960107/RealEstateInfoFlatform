<%@page import="members.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
String email=request.getParameter("email");
MemberDao mdao=MemberDao.getInstance();
String id=mdao.findIdbyNameEmail(name,email);
String msg;
String url;
if(id==null){
	msg="찾는 아이디가 없습니다";
url="findId.jsp";
}else{
	msg="아이디는 "+id+"입니다";
url="login.jsp?id="+id;	
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>