<%@page import="agency.ApartmentBean"%>
<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String no=request.getParameter("no");
AgencyDao dao=AgencyDao.getInstance();
ApartmentBean bean=dao.getApartmentByNo(no);
%>
<script type="text/javascript" src="<%=request.getContextPath()%>/mainSigninLogin/script.js">

</script>
<script type="text/javascript">
function writeSave(){
	if($('option:selected').val()=="선택"){
		alert("타입을 선택하세요");
		return false;
	}
	if($('input[name="name"]').val()==""){
		alert("아파트 이름을 입력하세요");
		$('input[name="name"]').focus();
		return false ;
	}
	if($('input[name="price"]').val()==""){
		alert("가격을 입력하세요");
		$('input[name="price"]').focus();
		return false ;
	}
}
</script>
<form enctype="multipart/form-data" method="post" action="updateAptProc.jsp">
<input type="hidden" name="no" value="<%=no%>">
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
아파트이름
</td>
<td>
<input type="text" name="name" value="<%=bean.getName()%>">
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
입주날짜
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
<td>총 세대 수</td>
<td><input type="number" name="unit" value="<%=bean.getUnit()%>"></td>
</tr>
<tr>
<td>총 동수</td>
<td><input type="number" name="building" value="<%=bean.getBuilding()%>"></td>
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
시행사
</td>
<td>
<input type="text" name="developer" value="<%=bean.getDeveloper()%>">
</td>
</tr>
<tr>
<td>
시공사
</td>
<td>
<input type="text" name="constructor" value="<%=bean.getConstructor()%>">
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
난방(방식/연료)
</td>
<td>
<input type="text" name="heatingsystem" value="<%=bean.getHeatingsystem()%>">
</td>
</tr>
<tr>
<td>
편의시설
</td>
<td>
<input type="text" name="facilities" value="<%=bean.getFacilities()%>">
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
<td colspan=2 align="center"><input type="submit" value="매물 수정	하기" onclick="return realEstateWriteSave()"></td>
</tr>
</table>
</form>
  
 