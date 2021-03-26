<%@page import="agency.HouseBean"%>
<%@page import="agency.ApartmentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("type");
	String address = request.getParameter("address");
	AgencyDao dao = AgencyDao.getInstance();
	ArrayList<HouseBean> houselist= dao.searchHouse(type, address);
%>


<table class="viewTable">
	<caption>빌라,투룸+</caption>
<tr width=100>
<%if(houselist.size()==0){
	%>
	<td><b>조건에 맞는 빌라,투룸+ 매물이 없습니다</b></td>
<%} else{%>
		<td>주소</td>
		<td>이미지</td>
		<td>가격</td>
		<td>입주날짜</td>
<%} %>
</tr>
<%for(HouseBean bean:houselist) {
	String no=String.valueOf(bean.getNo());
	Boolean isrecommended=dao.isRecommendedByCertifiedAgency("house",no);
	String[] image=bean.getImage().split(" ");	  
%>
<tr style = "cursor:pointer;" onClick = " location.href='viewDetails_house.jsp?no=<%=bean.getNo()%>' ">
<td>
	<%if(isrecommended) {%><img src='<%=request.getContextPath()%>/img/recommended.png' width=12px><%} %>
<%=bean.getAddress()%></td>
<td><img src="<%=request.getContextPath()%>/img/<%=image[0]%>"></td>
<td><%=bean.getPrice()%></td>
<td>	<%
if (String.valueOf(bean.getMoveinDate()).equals("1111-01-01")) {
							out.print("입주 날짜 협의 ");
						} else {
							out.print(bean.getMoveinDate());
						}
					%></td>
</tr>
<%} %>
</table>
  