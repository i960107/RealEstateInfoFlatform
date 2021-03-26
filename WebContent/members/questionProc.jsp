<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class="board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bean"/>
<%
System.out.println("시작");
System.out.println(bean.getMember_id());
System.out.println(bean.getAgency_id());
System.out.println(bean.getRs_no());
System.out.println(bean.getKind());
System.out.println(bean.getContent());
BoardDao dao=BoardDao.getInstance();
int cnt=dao.insertQuestion(bean);
String url=request.getContextPath()+"/members/viewDetails_"+bean.getKind()+".jsp?no="+bean.getRs_no();
if(cnt>0){
%>
<script type="text/javascript">
alert("문의 성공");
location.href="<%=url%>";
</script>
<%}%>