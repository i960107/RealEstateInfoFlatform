<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="abean" class="agency.AgencyBean"></jsp:useBean>
<jsp:setProperty property="*" name="abean"/>
<%
AgencyDao adao=AgencyDao.getInstance();
int cnt=adao.updateAgency(abean);
if(cnt>0){
%>
<script type="text/javascript">
alert("수정 성공");
location.href="updateAgency.jsp"
</script>
<%}%>

 