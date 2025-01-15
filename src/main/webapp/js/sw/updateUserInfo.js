$(document).ready(function() {

	userInfoOnload();

	$('#cancelBtn').click(function() {
		window.history.back();
	});


	// 파일 선택 후 파일명이 텍스트로 표시
	$('#photoInput').change(function(event) {
		var fileName = event.target.files[0] ? event.target.files[0].name : "Choose a file";
		$('.file-label').text(fileName);  // 선택된 파일명으로 텍스트 변경
	});
	// 사진 업로드 시 미리보기 기능
	$('#photoInput').change(function(event) {
		var reader = new FileReader();
		reader.onload = function(e) {
			// 업로드된 이미지 미리보기
			$('#updatePhoto').attr('src', e.target.result);
		}
		reader.readAsDataURL(event.target.files[0]);
	});




});


function userInfoOnload() {
	$('#updateName').val($('#data-container').data('username'));
	$('#updateAge').val($('#data-container').data('age'));
	$('#updateEmail').val($('#data-container').data('email'));
	$('#updateTel').val($('#data-container').data('tel'));
	//	 $('#updatePhoto').val($('#data-container').data('photo'));
	$('#updateNickname').val($('#data-container').data('nickname'));
	$('#updateAddress').val($('#data-container').data('address'));
}