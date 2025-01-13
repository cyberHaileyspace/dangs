// 모달 요소 가져오기
var modal = document.getElementById("signupModal");
var btn = document.getElementById("openModalBtn");
var span = document.getElementsByClassName("close")[0];
var cancelBtn = document.getElementById("cancelBtn");

// 모달 열기
btn && (
	btn.onclick = function() {
		modal.style.display = "block";
	}
)
// 모달 닫기
span && (
	span.onclick = function() {
		modal.style.display = "none";
	}
)
cancelBtn && (
cancelBtn.onclick = function() {
	modal.style.display = "none";
}
)
// 모달 외부 클릭 시 닫기

/*window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}*/



function regi() {
    // 입력값 가져오기
    let username = $('#username').val();
    let password = $('#password').val();
    let confirmPassword = $('#confirmPassword').val();
    let name = $('#name').val();
    let age = $('#age').val();
    let email = $('#email').val();
    let tel = $('#tel').val();
    let address = $('#address').val();

    // 에러 메시지 요소 가져오기
    let usernameError = $('#usernameError');
    let passwordError = $('#passwordError');
    let confirmPasswordError = $('#confirmPasswordError');
    let nameError = $('#nameError');
    let ageError = $('#ageError');
    let emailError = $('#emailError');
    let telError = $('#telError');
    let addressError = $('#addressError');

    let valid = true;

    // 유효성 검사
    // username: 6~20글자, 영문 숫자만
    if (!/^[a-zA-Z0-9]{6,20}$/.test(username)) {
        usernameError.text('아이디는 6~20글자, 영문과 숫자로만 작성해주세요').show();
        valid = false;
        $('#username').focus();
        return;
    } else {
        usernameError.hide();
    }

    // password: 6~20글자, 특수문자 불가능
    if (!/^[a-zA-Z0-9]{6,20}$/.test(password)) {
        passwordError.text('비밀번호는 6~20글자, 특수문자 불가능').show();
        valid = false;
        $('#password').focus();
        return;
    } else {
        passwordError.hide();
    }

    // confirmPassword: password와 같은지 확인
    if (password !== confirmPassword) {
        confirmPasswordError.text('비밀번호가 일치하지 않습니다').show();
        valid = false;
          $('#confirmPassword').focus();
        return;
    } else {
        confirmPasswordError.hide();
    }

    // name: 한글만 입력 가능, 최소 2글자
    if (!/^[가-힣]{2,}$/.test(name)) {
        nameError.text('이름은 한글로 2글자 이상 입력해주세요').show();
        valid = false;
        $('#name').focus();
        return;
    } else {
        nameError.hide();
    }

    // age: 2자리 숫자
    if (!/^\d{2}$/.test(age)) {
        ageError.text('나이는 2자리 숫자로 입력해주세요').show();
        valid = false;
        $('#age').focus();
        return;
    } else {
        ageError.hide();
    }

    // email: '@' 포함 확인
    if (!/@/.test(email)) {
        emailError.text('이메일 형식을 확인하세요').show();
        valid = false;
        $('#email').focus();
        return;
    } else {
        emailError.hide();
    }

    // tel: 11자리 숫자
    if (!/^\d{11}$/.test(tel)) {
        telError.text('전화번호 형식을 확인하세요').show();
        valid = false;
        $('#tel').focus();
        return;
    } else {
        telError.hide();
    }
    // '동'이라는 글자 포함
        if (!address.includes('동')) {
        addressError.text('예: ~~시 ~~구 ~~동').show();
        $('#address').focus(); // address 필드에 포커스 설정
        valid = false;
        return;
    } else {
        addressError.hide();
alert('회원가입을 축하드립니다. 로그인 해주세요!');
            location.href = "SwRegC?username=" + encodeURIComponent(username) + 
                            "&password=" + encodeURIComponent(password) + 
                            "&name=" + encodeURIComponent(name) + 
                            "&age=" + encodeURIComponent(age) + 
                            "&address=" + encodeURIComponent(address) + 
                            "&email=" + encodeURIComponent(email) + 
                            "&tel=" + encodeURIComponent(tel);

    }
   
}