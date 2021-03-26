<%@page import="agency.StudioBean"%>
<%@page import="agency.HouseBean"%>
<%@page import="agency.ApartmentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="agency.AgencyBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">

</style>
<tr>
	<td>중개사</td>
	<td colspan="3">
		<%
			String agencyId = bean.getAgency();
			AgencyBean agency = dao.getAgencyById(agencyId);
			int countApt = dao.getApartmentByAgency(agencyId).size();
			int countHouse = dao.getHouseByAgency(agencyId).size();
			int countStudio = dao.getStudioByAgency(agencyId).size();
		%> <%=agency.getAgency_name()%><br>
		대표 <%=agency.getAgent_name()%><br> 전화 <%=agency.getPhone1()%>-
		<%=agency.getPhone1()%>- <%=agency.getPhone1()%><br> 주소 <%=agency.getAddress()%><br>
		아파트 | <%=" " + countApt%> 빌라,투룸 | <%=" " + countHouse%> 원룸 | <%=" " + countStudio%>
	</td>
</tr>
<tr bgcolor="#FDCD8C" height="50px">
	<td colspan=4><b>중개사무소의 다른 집</b></td>
</tr>
<tr>
	<%
		int endList = 4;
		if (kind.equals("apartment")) {
			ArrayList<ApartmentBean> aptlist = dao.getApartmentByAgencyType(agencyId, bean.getAddress());
			if (aptlist.size() == 0) {
				out.print("<td colspan=4>등록된 매물이 없습니다</td>");
			} else {
				if (endList > aptlist.size())
					endList = aptlist.size();
				for (int i = 0; i < endList; i++) {
				out.print("<td>");
					String url[] = aptlist.get(i).getImage().split(" ");
	%>
	<a href="viewDetails_apartment.jsp?no=<%=aptlist.get(i).getNo()%>"><img
		src='<%=request.getContextPath()%>/img/<%=url[0]%>' width=200
		height=200></a>
	<br>
	<%=aptlist.get(i).getType()%><%=aptlist.get(i).getPrice()%><br>
	<%=aptlist.get(i).getAddress()%>

	<%
				out.print("</td>");
		}
			}
		} else if (kind.equals("house")) {
			ArrayList<HouseBean> houselist = dao.getHousetByAgencyType(agencyId, bean.getAddress());
			if (endList > houselist.size())
				endList = houselist.size();
			if (houselist.size() == 0) {
				out.print("<td colspan=4>등록된 매물이 없습니다</td>");
			} else {
				for (int i = 0; i < endList; i++) {
				out.print("<td>");
					String url[] = houselist.get(i).getImage().split(" ");
	%>
	<a href="viewDetails_house.jsp?no=<%=houselist.get(i).getNo()%>"><img
		src='<%=request.getContextPath()%>/img/<%=url[0]%>' width=200
		height=200></a>
	<br>
	<%=houselist.get(i).getType()%><%=houselist.get(i).getPrice()%><br>
	<%=houselist.get(i).getAddress()%>
	</td>
	<%
		}
			}
		} else {
			ArrayList<StudioBean> studiolist = dao.getStudioByAgencyType(agencyId, bean.getAddress());
			if (endList > studiolist.size())
				endList = studiolist.size();
			if (studiolist.size() == 0) {
				out.print("<td colspan=4>등록된 매물이 없습니다</td>");
			} else {
				for (int i = 0; i < endList; i++) {
				out.print("<td>");
					String url[] = studiolist.get(i).getImage().split(" ");
	%>

	<a href="viewDetails_studio.jsp?no=<%=studiolist.get(i).getNo()%>"><img
		src='<%=request.getContextPath()%>/img/<%=url[0]%>' width=200
		height=200></a>
	<br>
	<%=studiolist.get(i).getType()%><%=studiolist.get(i).getPrice()%><br>
	<%=studiolist.get(i).getAddress()%>
	</td>
	<%
		}
			}
		}
	%>
</tr>
</td>
</tr>

