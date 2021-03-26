<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
String usertype=(String)session.getAttribute("usertype");
if(usertype!="agency") {%>
<script type="text/javascript">
	alert("중개사무소만 이용할 수 있는 사이트 입니다.\n중개사무소 아이디로 로그인해주세요");
	location.href="main.jsp";
</script>
<% }else{
response.sendRedirect("../agency/main_agency.jsp");
}
%>