<%@page import="agency.AgencyDao"%>
<%@page import="members.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String agency_name=request.getParameter("agency_name");
String agent_name=request.getParameter("agent_name");
AgencyDao adao=AgencyDao.getInstance();
String id=adao.findIdbyName(agency_name,agent_name);
String msg;
String url;
if(id==null){
	msg="찾는 아이디가 없습니다";
url="findId_agency.jsp";
}else{
	msg="아이디는 "+id+"입니다";
url="login_agency.jsp?id="+id;	
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>