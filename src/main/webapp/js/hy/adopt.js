$(function () {
		
            
	$(document).ready(function () {
                
		// AJAX 요청
                
		$.ajax({
                    
			url: 'AjaxController', // 서버 URL
            type: "GET",           // GET 요청
            dataType: "json",      // JSON 응답 예상
            success: function (resData) {
                console.log(resData);

            const items = resData.response.body.items.item;

             // 결과 초기화
             $('#resultAsdasd').empty();

             // 각 항목을 순회하며 HTML 생성
             $.each(items, function (i, ob) {
                            
            	 const itemHtml = `
                                <div class="item">
                                    <div class="img-container" data-id="${ob.desertionNo}">
                                    	<img src="${ob.filename}" alt="Animal Image">
                                    </div>
                                    <div class="kind-container" data-id="${ob.desertionNo}">
                                    	<strong>품종:</strong> ${ob.kindCd}
                                    </div>
	                                <div><strong>나이:</strong> ${ob.age}</div>
                                    <div><strong>발견 장소:</strong> ${ob.happenPlace}</div>
                                    <div><strong>보호소:</strong> ${ob.careNm}</div>
                                    <hr>
                                </div>
                            `;
                            
                            $('#resultAsdasd').append(itemHtml);
		             });
 
            },
            
            error: function (xhr, status, error) {
                       
            	console.log('에러 발생');
            	console.log('xhr:', xhr);
            	console.log('status:', status);
            	console.log('error:', error);
            	$('#resultAsdasd').html('<p>데이터를 불러오는데 실패했습니다.</p>');
            }
            
		});
        
	});
    
	$('#resultAsdasd').click(function() {

		location.href = "AdoptDetailController"

	})
     
     
  /*   $(document).on('click', '.img-container', '.kind-container', function() {

		const desertionNo = $(this).data('id')
		const detailUrl = `/AdoptDetailController/${desertionNo}`; // 상세 페이지 URL 생성
		window.location.href = detailUrl;

	})*/

     
     
     
});