<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/mainSigninLogin/script.js"></script>
<%@include file="../mainSigninLogin/top.jsp" %>
<td colspan=6>
<form action="signIn_memberProc.jsp">
<table  class="contentTd" border=1>

<tr>
<td>아이디<br><span>영어 대,소문자 숫자 혼용</span></td>
<td><input type="text" name="id" oninput="idInput()">
<input type="button" onclick="idDuplicateCheck()" value="중복 확인">
<span id="idmsg"  style="display:none"></span>
</td>
</tr>
<tr>
<td>비밀번호<br><span>숫자,문자,특수문자 포함 8~10글자</span></td>
<td><input type="text" oninput="pwCheck()"name="password">
<span id="pwmsg" ></span>
</td>
</tr>
<tr>
<td>비밀번호 확인</td>
<td><input type="text"  oninput="rePwCheck()" name="rePassword">
<span id="rePwmsg" ></span>
</td>
</tr>
<tr>
<td>이름</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td>phone</td>
<td>
<select name="phone1">
<%String phone1[]={"선택","02","053","051","010"}; 
for(int i=0;i<phone1.length;i++){
%>
<option value="<%=phone1[i]%>"><%=phone1[i]%></option>
<%
}
%>
</select>-
<input type="text" name="phone2">-
<input type="text" name="phone3">
</td>
</tr>
<tr>
<td>주소</td>
<td><input type="text" name="address"></td>
</tr>
<tr>
<td>이메일</td>
<td><input type="text" name="email"></td>
</tr>
<tr>
<td  align="center" colspan=2>
<input type="submit" value="가입하기" onclick="return signInmembersave()">
<input type="button" value="메인페이지로" onclick="location.href='main.jsp'">
</td>
</tr>
</table>

</form>
<%@include file="../mainSigninLogin/bottom.jsp" %>