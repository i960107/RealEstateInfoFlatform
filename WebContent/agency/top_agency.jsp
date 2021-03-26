<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>좋은 집 구하는 기술, 직방</title>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style.css" >
<script type="text/javascript" src="../js/jquery.js"></script>
<table id="toptable" >
	<tr class="menu">
		<td class="col-lg-1"> <a href="main_agency.jsp"><img src="<%=request.getContextPath()%>/img/agencylogo.jpg" height="100px"/>
		</a></td>
		<td class="col-lg-2"><a href="insertRealEstate.jsp">매물 등록<br>
		</a></td>
		<td class="col-lg-2"><a href="realEstateList.jsp">매물 보기/수정 </a></td>
		<td class="col-lg-2"><a href="realEstateQuestion.jsp">매물 상담요청 </a></td>
		<td class="col-lg-4" align="right">
			<%
				String id = (String) session.getAttribute("mid");
			String usertype_top=(String) session.getAttribute("usertype");	
				System.out.print(id);
				if (id != null) {
			%><sub><%=usertype_top%></sub><a href="../agency/updateAgency.jsp"><span><%=id%></span></a> <a href="../mainSigninLogin/logoutProc.jsp"> <img
				src="<%=request.getContextPath()%>/img/logout.png"  width="20px">
		</a> <%
 	} else {
 %> <a href="../mainSigninLogin/login_agency.jsp">중개사무소 로그인 및 가입 </a> <%
 	}
 %>
		</td>
		<td align="center"class="col-lg-1"><a
			href="<%=request.getContextPath()%>/mainSigninLogin/main.jsp">직방<br>
				일반사용자용 </a></td>
	</tr>
	<tr>
	
	 