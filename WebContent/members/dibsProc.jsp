<%@page import="members.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String usertype=(String)session.getAttribute("usertype");
String id=(String)session.getAttribute("mid");
System.out.println("dibsProc.jsp:"+id+usertype);
if(usertype!="member"||id==null){%>
<script type="text/javscript" src="../js.jquery.js"></script>
<script type="text/javascript">
	alert("일반 사용자로 로그인해주세요");
	history.go(-1);
</script>
<% }else{

String kind=request.getParameter("kind");
String no=request.getParameter("no");
Boolean dibs=Boolean.parseBoolean(request.getParameter("dibs"));
 MemberDao mdao=MemberDao.getInstance();
 int cnt;
 String url=request.getContextPath()+"/members/viewDetails_"+kind+".jsp?no="+no;
String msg;
 if(dibs==false){
cnt=mdao.insertDibs(id,kind,no);
msg="찜 등록 성공";
 }else{
	cnt=mdao.deleteDibs(id,kind,no);
msg="찜 삭제성공";
}
if(cnt>0){%>
<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>"; 
</script>
<%
}}
  %>
  
   
	
