<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/index.css" />
    <script
      src="https://code.jquery.com/jquery-3.7.1.js"
      integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript" src="js/index.js" defer="defer"></script>
    <script type="text/javascript" src="js/sw_reg_modal.js" defer></script>
  </head>
  <body>
    <div class="main-wrapper">
      <div
        class="logo-div"
        onclick="location.href='HC'"
        style="cursor: pointer"
      >
        <img
          class="logo"
          alt=""
          src="img/dog-nose.png"
          style="width: 40px; height: 40px"
        />
      </div>
      <div class="logo-div-02">
        <div class="adopt" style="cursor: pointer">입양</div>
        <div onclick="location.href='ShopC'" style="cursor: pointer">
          중고거래
        </div>
        <div onclick="location.href='locationC'" style="cursor: pointer">
          산책로
        </div>
        <div onclick="location.href='CmMainC'" style="cursor: pointer">
          커뮤니티
        </div>
        <div class="myPage" id="myPage" style="cursor: pointer">마이페이지</div>
      </div>
      <div class="logo-div-03"></div>
    </div>
    <div style="display: flex; gap:10px;">
      <div class="index-content">
        <jsp:include page="${content }"></jsp:include>
      </div>
      <div class="login">
        <jsp:include page="${loginCheck }"></jsp:include>
      </div>
    </div>
    <!-- 모달 -->
    <div id="signupModal" class="modal">
      <div class="modal-content">
        <div style="display: flex; justify-content: space-between">
          <div>
            <img
              class="logo"
              alt=""
              src="img/dog-nose.png"
              style="width: 40px; height: 40px"
            />
          </div>
          <div><span class="close">&times;</span></div>
        </div>
        <div id="signupForm">
          <div class="swInputDiv">
            <input
              type="text"
              id="username"
              name="username"
              required
              placeholder="아이디"
            />
            <span id="usernameError" class="error-message"></span>
          </div>
          <div class="swInputDiv">
            <input
              type="password"
              id="password"
              name="password"
              required
              placeholder="비밀번호"
            />
            <span id="passwordError" class="error-message"></span>
          </div>
          <div class="swInputDiv">
            <input
              type="password"
              id="confirmPassword"
              name="confirmPassword"
              required
              placeholder="비밀번호 확인"
            />
            <span id="confirmPasswordError" class="error-message"></span>
          </div>
          <div class="swInputDiv">
            <input
              type="text"
              id="name"
              name="name"
              required
              placeholder="이름"
            />
            <span id="nameError" class="error-message"></span>
          </div>
          <div class="swInputDiv">
            <input
              type="number"
              id="age"
              name="age"
              required
              placeholder="나이"
            />
            <span id="ageError" class="error-message"></span>
          </div>
          <div class="swInputDiv">
            <input
              type="email"
              id="email"
              name="email"
              required
              placeholder="이메일"
            />
            <span id="emailError" class="error-message"></span>
          </div>
          <div class="swInputDiv">
            <input
              type="number"
              id="tel"
              name="tel"
              required
              placeholder="연락처"
            />
            <span id="telError" class="error-message"></span>
          </div>
          <div class="swInputDiv">
            <input
              type="text"
              id="address"
              name="address"
              required
              placeholder="주소"
            />
            <span id="addressError" class="error-message"></span>
          </div>

          <div style="display: flex; width=500px;">
            <button type="button" id="RegSubmit" onclick="regi()">
              회원가입
            </button>
            <button type="button" id="cancelBtn">취소</button>
          </div>
        </div>
      </div>
    </div>
    <!-- 모달 끝 -->
    <script type="text/javascript" src="js/sw_reg_modal.js"></script>
  </body>
</html>
