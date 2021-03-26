<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/mainSigninLogin/script.js"></script>
<%@include file="../mainSigninLogin/top.jsp"%>
<td colspan=6>
	<form action="signIn_agencyProc.jsp">

		<table class="contentTd">

			<tr>
				<td>아이디<br>
				<span>숫자,알파벳만 가능</span></td>
				<td><input type="text" name="id" oninput="idInput()"> <input
					type="button" onclick="idDuplicateCheck()" value="중복 확인"> <span
					id="idmsg" style="display: none"></span></td>
			</tr>
			<tr>
				<td>비밀번호<br>
				<span>숫자,문자,특수문자 포함 8~10글자</span></td>
				<td><input type="text" oninput="pwCheck()" name="password">
					<span id="pwmsg"></span></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="text" oninput="rePwCheck()" name="rePassword">
					<span id="rePwmsg"></span></td>
			</tr>
			<tr>
				<td>중개사무소 이름</td>
				<td><input type="text" name="agency_name"></td>
			</tr>
			<tr>
			<tr>
				<td>대표 중개사 이름</td>
				<td><input type="text" name="agent_name"></td>
			</tr>
			<tr>
				<td>phone</td>
				<td><select name="phone1">
						<%
							String phone1[] = { "선택", "02", "053", "051", "010" };
							for (int i = 0; i < phone1.length; i++) {
						%>
						<option value="<%=phone1[i]%>"><%=phone1[i]%></option>
						<%
							}
						%>
				</select>- <input type="text" name="phone2">- <input type="text"
					name="phone3"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>인증<br> <font color=red> 인증한 공인중개사가 추천하는 매물은<br>
						가장 먼저 보여드려요
				</font>
				</td>
				<td><input type="radio" name="certified" value="true">인증
					<input type="radio" name="certified" value="false" checked>인증안함</td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="가입하기"
					onclick="return signinSave()"> <input type="button"
					value="메인페이지로" onclick="location.href='main.jsp'"></td>
			</tr>
		</table>

	</form> <%@include file="../mainSigninLogin/bottom.jsp"%>