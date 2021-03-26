<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="top_agency.jsp"%>
    <%
String usertype=(String)session.getAttribute("usertype");
if(usertype!="agency") {%>
<script type="text/javascript">
	alert("중개사무소만 이용할 수 있는 페이지 입니다.\n중개사무소 아이디로 로그인해주세요");
	location.href="main_agency.jsp";
</script>
<% }%>
<script type="text/javascript">
function showFormByType(){
	$('#formArea').empty();
	if($('select').val()==1){
		$('#formArea').load('insertApartment.jsp');
		}else if($('select').val()==2){
		$('#formArea').load('insertHouse.jsp');
		}else if($('select').val()==3){
		$('#formArea').load('insertStudio.jsp');
		}
}
</script>
<td  colspan="6" width="100%" height="500px">
<table width="100%" height="100%" border=1>
<tr style="vertical-align: top">
<td width="25%">
매물등록<br>
어떤 매물을 등록하시겠습니까?
<select name="kind" onchange="showFormByType()">
<option value="선택">선택
<option value="1">아파트
<option value="2">빌라,투룸+
<option value="3">원룸
</select>
</td>
<td>
<div id="formArea">
</div>
</td>
</tr>
</table>

</td>
<%@include file="bottom_agency.jsp" %>

 