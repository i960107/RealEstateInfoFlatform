<%@page import="java.util.Date"%>
<%@page import="agency.StudioBean"%>
<%@page import="agency.HouseBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="agency.ApartmentBean"%>
<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
String usertype=(String)session.getAttribute("usertype");
if(usertype!="agency") {%>
<script type="text/javascript">
	alert("중개사무소만 이용할 수 있는 페이지 입니다.\n중개사무소 아이디로 로그인해주세요");
	location.href="main_agency.jsp";
</script>
<% }%>
<%@include file="top_agency.jsp" %>
<td colspan="6">
<b>우리 중개사무소가 등록한 매물을 확인하세요<br>
이미지를 클릭하면 더 많은 정보를 볼 수 있습니다.</b>
<%
AgencyDao adao=AgencyDao.getInstance();
ArrayList<ApartmentBean> aptlist=adao.getApartmentByAgency((String)session.getAttribute("mid"));
%>

<table class="viewTable" border=0><caption><font size=10px color="black"><b>아파트</b></font></caption>

<%
if(aptlist.size()==0||aptlist.isEmpty()){
	out.print("<tr width=100><td>등록한 아파트 매물이 없습니다</td></tr>");
}else{
	
%>
<tr>
<td>아파트 이름</td>
<td>이미지</td>
<td>주소</td>
<td>가격</td>
<td>입주날짜</td>
</tr>
<%for(ApartmentBean bean:aptlist){%>
<tr style = "cursor:pointer;" onClick = " location.href='../members/viewDetails_apartment.jsp?no=<%=bean.getNo()%>' ">
<td><%=bean.getName()%></td>
<td>

<%
String image[]=bean.getImage().split(" ");
for(int i=0;i<1;i++){
%>
<img src="<%=request.getContextPath()+"/img/"+image[i]%>" width="100" height="100">
<%} %>
</td>
<td><%=bean.getAddress()%></td>
<td><%=bean.getPrice()%></td>
<td>	<%
						if (String.valueOf(bean.getMoveinDate()).equals("1111-01-01")) {
							out.print("입주 날짜 협의 ");
						} else {
							out.print(bean.getMoveinDate());
						}
					%></td>
</tr>
<tr>
<td align="right"colspan="5" >
<a href="updateApt.jsp?no=<%=bean.getNo()%>">수정하기</a>
<a href="deleteAptProc.jsp?no=<%=bean.getNo()%>">삭제하기</a>
</td>
</tr>
<%} 
}%>
</table>
<%
ArrayList<HouseBean> houselist=adao.getHouseByAgency((String)session.getAttribute("mid"));

%>

<table class="viewTable"><caption ><font size=10px color="black"><b>빌라,투룸+</b></font></caption>
  
<%
if(houselist.size()==0||houselist.isEmpty()){
	out.print("<tr width=100><td>등록한 빌라,투룸+ 매물이 없습니다</td></tr>");
}else{
	
%>
<tr>
<td>주소</td>
<td>이미지</td>
<td>가격</td>
<td>관리비</td>
<td>입주날짜</td>
</tr>
<%for(HouseBean bean:houselist){%>
<tr>
<td><%=bean.getAddress()%></td>
<td>
<a href="../members/viewDetails_house.jsp?no=<%=bean.getNo()%>">
<%

String image[]=bean.getImage().split(" ");
for(int i=0;i<1;i++){
%>
<img src="<%=request.getContextPath()+"/img/"+image[i]%>" width="100" height="100">
<%} %>
</a>
</td>
<td><%=bean.getPrice()%></td>
<td><%=bean.getFee()%></td>
<td>
<%
if(bean.getMoveinDate()==null){
	out.print("입주날짜 협의");
}else{
	out.print(bean.getMoveinDate());
}
%>
</td>
</tr>
<tr>
<td  align="right" colspan="5">
<a href="updateHouse.jsp?no=<%=bean.getNo()%>">수정하기</a>
<a href="deleteHouseProc.jsp?no=<%=bean.getNo()%>">삭제하기</a>
</td>
</tr>
<%} 
}%>
</table>	


<table class="viewTable"><caption><font size=10px color="black"><b>원룸</b></font></caption>

<%
ArrayList<StudioBean> studiolist=adao.getStudioByAgency((String)session.getAttribute("mid"));
if(studiolist.size()==0||studiolist.isEmpty()){
	out.print("<tr width=100><td>등록한 원룸 매물이 없습니다</td></tr>");
}else{
	
%>
<tr>
<td>주소</td>
<td>이미지</td>
<td>가격</td>
<td>관리비</td>
<td>입주날짜</td>
</tr>
<%for(StudioBean bean:studiolist){%>
<tr>
<td><%=bean.getAddress()%></td>
<td>
<a href="../members/viewDetails_studio.jsp?no=<%=bean.getNo()%>">
<%
String image[]=bean.getImage().split(" ");
for(int i=0;i<1;i++){
%>
<img src="<%=request.getContextPath()+"/img/"+image[i]%>" width="100" height="100">
<%} %>
</a>
</td>
<td><%=bean.getPrice()%></td>
<td><%=bean.getFee()%></td>
<td><%=bean.getMoveinDate()%></td>
</tr>
<tr>
<td   align="right"colspan="5">
<a href="updateStudio.jsp?no=<%=bean.getNo()%>">수정하기</a>
<a href="deleteStudioProc.jsp?no=<%=bean.getNo()%>">삭제하기</a>
</td>
</tr>
<%} 
}%>
</table>
 
<%@include file="bottom_agency.jsp" %>
  
 