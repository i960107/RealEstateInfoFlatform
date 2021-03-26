<%@page import="agency.HouseBean"%>
<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form enctype="multipart/form-data" method="post" action="updateHouseProc.jsp">
<script type="text/javascript" src="<%=request.getContextPath()%>/mainSigninLogin/script.js">

</script>
<script type="text/javascript">
function writeSave(){
	if($('option:selected').val()=="선택"){
		alert("타입을 선택하세요");
		return false;
	}
	if($('input[name="price"]').val()==""){
		alert("가격을 입력하세요");
		$('input[name="price"]').focus();
		return false ;
	}
}
</script>
<%
AgencyDao dao=AgencyDao.getInstance();
String no=request.getParameter("no");
HouseBean bean=dao.getHouseByNo(no);
%>
<input type="hidden" name="no" value="<%=bean.getNo()%>">
<table border=1 >
<tr>
<td>타입</td>
<td>
<select name="type">
<%String[]type={"선택","매매","전월세","신축분양"};
for(int i=0;i<type.length;i++){%>
<option value="<%=type[i] %>"  <%
if(type[i].equals(bean.getType()))
out.print("selected");
%>><%=type[i] %>
<%
} %>
</select>
</td>
</tr>
<tr>
<td>
가격
</td>
<td>
<input type="text" name="price" value="<%=bean.getPrice()%>">
</td>
</tr>
<tr>
<td>
관리비
</td>
<td>
<input type="text" name="fee" value="<%=bean.getFee()%>">
</td>
</tr>
<tr>
<td>
준공날짜
</td>
<td>
<input type="date" name="constructiondate" value="<%=bean.getConstructiondate()%>">
</td>
</tr>
<tr>
<td>
입주날짜<br>
선택하지 않을시 입주 날짜 협의
</td>
<td>
<input type="date" name="moveindate" value="<%=bean.getMoveinDate()%>">
</td>
</tr>
<tr>
<td>
사진
</td>
<td>
<%
String image[]=bean.getImage().split(" ");
for(int i=0;i<image.length;i++){
%>
<figure>
<img src="<%=request.getContextPath()%>/img/<%=image[i]%>"/>
<figcaption>이미지<%=i+1%>번째<br><%=image[i] %></figcaption></figure>
<input type="hidden" name="image<%=i%>"  value=<%=image[i] %>>
<%}%>
<input type="file" name="image1"><br>
<input type="file" name="image2"><br>
<input type="file" name="image3"><br>
<input type="file" name="image4"><br>
</td>
</tr>
<tr>
<td>
면적(단위:m<sup>2</sup>)
</td>
<td>
<input type="number" name="area" value="<%=bean.getArea()%>">
</td>
</tr>
<tr>
<td>
층
</td>
<td>
<input type="number" name="floor" value="<%=bean.getFloor()%>">
</td>
</tr>
<tr>
<td>
총 층수
</td>
<td>
<input type="number" name="totalfloor" value="<%=bean.getTotalfloor()%>">
</td>
</tr>
<tr>
<td>
구조
</td>
<td>
<input type="text" name="layout" value="<%=bean.getLayout()%>">
</td>
</tr>
<tr>
<td>
주차(단위:대)
</td>
<td>
<input type="number" name="parking" value="<%=bean.getParking()%>">
</td>
</tr>
<tr>
<td>
엘리베이터
</td>
<td>
<select name="elevator">
<option value="false" <%
if(bean.isElevator()==false)out.print("selected");
%>>없음
<option value="true"><%
if(bean.isElevator()==true)out.print("selected");
%>>있음 
</select>
</td>
</tr>
<tr>
<td>
주소
</td>
<td>
<input type="text" name="address" value="<%=bean.getAddress()%>">
</td>
</tr>
<tr>
<td>
상세 설명
</td>
<td>
<textarea name="content" rows="5" cols="30"><%=bean.getContent() %></textarea>
</td>
</tr>
<tr>
<td>
추천
</td>
<td>
<input type="radio" name="recommended" value="1" <%
if(bean.isRecommended()==true)out.print("checked");
%>>추천
<input type="radio" name="recommended" value="0" <%
if(bean.isRecommended()==false)out.print("checked");
%>>추천 안함
</td>
</tr>
<tr>
<tr>
<td colspan=2 align="center"><input type="submit" value="매물 수정하기" onclick="return realEstateWriteSave()"></td>
</tr>
</table>
</form>
