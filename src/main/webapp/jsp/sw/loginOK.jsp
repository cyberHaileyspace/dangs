<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/loginOK.css">
</head>
<body>
    <div class="loginAA">
        <div class="profile-section">
            <div class="profile-icon">
                <img src="img/userProfile/${sessionScope.user.photo}" alt="Profile Image" />
            </div>
            <div class="profile-name">${sessionScope.user.name}님, 반가워요!</div>
            <div class="settings-icon" onclick="location.href='updateUserInfoC'">⚙️</div>
        </div>
        <div class="stats-section">
            <div class="stat">
                <span class="label">하트</span>
                <span class="value">0개</span>
            </div>
            <div class="stat">
                <span class="label">랭킹</span>
                <span class="value">256위</span>
            </div>
            <div class="stat">
                <span class="label">구독자</span>
                <span class="value">0명</span>
            </div>
        </div>
        <div class="menu-section">
            <div class="menu-item">마이페이지</div>
            <div class="menu-item">MY구독</div>
            <div class="menu-item">알림</div>
            <div class="menu-item">메시지</div>
        </div>
        <div class="footer-section">
            <button class="logout" onclick="location.href='logoutC'">로그아웃</button>
        </div>
    </div>
</body>
</html>
