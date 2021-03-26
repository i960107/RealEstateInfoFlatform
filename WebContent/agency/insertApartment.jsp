
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript" src="../mainSigninLogin/script.js"></script>
<form enctype="multipart/form-data" method="post" action="insertApartmentProc.jsp">
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
아파트이름
</td>
<td>
<input type="text" name="name">
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
<td>총 세대 수</td>
<td><input type="number" name="unit"></td>
</tr>
<tr>
<td>총 동수</td>
<td><input type="number" name="building"></td>
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
시행사
</td>
<td>
<input type="text" name="developer">
</td>
</tr>
<tr>
<td>
시공사
</td>
<td>
<input type="text" name="constructor">
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
난방(방식/연료)
</td>
<td>
<input type="text" name="heatingsystem">
</td>
</tr>
<tr>
<td>
편의시설
</td>
<td>
<input type="text" name="facilities">
</td>
</tr>
<tr>
<td>
주소
</td>
<td>
<input type="text" name="address">
</td>
</tr>
<tr>
<td colspan=2 align="center"><input type="submit" value="매물 등록하기" onclick="return realEstateWriteSave()"></td>
</tr>
</table>
</form>
