 <%@page import="members.MemberDao"%>
<%@page import="agency.AgencyBean"%>
<%@page import="agency.ApartmentBean"%>
<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../mainSigninLogin/top.jsp"%>
<script type="text/javascript">
	function addDibs(dibs) {
		myform.submit();
	}

</script>
<%
AgencyDao dao=AgencyDao.getInstance();
String no=request.getParameter("no");
	ApartmentBean bean=dao.getApartmentByNo(no);
String kind="apartment";
String mid=(String)session.getAttribute("mid");
MemberDao mdao=MemberDao.getInstance();
boolean dibs=mdao.getDibs(mid,kind,no);

%>

<td colspan="6">
<form name="myform" action="dibsProc.jsp">
<table class="viewTable">
<tr>
<td>
<img src="<%=request.getContextPath()%>/img/goback.png" onclick="history.go(-1)" width="30px">
</td>
<td colspan="3">
<input type="hidden" name="kind" value="apartment">
<input type="hidden" name="no" value="<%=bean.getNo()%>">
<input type="hidden" name="dibs" value="<%=dibs%>">

<b>아파트(매물번호 : <%=bean.getNo() %>)</b><a
					href="javascript:addDibs()"><font size ="12px"color="red">   찜하기</font></a><span
						style="display:<%if (dibs == false) {
				out.print("none");
			} else {
				out.print("inline");
			}%>" > <font color="red" size=12>♥</font></span><br>

<%=bean.getName() %><br>
<%=bean.getType()+" "%><%=bean.getPrice() %>
</td>
</tr>
<tr>
<td colspan="4">
<% 
String image[]=bean.getImage().split(" ");
for(int i=0;i<image.length;i++){
%>
<img src="<%=request.getContextPath()+"/img/"+image[i]%>" width="200" height="200">
<%} %>

</td>
</tr>
<tr>
<td>전용면적</td>
<td><%=bean.getArea() %></td>
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
<td>세대 수</td>
<td><%=bean.getUnit()%></td>
<td>동 수</td>
<td><%=bean.getBuilding() %></td>
</tr>
<tr>
<td>총주차대수</td>
<td>
<%
int parking=bean.getParking();
if(parking==0){out.print("주차 불가");
}else{
	out.print(parking); 
} %>
</td>

<td>난방(방식/연료)</td>
<td><%=bean.getHeatingsystem() %></td>
</tr>
<tr>
<td>시행사</td>
<td><%=bean.getDeveloper() %></td>
<td>시공사</td>
<td><%=bean.getConstructor() %></td>
</tr>
<tr>
</tr>
<% 
String usertype=(String)session.getAttribute("usertype");
if(usertype.equals("member")){ %>
<tr>
<td colspan=4 bgcolor="yellow" height="50px">
<a href="question.jsp?kind=apartment&no=<%=bean.getNo()%>&agency_id=<%=bean.getAgency()%>">
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
 
