$(function () {

    // 페이지 상태
    let currentPage = 1; // 현재 페이지
    const numOfRows = 12; // 페이지당 데이터 수

    // API 데이터를 저장하는 함수
    function saveAPIData(pageNo, numOfRows) {
        $.ajax({
            url: `/AdoptAPI?pageNo=${pageNo}&numOfRows=${numOfRows}`, // 데이터 저장 URL
            type: "GET", // HTTP GET 요청
            dataType: "json", // 서버에서 반환할 데이터 형식
            success: function (response) {
                // 저장 성공 시 처리
                console.log("데이터 저장 성공:", response.message);
                alert("데이터 저장이 완료되었습니다.");
            },
            error: function (xhr, status, error) {
                // 저장 실패 시 처리
                console.error("데이터 저장 실패:", error);
                alert("데이터 저장 중 오류가 발생했습니다.");
            },
        });
    }

    // 공고 데이터를 서버에서 가져오는 함수
    function fetchData(pageNo, numOfRows) {
        $.ajax({
            url: `/AjaxController?pageNo=${pageNo}&numOfRows=${numOfRows}`, // 데이터 조회 URL
            type: "GET", // HTTP GET 요청
            dataType: "json",
            success: function (data) {
                console.log("데이터 조회 성공:", data);
                renderData(data); // 데이터를 화면에 렌더링
            },
            error: function (xhr, status, error) {
                console.error("데이터 조회 실패:", error);
                alert("데이터를 가져오는 중 오류가 발생했습니다.");
            }
        });
    }

    // 데이터를 화면에 렌더링하는 함수
    function renderData(data) {
        const resultContainer = $("#resultAsdasd");
        resultContainer.empty(); // 기존 데이터 초기화

        if (data.length === 0) {
            resultContainer.html("<p>표시할 데이터가 없습니다.</p>");
            return;
        }

        data.forEach(function (item) {
            const itemHtml = `
                <div class="item">
                    <div class="img-container" data-id="${item.desertionNo}">
                        <img src="${item.filename || "default-image.jpg"}" alt="Animal Image">
                    </div>
                    <div class="kind-container" data-id="${item.desertionNo}">
                        <strong>품종:</strong> ${item.kindCd}
                    </div>
                    <div><strong>나이:</strong> ${item.age}</div>
                    <div><strong>발견 장소:</strong> ${item.happenPlace}</div>
                    <div><strong>보호소:</strong> ${item.careNm}</div>
                    <hr>
                </div>
            `;
            resultContainer.append(itemHtml);
        });
    }

    // 페이지 로드 시 첫 페이지 데이터를 자동으로 가져오기
    $(document).ready(function () {
        fetchData(currentPage, numOfRows); // 페이지 로드 시 첫 데이터 가져오기
    });

    // 버튼 클릭 이벤트 처리
    $("#saveDataButton").click(function () {
        saveAPIData(currentPage, numOfRows);
    });

    $("#nextPageButton").click(function () {
        currentPage++;
        fetchData(currentPage, numOfRows);
    });

    $("#prevPageButton").click(function () {
        if (currentPage > 1) {
            currentPage--;
            fetchData(currentPage, numOfRows);
        } else {
            alert("첫 번째 페이지입니다.");
        }
    });

});
