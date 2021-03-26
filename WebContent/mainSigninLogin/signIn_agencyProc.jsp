<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="abean" class="agency.AgencyBean" ></jsp:useBean>
<jsp:setProperty property="*" name="abean"/>
<%
AgencyDao dao=AgencyDao.getInstance();
System.out.println("agency가입"+abean.getCertified());
int count=dao.insertAgency(abean);
if(count>0){%>
<script type="text/javascript">
var confirmval=confirm("가입성공!로그인하시겠습니까?");
if(confirmval==true){	
location.href="login_agency.jsp";
}
</script>
<%
}else {%>
<script type="text/javascript">
	alert("가입 실패");
	location.href="signIn_agencys.jsp";
</script>
<%
}
%>
  
