<%@page import="agency.AgencyBean"%>
<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../agency/top_agency.jsp"%>
<td colspan=6>
중개사무소 정보 수정하기<br>
<script src="../js/jquery.js"></script>
<script src="../mainSigninLogin/script.js"></script>
<form action="update_agencyProc.jsp">
<table border=1>
<%
AgencyDao adao=AgencyDao.getInstance();

AgencyBean bean=adao.getAgencyById(id);
%>
<tr>
<td>아이디</td>
<td><%=bean.getId() %><input type="hidden" name="id" value="<%=bean.getId()%>">
</td>
</tr>
<tr>
<td>비밀번호<br><span>숫자,문자,특수문자 포함 8~10글자</span></td>
<td><input type="text" oninput="pwCheck()"name="password">
<span id="pwmsg" ></span>
</td>
</tr>
<tr>
<td>비밀번호 확인</td>
<td><input type="text"  oninput="rePwCheck()" name="rePassword">
<span id="rePwmsg" ></span>
</td>
</tr>
<tr>
<td>중개사무소 이름</td>
<td><input type="text" value="<%=bean.getAgency_name()%>"name="agency_name"></td>
</tr>
<tr>
<tr>
<td>대표 중개사 이름</td>
<td><input type="text" value="<%=bean.getAgent_name()%>"name="agent_name"></td>
</tr>
<tr>
<td>phone</td>
<td>
<select name="phone1">	
<%String phone1[]={"선택","02","053","051","010"}; 
for(int i=0;i<phone1.length;i++){
%>
<option value="<%=phone1[i]%>" <%
if(bean.getPhone1().equals(phone1[i])){out.print("selected");}
%>><%=phone1[i]%></option>
<%
}
%>
</select>-
<input type="text" name="phone2" value="<%=bean.getPhone2()%>">-
<input type="text" name="phone3" value="<%=bean.getPhone3()%>">
</td>
</tr>
<tr>
<td>주소</td>
<td><input type="text" name="address" value="<%=bean.getAddress()%>"></td>
</tr>
<tr>
<td>인증<br>
<font color=red>
인증한 공인중개사가 추천하는 매물은<br>
가장 먼저 보여드려요
</font>
</td>
<td>
<input type="radio" name="certified" value="true"<%
if(bean.getCertified()){out.print("checked");}
%>>인증
<input type="radio" name="certified" value="false"<%
if(!bean.getCertified()){out.print("checked");}
%>>인증안함
</td>
</tr>
<tr> 
<td align="center" colspan=2>
<input type="submit" value="수정하기" onclick="return writeSave()">
<input type="button" value="메인페이지로" onclick="location.href='main.jsp'">
</td>
</tr>
</table>

</form>

</td>

<%@include file="../agency/bottom_agency.jsp"%>