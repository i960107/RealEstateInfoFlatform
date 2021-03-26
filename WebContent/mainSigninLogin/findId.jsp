<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="findIdProc.jsp">
<table><caption>아이디 찾기</caption>
<tr>
<td>이름</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td>이메일</td>
<td><input type="text" name="email"></td>
</tr>
<tr>
<td><input type="submit" value="아이디 찾기"></td>
<td><input type="button" value="로그인" onclick="location.href='login.jsp'"></td>
</tr>
</table>
</form>