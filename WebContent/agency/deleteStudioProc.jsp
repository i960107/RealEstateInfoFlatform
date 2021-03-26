<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String no=request.getParameter("no");
AgencyDao dao=AgencyDao.getInstance();
int cnt=dao.deleteStudio(no);
String msg;
String url;
if(cnt>0){
	msg="매물 삭제 성공";
	url="realEstateList.jsp";
}else{
	msg="매물 삭제 실패";
	url="realEstateList.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>
 
%>
 