<%@page import="agency.AgencyDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String agency=(String)session.getAttribute("mid");
int cnt=dao.insertApartment(multi,agency);
String msg;
String url;
if(cnt>0){
	msg="매물 등록 성공";
	url="realEstateList.jsp";
}else{
	msg="매물 등록 실패";
	url="insertRealEstate.jsp";
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>
 