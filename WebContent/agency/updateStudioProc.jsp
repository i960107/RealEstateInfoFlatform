<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="agency.StudioBean"%>
<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String configFolder=config.getServletContext().getRealPath("img");
System.out.print(configFolder);
String encoding="UTF-8";
int maxSize=1024*1024*5;
MultipartRequest multi=new MultipartRequest(
	request,
	configFolder,
	maxSize,
	encoding
	);

%>
<%
AgencyDao dao=AgencyDao.getInstance();
int cnt=dao.updateStudio(multi);
String msg;
String url;
if(cnt>0){
	msg="매물 수정 성공";
	url="realEstateList.jsp";
}else{
	msg="매물 수정 실패";
	url="updateStudio.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>
 
%>
