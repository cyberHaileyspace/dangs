// 초기 값 설정
let count = 0;

// 요소 선택
const numberDisplay = document.getElementById('number');
const decreaseButton = document.getElementById('decrease');
const increaseButton = document.getElementById('increase');

// 감소 버튼 클릭 이벤트
decreaseButton.addEventListener('click', () => {
	if(count > 1) {
  		count--;
  		updateDisplay();
  	}
});

// 증가 버튼 클릭 이벤트
increaseButton.addEventListener('click', () => {
    if(count < 50) {
  		count++;
  		updateDisplay();
  	}
});

// 숫자 업데이트 함수
function updateDisplay() {
  numberDisplay.textContent = count;
}

// 하트 누르면 색바뀜 + 원래대로 돌아오기
const heart = document.querySelector('.heart');

const origin = '♡︎';
const change = '♥︎︎';

heart.addEventListener('click', () => {
	if(heart.innerText === origin) {
		heart.innerText = change;
	} else {
		heart.innerText = origin;
	}
});