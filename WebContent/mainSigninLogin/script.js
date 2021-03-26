/**
 * 
 */
$(function(){

	
})
function questionSave(){
	if($('textarea[name="content"]').val()==""){
		alert("문의 내용을 입력하세요");
		return false;
	}
		
}
function idInput() {
	$('#idmsg').empty();
}
var idChecked = false;
function realEstateWriteSave() {
	if ($('select[name="type"]').val() == "선택") {
		alert("타입을 선택하세요");
		return false;
	}
	if ($('input[name="price"]').val() == "") {
		alert("가격을 입력하세요");
		$('input[name="price"]').focus();
		return false;
	}
	if ($('input[name="fee"]').val() == "") {
		alert("관리비를 입력하세요");
		$('input[name="fee"]').focus();
		return false;
	}
	if ($('input[name="constructiondate"]').val() == "") {
		alert("준공날짜를 입력하세요");
		$('input[name="constructiondate"]').focus();
		return false;
	}
	if ($('input[name="moveindate"]').val() == "") {
		$('input[name="moveindate"]').val("1111-01-01");
	}

	if (!($('input[name="image1"]').val())
			&& !($('input[name="image2"]').val())
			&& !($('input[name="image3"]').val())
			&& !($('input[name="image4"]').val())) {
		alert('이미지 하나이상 선택 필수');
		return false;
	}

	var options = $('select[name="options"]').val();
	alert(options.length);
	var optionflag = false;
	for (i = 0; i < options.length; i++) {
		optionflag = true;
	}

}
function idDuplicateCheck() {
	if ($('input[name="id"]').val() == ""
			|| $('input[name="id"]').val() == '아이디') {
		alert("아이디를 입력하세요");
		$('input[name="id"]').focus();
		return;
	}
	var regExpId =/^[a-zA-Z0-9]+$/;
	var id = $('input[name="id"]').val();
	var result = id.search(regExpId);
	if (result == -1) {
		alert("아이디 형식을 확인하세요");
		return;
	}
	$.ajax({
				url : "id_check_Proc.jsp",
				data : ({
					id : $('input[name="id"]').val()
				}),
				success : function(data) {
					if ($.trim(data) == 'YES') {
						$('#idmsg').html(
								'<font color="green">사용 가능한 아이디 입니다</font>')
								.show();
						idChecked = true;
					} else {
						$('#idmsg')
								.html('<font color="red">중복된 아이디 입니다</font>')
								.show();
						idChecked = false;
					}
				}

			});
}
function pwCheck() {
	var password = $('input[name="password"]').val();
	var regExpPw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,10}$/;
	var result = password.search(regExpPw);
	if (result == -1) {
		$('#pwmsg').html('<font color="red">비밀번호 형식을 확인해주세요</font>').show();
		$('input[name="password"]').focus();
	} else {
		$('#pwmsg').empty();
	}
}
var pwChecked = false;
function rePwCheck() {
	if ($('input[name="password"]').val() != $('input[name="rePassword"]')
			.val()) {
		$('#rePwmsg').html('<font color="red">비밀번호와 일치하지 않습니다</font>').show();
		$('input[name="rePassword"]').focus();

	} else {
		$('#rePwmsg').html('<font color="green">비밀번호 확인 완료!</font>').show();
		pwChecked = true;

	}
}
function loginSave() {
	if ($('input[name="id"]').val() == ""
			|| $('input[name="id"]').val() == '아이디') {
		alert("아이디를 입력하세요");
		$('input[name="id"]').focus();
		return false;
	}
	if ($('input[name="password"]').val() == ""
			|| $('input[name="password"]').val() == '비밀번호') {
		alert("비밀번호를 입력하세요");
		$('input[name="password"]').focus();
		return false;
	}

}
function updateSave() {

	if ($('input[name="password"]').val() == ""
			|| $('input[name="password"]').val() == '비밀번호') {
		alert('비밀번호를 입력해주세요')
		$('input[name="password"]').focus();
		return false;
	}
	if (pwChecked == false) {
		alert('비밀번호를 잘못 입력하셨습니다');
		$('input[name="password"]').focus();
		return false;

	}
	if ($('input[name="name"]').val() == "") {
		alert("이름을 입력해주세요");
		$('input[name="name"]').focus();
		return false;
	}
	if ($('input[name="agency_name"]').val() == "") {
		alert("중개사무소 이름을 입력해주세요");
		$('input[name="agency_name"]').focus();
		return false;
	}
	if ($('input[name="agent_name"]').val() == "") {
		alert("대표 중개사 이름을 입력해주세요");
		$('input[name="agent_name"]').focus();
		return false;
	}
	if ($('input[name="phone1"]').val() == '선택'
			|| $('input[name="phone2"]').val() == ""
			|| $('input[name="phone3"]').val() == "") {
		alert("번호를 입력해주세요");
		$('input[name="phone1"]').focus();
		return false;
	}
	if (isNaN($('select[name="phone1"]').val())
			|| isNaN($('input[name="phone2"]').val())
			|| isNaN($('input[name="phone3"]').val())) {
		alert("번호를 잘못입력하셨습니다");
		return false;
		$('input[name="phone1"]').focus();

	}
	if ($('input[name="address"]').val() == "") {
		alert('주소를 입력해주세요')
		$('input[name="address"]').focus();
		return false;
	}
	if ($('input[name="email"]').val().indexOf('@') < 0) {
		alert('이메일 형식을 확인해주세요')
		$('input[name="email"]').focus();
		return false;
	}
	if ($('input[type="radio"]').val() == "") {
		alert("인증 여부를 선택해주세요");
		return false;
	}

}
function signinSave() {
	if (idChecked == false) {
		alert('아이디 중복체크 필수')
		$('input[name="id"]').focus();
		return false;
	}
	if ($('input[name="password"]').val() == ""
			|| $('input[name="password"]').val() == '비밀번호') {
		alert('비밀번호를 입력해주세요')
		$('input[name="password"]').focus();
		return false;
	}
	if (pwChecked == false) {
		alert('비밀번호를 잘못 입력하셨습니다');
		$('input[name="password"]').focus();
		return false;

	}
	if ($('input[name="name"]').val() == "") {
		alert("이름을 입력해주세요");
		$('input[name="name"]').focus();
		return false;
	}
	if ($('input[name="agency_name"]').val() == "") {
		alert("중개사무소 이름을 입력해주세요");
		$('input[name="agency_name"]').focus();
		return false;
	}
	if ($('input[name="agent_name"]').val() == "") {
		alert("대표 중개사 이름을 입력해주세요");
		$('input[name="agent_name"]').focus();
		return false;
	}
	if ($('input[name="phone1"]').val() == '선택'
			|| $('input[name="phone2"]').val() == ""
			|| $('input[name="phone3"]').val() == "") {
		alert("번호를 입력해주세요");
		$('input[name="phone1"]').focus();
		return false;
	}
	if (isNaN($('input[name="phone2"]').val())
			|| isNaN($('input[name="phone3"]').val())) {
		alert("번호를 잘못입력하셨습니다");
		return false;
		$('input[name="phone1"]').focus();

	}
	if ($('input[name="address"]').val() == "") {
		alert('주소를 입력해주세요')
		$('input[name="address"]').focus();
		return false;
	}
	if ($('input[name="email"]').val().indexOf('@') < 0) {
		alert('이메일 형식을 확인해주세요')
		$('input[name="email"]').focus();
		return false;
	}
	if ($('input[type="radio"]').val() == "") {
		alert("인증 여부를 선택해주세요");
		return false;
	}

}


