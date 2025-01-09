// 모달 요소 가져오기
var modal = document.getElementById("signupModal");
var btn = document.getElementById("openModalBtn");
var span = document.getElementsByClassName("close")[0];
var cancelBtn = document.getElementById("cancelBtn");

// 모달 열기
btn.onclick = function() {
  modal.style.display = "block";
}

// 모달 닫기
span.onclick = function() {
  modal.style.display = "none";
}

cancelBtn.onclick = function() {
  modal.style.display = "none";
}

// 모달 외부 클릭 시 닫기
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
