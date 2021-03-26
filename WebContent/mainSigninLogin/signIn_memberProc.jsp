<%@page import="members.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mbean" class="members.MemberBean" ></jsp:useBean>
<jsp:setProperty property="*" name="mbean"/>
<%
MemberDao dao=MemberDao.getInstance();
int count=dao.insertMember(mbean);
if(count>0){%>
<script type="text/javascript">
var confirmval=confirm("가입성공!로그인하시겠습니까?");
if(confirmval==true){	
location.href="login.jsp";
}
</script>
<%
}else {%>
<script type="text/javascript">
	alert("가입 실패");
	location.href="signIn_member.jsp";
</script>
<%
}
%>


 