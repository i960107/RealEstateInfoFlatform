<%@page import="members.MemberDao"%>
<%@page import="agency.AgencyBean"%>
<%@page import="agency.HouseBean"%>
<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../mainSigninLogin/top.jsp"%>
<script type="text/javascript">
	function addDibs(dibs) {
		myform.submit();
	}
</script>
<td colspan=6>
<%
	AgencyDao dao = AgencyDao.getInstance();
	String no = request.getParameter("no");
	HouseBean bean = dao.getHouseByNo(no);
	String kind = "house";
	String mid = (String) session.getAttribute("mid");
	MemberDao mdao = MemberDao.getInstance();
	boolean dibs = mdao.getDibs(mid, kind, no);
	Boolean isrecommended=dao.isRecommendedByCertifiedAgency(kind,no);
	System.out.println("viewhouse"+no+isrecommended);
%>
<form name="myform" action="dibsProc.jsp">
	<table class="viewTable">
		<tr>
	<td>
<img src="<%=request.getContextPath()%>/img/goback.png" onclick="history.go(-1)" width="30px">
</td>
<td colspan=3>
			<b>빌라, 투룸+(매물번호 :<%=bean.getNo()%>) </b>
			<%if(isrecommended) {%><img src='<%=request.getContextPath()%>/img/recommended.png' width=12px>"<%} %>
	<input type="hidden" name="kind" value="house">
				<input type="hidden" name="no" value="<%=bean.getNo()%>"> <input
				type="hidden" name="dibs" value="<%=dibs%>"><a
					href="javascript:addDibs()"><font size ="12px"color="red">   찜하기</font></a><span
						style="display:<%if (dibs == false) {
				out.print("none");
			} else {
				out.print("inline");
			}%>" > <font color="red" size=12>♥</font></span><br>
			<%=bean.getType()+" "%><%=bean.getPrice() %>
			</td>
		</tr>
		<tr>
			<td colspan="4"><%
String image[]=bean.getImage().split(" ");
for(int i=0;i<image.length;i++){
%>
<img src="<%=request.getContextPath()+"/img/"+image[i]%>" width="200" height="200">
<%} %>
			</td>
		</tr>
		<tr>
			<td>전용면적</td>
			<td><%=bean.getArea()%></td>
			<td>입주가능일</td>
			<td>	<%
			if (String.valueOf(bean.getMoveinDate()).equals("1111-01-01")) {
							out.print("입주 날짜 협의 ");
						} else {
							out.print(bean.getMoveinDate());
						}
					%></td>
		</tr>
		<tr>
			<td>층수</td>
			<td><%=bean.getFloor()%> / 총 <%=bean.getTotalfloor()%><br>
				<%
					if (bean.isElevator()) {
						out.print("엘리베이터 있음");
					} else {
						out.print("엘리베이터 없음");
					}
				%></td>
			<td>총주차대수</td>
			<td>
				<%
					int parking = bean.getParking();
					if (parking == 0) {
						out.print("주차 불가");
					} else {
						out.print(parking);
					}
				%>
			</td>
		</tr>
		<tr>
			<td>준공날짜</td>
			<td><%=bean.getConstructiondate()%></td>
			<td>구조</td>
			<td><%=bean.getLayout()%></td>
		</tr>
		<tr>
			<td>매물 설명</td>
			<td colspan=3><%=bean.getContent()%></td>
		</tr>
<% 
String usertype=(String)session.getAttribute("usertype");
if(usertype.equals("member")){ %>
<tr>
<td colspan=4 bgcolor="yellow" height="50px">
<a href="question.jsp?kind=house&no=<%=bean.getNo()%>&agency_id=<%=bean.getAgency()%>">
문의글 남기기
</a>
</td>
</tr>
<%} %>
	<%@ include file="view_agencyInfo.jsp" %>


	</table>
	</form>
	</td>
	 <%@include file="../mainSigninLogin/bottom.jsp"%>