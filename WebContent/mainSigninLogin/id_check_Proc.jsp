<%@page import="agency.AgencyDao"%>
<%@page import="members.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
MemberDao mdao=MemberDao.getInstance();
AgencyDao adao=AgencyDao.getInstance();
boolean idChecked_member=mdao.IdDuplicateCheck(id);
boolean idChecked_agency=adao.IdDuplicateCheck(id);
if(idChecked_member&&idChecked_agency){
	out.print("YES");
}else{
	out.print("NO");
}
%>
   