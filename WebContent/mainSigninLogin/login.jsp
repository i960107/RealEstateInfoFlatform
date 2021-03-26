<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
$(function(){
	$('input').click(function(){
		if($(this).val()=='아이디'||$(this).val()=='비밀번호'){
		$(this).val("");
		$(this).focus();
		}
	})
})
</script>
<%@include file="../mainSigninLogin/top.jsp"%>

<%
session.invalidate();
if(id==null){
	id="아이디";
}
%>
<td colspan="6" class="contentTd">


<form name="loginForm" action="loginProc.jsp">

<table height="300px" width="30%"  style="margin:auto;background-color:#FFA500; text-align: center">
<tr>
<td><b>직방</b></td>
</tr>
<tr>
<td >간편하게 로그인하고 <br> 다양한 서비스를 이용하세요</td>
</tr>
<tr>
<td >아이디 <input type="text" name="id" value="<%=id%>"></td>
</tr>
<tr>
<td>비밀번호 <input type="password" name="password" value="비밀번호"></td>
</tr>
<tr>
<td><a href="findId.jsp">아이디 찾기</a>|
<a href="signIn_member.jsp">회원가입</a>
</td> 
</tr>
<tr>
<td> <input type="submit" value="시작하기" onClick="return loginSave()"></td>
</tr>
</table>

</form>
</td>
<%@include file="../mainSigninLogin/bottom.jsp"%>
 