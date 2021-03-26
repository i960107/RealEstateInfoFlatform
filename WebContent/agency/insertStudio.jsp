
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form enctype="multipart/form-data" method="post" action="insertStudioProc.jsp">
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
<table border=1 >
<tr>
<td>타입</td>
<td>
<select name="type">
<option value="선택">선택
<option value="매매">매매
<option value="전월세">전월세
<option value="신축분양">신축분양
</select>
</td>
</tr>
<tr>
<td>
가격
</td>
<td>
<input type="text" name="price">
</td>
</tr>
<tr>
<td>
관리비
</td>
<td>
<input type="text" name="fee">
</td>
</tr>
<tr>
<td>
준공날짜
</td>
<td>
<input type="date" name="constructiondate">
</td>
</tr>
<tr>
<td>
입주날짜<br>
선택하지 않을시 입주 날짜 협의
</td>
<td>
<input type="date" name="moveindate">
</td>
</tr>
<tr>
<td>
사진
</td>
<td>
<input type="file" name="image1" ><br>
<input type="file" name="image2" ><br>
<input type="file" name="image3" ><br>
<input type="file" name="image4" ><br>
</td>
</tr>
<tr>
<td>
면적(단위:m<sup>2</sup>)
</td>
<td>
<input type="number" name="area">
</td>
</tr>
<tr>
<td>
층
</td>
<td>
<input type="number" name="floor">
</td>
</tr>
<tr>
<td>
총 층수
</td>
<td>
<input type="number" name="totalfloor">
</td>
</tr>
<tr>
<td>
구조
</td>
<td>
<input type="text" name="layout">
</td>
</tr>
<tr>
<td>옵션</td>
<td>
<%
String options[]={"airconditioner","refrigerator","gasstove","couch","washer","induction","microwave","bed","closet","shoecloset"};
for(int i=0;i<options.length;i++){
%>
<input type="checkbox" name="options" value="<%=options[i] %>"><%=options[i] %>
<%
}
%>
</td>
</tr>
<tr>
<td>
주차(단위:대)
</td>
<td>
<input type="number" name="parking">
</td>
</tr>
<tr>
<td>
엘리베이터
</td>
<td>
<select name="elevator" >
<option value="false">없음
<option value="true">있음
</select>
</td>
</tr>
<tr>
<td>
상세 설명
</td>
<td>
<textarea name="content" rows="5" cols="30"></textarea>
</td>
</tr>
<tr>
<td>
추천
</td>
<td>
<input type="radio" name="recommended" value="true">추천
<input type="radio" name="recommended" value="false" checked>추천 안함
</td>
</tr>
<tr>
<tr>
<td colspan=2 align="center"><input type="submit" value="매물 등록하기" onclick="return realEstateWriteSave()"></td>
</tr>
</table>
</form>
