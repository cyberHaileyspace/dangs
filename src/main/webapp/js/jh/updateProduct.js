// 메인 카테고리별 서브 카테고리 데이터
const subCategories = {
    food: ["feed", "snack", "nutritional supplements"],
    cloth: ["accessories", "indoor", "outdoor"],
    etc: ["defecation/sanitation", "home/living", "toy"]
};

// 메인 및 서브 카테고리 <select> 요소
const mainCategory = document.getElementById("main-cate");
const subCategory = document.getElementById("sub-cate");

// JSP에서 전달된 서브 카테고리 값 (서버에서 렌더링된 값을 받음)
const selectedSubCategory = "${sub_category}"; // 서브 카테고리 값

// 메인 카테고리 변경 시 서브 카테고리 업데이트
mainCategory.addEventListener("change", function () {
    const selectedMain = this.value; // 선택된 메인 카테고리 값
    const options = subCategories[selectedMain] || []; // 해당 서브 카테고리 배열 가져오기

    // 서브 카테고리 초기화
    subCategory.innerHTML = ""; // 기존 옵션 제거

    // 새로운 서브 카테고리 옵션 추가
    options.forEach((sub) => {
        const option = document.createElement("option");
        option.value = sub;
        option.textContent = sub;

        // 서브 카테고리 기본값 설정
        if (sub === selectedSubCategory) {
            option.selected = true; // JSP에서 전달받은 값과 일치하면 선택
        }

        subCategory.appendChild(option);
    });
});

// 페이지 로드 시 기본 서브 카테고리 설정
document.addEventListener("DOMContentLoaded", function () {
    mainCategory.dispatchEvent(new Event("change")); // 기본 메인 카테고리에 따라 서브 카테고리 설정
});