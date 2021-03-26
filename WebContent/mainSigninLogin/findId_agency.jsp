<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="findId_agencyProc.jsp">
<table><caption>중개사 아이디 찾기</caption>

<tr>
<td>중개사무소 이름</td>
<td><input type="text" name="agency_name"></td>
</tr>
<tr>
<td>대표 중개사 이름</td>
<td><input type="text" name="agent_name"></td>
</tr>
<tr>
<td><input type="submit" value="아이디 찾기"></td>
<td><input type="button" value="로그인" onclick="location.href='login_agency.jsp'"></td>
</tr>
</table>
</form>