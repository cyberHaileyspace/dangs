$(function () {
    let currentPage = 1; // 현재 페이지 번호
    const totalPages = 4; // 총 페이지 수

    // 데이터를 가져와 표시하는 함수
    function loadPageData(pageNo) {
        $.ajax({
            url: 'AjaxController',
            type: 'GET',
            data: { pageNo: pageNo },
            dataType: 'json',
            success: function (resData) {
                console.log(resData);

                const items = resData.response.body.items.item;

                // 결과 초기화
                $('#adoptPosts').empty();

                // 각 항목을 순회하며 HTML 생성
                $.each(items, function (i, ob) {
                    const itemHtml = `
                        <div class="item">
                            <div><strong>사진:</strong> <img src="${ob.filename}" alt="Animal Image"></div>
                            <div><strong>나이:</strong> ${ob.age}</div>
                            <div><strong>지역:</strong> ${ob.happenPlace}</div>
                            <div><strong>품종:</strong> ${ob.kindCd}</div>
                            <div><strong>보호소 이름:</strong> ${ob.careNm}</div>
                            <hr>
                        </div>
                    `;

                    $('#adoptPosts').append(itemHtml);
                });
            },
            error: function (xhr, status, error) {
                console.log('에러 발생');
                console.log('xhr:', xhr);
                console.log('status:', status);
                console.log('error:', error);
                $('#adoptPosts').html('<p>데이터를 불러오는데 실패했습니다.</p>');
            }
        });
    }

    // 초기 데이터 로드
    loadPageData(currentPage);

    // 이전 페이지 버튼 클릭
    $('#prevPage').click(function () {
        if (currentPage > 1) {
            currentPage--;
            loadPageData(currentPage);
        } else {
            alert('첫 페이지입니다.');
        }
    });

    // 다음 페이지 버튼 클릭
    $('#nextPage').click(function () {
        if (currentPage < totalPages) {
            currentPage++;
            loadPageData(currentPage);
        } else {
            alert('마지막 페이지입니다.');
        }
    });
});
