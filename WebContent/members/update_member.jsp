<%@page import="members.MemberBean"%>
<%@page import="members.MemberDao"%>
<%@page import="agency.AgencyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="..//members/mypage_top.jsp"%>
<script src="../mainSigninLogin/script.js"></script>
<%
	MemberDao mdao = MemberDao.getInstance();

	MemberBean bean = mdao.getMemberById(id);
%>

	<form action="update_memberProc.jsp">
		<input type="hidden" name="id" value="<%=bean.getId()%>" > <input
			type="hidden" name="no" value="<%=bean.getNo()%>">
		<table border=1 height="300px">
			<tr>
				<td>아이디</td>
				<td><%=bean.getId()%></td>
			</tr>
			<tr>
				<td>비밀번호<br> <span>숫자,문자,특수문자 포함 8~10글자</span></td>
				<td><input type="text" oninput="pwCheck()" name="password">
					<span id="pwmsg"></span></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="text" oninput="rePwCheck()" name="rePassword" >
					<span id="rePwmsg"></span></td>
			</tr>
			<tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=bean.getName()%>"></td>
			</tr>
			<tr>
				<td>phone</td>
				<td><select name="phone1">
						<%
							String phone1[] = { "선택", "02", "053", "051", "010" };
							for (int i = 0; i < phone1.length; i++) {
						%>
						<option <%
						if(bean.getPhone1().equals(phone1[i])){
							out.print("selected");
						}
						%> value="<%=phone1[i]%>"><%=phone1[i]%></option>
						<%
							}
						%>
				</select>- <input type="text" name="phone2" value="<%=bean.getPhone2()%>">- <input type="text"
					name="phone3" value="<%=bean.getPhone3()%>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" value="<%=bean.getAddress()%>"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%=bean.getEmail()%>"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="수정하기"
					onclick="return updateSave()"> <input type="button"
					value="메인페이지로" onclick="location.href='../mainSigninLogin/main.jsp'"></td>
			</tr>
		</table>
	</form>
<%@include file="..//members/mypage_bottom.jsp"%>


  