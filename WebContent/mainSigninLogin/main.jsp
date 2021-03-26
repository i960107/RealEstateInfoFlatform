<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../mainSigninLogin/top.jsp"%>

<script type="text/javascript">

function kindSel(category){
	if(category==1){
	$('form').attr('action','../members/apartment_main.jsp');	
	$('#apt').css('color','#FFA500');
	$('#house').css('color','black');
	$('#studio').css('color','black');
	}else if(category==2){
	$('form').attr('action','../members/house_main.jsp');	
	$('#apt').css('color','black');
	$('#house').css('color','#FFA500');
	$('#studio').css('color','black');
	}else if(category==2){
	}else{		
	$('form').attr('action','../members/studio_main.jsp');	
	$('#apt').css('color','black');
	$('#house').css('color','black');
	$('#studio').css('color','#FFA500');
	}
}
function searchSave(){
	if($('input[name="address"]').val()==""){
			alert("주소를 입력해주세요");
			return false ;
		}  
	}
</script>

<td class="contentTd" colspan="6" style="background-image:url(../img/main.gif);background-repeat: no-repeat;background-position: center;"  >
<form>
<input type="hidden" name="type" value="매매">
		<table id="mainTable">
			<tr>
				<td colspan="3" height=30>
					<h1>
						<b>어떤 집을 찾고 계세요?</b>
					</h1>
					</td>
			</tr>
			<tr height=30 >
				<td><a href="javascript:kindSel(1)" id="apt"> 아파트 </a></td>
				<td><a href="javascript:kindSel(2)" id="house"> 빌라,투룸+ </a></td>
				<td><a href="javascript:kindSel(3)" id="studio"> 원룸 </a></td>
			</tr>
			<tr height=30>
				<td colspan="3" align="center"><input type="text" name="address"
					value="원하시는 지역명(oo구 혹은 oo시)을 입력해주세요" size=50> <input
					type="submit" value="검색" onclick="return searchSave()">
			</tr>
		</table>
	</form>
</td>
<%@ include file="../mainSigninLogin/bottom.jsp"%>