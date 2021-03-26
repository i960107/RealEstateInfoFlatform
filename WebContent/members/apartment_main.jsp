<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mainSigninLogin/top.jsp"%>
<td colspan="6" width="100%" height="500px"><script
		type="text/javascript" src="../js/jquery.js"></script> <script
		type="text/javascript">
			function searchSave() {
				if ($('input[name="address"]').val() == "") {
					alert("주소를 입력해주세요");
					return;
				}
						$('#mydiv').load("apartment_search.jsp",{
							type:$('input[name="type"]').val(),
							address:$('input[name="address"]').val(),
							});
					
			}
			$(function(){
				
					$('#sel').css('color','#FFA500');
			})
			function typeAdd(num) {
				if (num == 1) {
					$('input[name="type"]').val('매매');
					$('#sel').css('color','#FFA500');
					$('#rent').css('color','black');
					$('#presel').css('color','black');

				} else if (num == 2) {
					$('input[name="type"]').val('전월세');
					$('#sel').css('color','black');
					$('#rent').css('color','#FFA500');
					$('#presel').css('color','black');
				} else {
					$('input[name="type"]').val('신축분양');
					$('#sel').css('color','black');
					$('#rent').css('color','black');
					$('#presel').css('color','#FFA500');
				}
			}
		</script> <input type="hidden" name="type" value="매매">
	<table width="100%" height="100%">
		<tr>
			<td colspan="2" height="30px"><a id="sel" href="javascript:typeAdd(1)">매매</a> <a
				href="javascript:typeAdd(2)" id="rent">전월세</a> <a href="javascript:typeAdd(3)" id="presel">신축분양</a>
			</td>
		</tr>
		<tr>
			<%
				String address = "지역명(oo구 혹은 oo시) 검색";
				if (request.getParameter("address") != null) {
					address = request.getParameter("address");
				}
			%>
			<td style="vertical-align: top"><input size=40 type="text" value="<%=address%>" id="address"
				name="address"><a href="javascript: searchSave()"><img
					src="<%=request.getContextPath()%>/img/search.png" width=20px /></a></td>
			<td width="70%" align="left" style="vertical-align: top">
				<div id="mydiv"></div>


			</td>
		</tr>
	</table></td>
<%@ include file="../mainSigninLogin/bottom.jsp"%>