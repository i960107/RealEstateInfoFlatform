<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/mainSigninLogin/script.js"></script>
<script type="text/javascript">
$(function(){
	$('input').click(function(){
		$(this).val("");
		$(this).focus();
		})
		
	});

</script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css" >
<head>
<title>좋은 집 구하는 기술, 직방</title>
</head>

<table id="toptable">
	<tr class="menu">
		<td class="col-lg-1 "><a href="../mainSigninLogin/main.jsp"><img src="<%=request.getContextPath()%>/img/logo.jpg" width=100px></a></td>
		<td class="col-lg-2 "><a href="../members/apartment_main.jsp">아파트<br>매매/전월세/신축분양
		</a></td>
		<td class="col-lg-2 "><a href="../members/house_main.jsp">빌라,투룸+<br>매매/전월세/신축분양
		</a></td>
		<td class="col-lg-2 "><a href="../members/studio_main.jsp">원룸<br>전월세
		</a></td>
		<td class="col-lg-4 " align="right">
			<%
				String id = (String) session.getAttribute("mid");
				String usertype_top=(String) session.getAttribute("usertype");	
			System.out.print(id);
				if (id != null) {
			%> <input type="hidden" name="usertype"
			value="<%=usertype_top%>"> 
			<sub><%=usertype_top%></sub>
			<a
			href="<%=request.getContextPath()%>
	/members/update_member.jsp" ><span id="id"><%=id%></span></a> <a
			href="../mainSigninLogin/logoutProc.jsp"> <img
				src="<%=request.getContextPath()%>/img/logout.png" width="20px">
		</a> <%
 	} else {
 %> <a href="../mainSigninLogin/login.jsp">로그인 및 회원가입</a> <%
 	}
 %>
		</td>

		<td class="col-lg-1 " align="center"><a href="../mainSigninLogin/login_agency.jsp"><font color="blue">중개사무소 로그인<br> 및
				가입 </font></a></td>
	</tr>
	<tr>