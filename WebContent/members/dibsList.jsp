<%@page import="agency.StudioBean"%>
<%@page import="agency.HouseBean"%>
<%@page import="agency.ApartmentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="members.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="..//members/mypage_top.jsp"%>
<%
MemberDao dao=MemberDao.getInstance();
ArrayList<ApartmentBean> aptlist =dao.getApartmentDibs(id);
ArrayList<HouseBean> houselist=dao.getHouseDibs(id);
ArrayList<StudioBean> studiolist=dao.getStudioDibs(id);
%>
<table class="viewTable" width="600">
	<tr>
		<td>매물종류</td>
		<td>주소</td>
		<td>이미지</td>
		<td>가격</td>
	</tr>
	<%
	if(aptlist.size()==0&&houselist.size()==0&&studiolist.size()==0){
		out.print("<tr><td colspan=4>찜한 매물이 없습니다</td></tr>");
	}
	if(aptlist.size()==0){

	}else{
	for(ApartmentBean bean:aptlist){ 
	String imageArr[]=bean.getImage().split(" ");
	String image=request.getContextPath()+"/img/"+imageArr[0];
	%>
		<tr style = "cursor:pointer;" onClick = "location.href='../members/viewDetails_apartment.jsp?no=<%=bean.getNo()%>'">
		<td>아파트</td>
		<td><%=bean.getAddress() %></td>
		<td><img src="<%=image%>"></td>
		<td><%=bean.getPrice() %></td>
		</tr>
	<%} }%>
	<%
	if(houselist.size()==0){
	
	}else{
	for(HouseBean bean:houselist){ 
	String imageArr[]=bean.getImage().split(" ");
	String image=request.getContextPath()+"/img/"+imageArr[0];
	%>
		<tr style = "cursor:pointer;" onClick = "location.href='../members/viewDetails_house.jsp?no=<%=bean.getNo()%>'">
		<td>빌라,투룸+</td>
		<td><%=bean.getAddress() %></td>
		<td><img src="<%=image%>"></td>
		<td><%=bean.getPrice() %></td>
		</tr>
	<%} }%>
	<%
	if(studiolist.size()==0){
	
	}else{
	for(StudioBean bean:studiolist){ 
	String imageArr[]=bean.getImage().split(" ");
	String image=request.getContextPath()+"/img/"+imageArr[0];
	%>
		<tr style = "cursor:pointer;" onClick = "location.href='../members/viewDetails_studio.jsp?no=<%=bean.getNo()%>'">
		<td>원룸</td>
		<td><%=bean.getAddress() %></td>
		<td><img src="<%=image%>"></td>
		<td><%=bean.getPrice() %></td>
		</tr>
	<%}} %>
</table>
<%@include file="..//members/mypage_bottom.jsp"%>

 