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
                            <img src="${ob.popfile}" alt="Thumbnail">
							<div class="itme-content">                            
                           		<p> ${ob.kindCd} </p>
                           		<p> ${ob.age} </p>
                            	<p> ${ob.sexCd}, ${ob.neuterYn} </p>
                            	<p> 지역: ${ob.happenPlace}</p>
                        	</div>
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
