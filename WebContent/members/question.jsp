<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../mainSigninLogin/top.jsp" %>
<td colspan=6 class="contentTd">
<form action="questionProc.jsp">
<table><caption><b>문의글 남기기</b></caption>
<tr>
<td>아이디<td>
<%
String member_id=(String)session.getAttribute("mid");
String usertype=(String)session.getAttribute("usertype");

%>
<td><input type="text" disabled value="<%=member_id%>">
<input type="hidden"  name="member_id" value="<%=member_id%>">
<input type="hidden" name="agency_id" value="<%=request.getParameter("agency_id")%>">
<input type="hidden" name="usertype" value="<%=usertype%>">
</td>
</tr>
<tr>
<td>매물종류<td>
<td><input type="text" disabled="disabled" name="kind" value="<%=request.getParameter("kind")%>">
<input type="hidden"  name="kind" value="<%=request.getParameter("kind")%>">
</td>
</tr>
<tr>
<td>매물번호<td>
<td><input type="text" disabled="disabled" value="<%=request.getParameter("no")%>">
<input type="hidden"  name="rs_no"value="<%=request.getParameter("no")%>">
</td>
</tr>
<tr>
<td colspan="2" align="center">
<textarea name="content" cols=30 rows=5></textarea>
</td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="제출" onClick="return questionSave()"></td>
</tr>
</table>
</form>
</td>
<%@include file="../mainSigninLogin/bottom.jsp" %>