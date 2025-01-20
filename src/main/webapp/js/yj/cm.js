function searchCm(){
	

	$("#search-cm-btn").click(function(){
	const cmTitle = $("#search-cm-input").val();
	console.log(cmTitle);
		
		$.ajax({
			url:'CmSearchC',	//어디로 요청?
			data : {cmTitle}	// 파라미터
		}).done(function(resData){
			
			$("#cm-result").empty(); //나온 결과가 지워졌다 다시 나옴!
			
			console.log(resData)
			console.log(resData.length)
			console.log(JSON.stringify(resData))

			if(resData.length != 0){
			showResult(resData);
			}
		})				// done처럼 괄호뒤에 . 을 붙여 써도 되고 fail처럼 엔터치고 써도 된다.
		.fail(function(xhr){
			
			console.log(xhr);
		})
		
		
	})
}






function showResult(resData){
	$.each(resData, function(i, r){
		console.log(i);
		console.log(r);
		
//		백틱!
//<fmt:formatDate value="${r.r_date }"/>
		let content = `
      <div class="post-cm" onclick="location.href='CmPostC?no=${i.cm_no }'">
      	<div class="cm-kind">
      		<div class="cm-menu">${i.cm_cate }</div>
      		<div class="cm-cate">${i.cm_size }</div>
      	</div>
      <div class="cm-title">${i.cm_title }</div>
      <div class="cm-content">
      <div class="cm-text"><span>${i.cm_text }</span></div>
      <div class="cm-img"><img alt="" src="img/dog-nose.png"></div>
      </div>
      <div class="cm-info">
      	<div class="info-name">작성자 : ${i.cm_user_id }</div>
      	<div class="info-date">작성일 : ${i.cm_date }</div>
      	<div class="info-view">조회수 : ${i.cm_view }</div>
      	<div class="info-like">좋아요 : ${i.cm_like }</div>
      	<%-- <div hidden>${i_cm_no }</div> --%>
      </div>
<!--       <hr> -->
      </div>
      </c:forEach>`;
		
		$("#cm-result").append(content);
		
	})
}