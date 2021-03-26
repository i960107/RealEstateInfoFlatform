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
int count=dao.updateMember(mbean);
if(count>0){%>
<script type="text/javascript">
alert("수정 성공");
location.href="update_member.jsp";

</script>
<%
}else {%>
<script type="text/javascript">
	alert("수정 실패");
	history.go(-1);
</script>
<%
}
%>
  