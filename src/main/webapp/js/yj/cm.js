$(function() {
	searchCm();
	loadContent();
	reply();
})


function searchCm() {


	$("#search-cm-btn").click(function() {
		const cmTitle = $("#search-cm-input").val();
		console.log(cmTitle);

		$.ajax({
			url: 'CmSearchC',	//어디로 요청?
			data: { cmTitle }	// 파라미터
		}).done(function(resData) {

			//나온 결과가 지워졌다 다시 나옴!

			console.log(resData)
			console.log(resData.length)
			console.log(JSON.stringify(resData))

			if (resData.length != 0) {
				$("#cm-result").empty();
				showResult(resData);
			}
		})				// done처럼 괄호뒤에 . 을 붙여 써도 되고 fail처럼 엔터치고 써도 된다.
			.fail(function(xhr) {

				console.log(xhr);
			})


	})
}



function loadContent() {


	$(".menu").click(function() {
		let menu = $(this).data("val");
		console.log(menu)
		if(menu == undefined){
			menu = "";
		}

		$.ajax({
			url: 'CmSearchC',	//어디로 요청?
			data: { menu }	// 파라미터
		}).done(function(resData) {

			//나온 결과가 지워졌다 다시 나옴!

			console.log(resData)
			console.log(resData.length)
			console.log(JSON.stringify(resData))

			if (resData.length != 0) {
				$("#cm-result").empty();
				showResult(resData);
			}
		})				// done처럼 괄호뒤에 . 을 붙여 써도 되고 fail처럼 엔터치고 써도 된다.
			.fail(function(xhr) {

				console.log(xhr);
			})


	})
}


function showResult(resData) {
	console.log(resData)

	$.each(resData, function(i, r) {
		console.log(i);
		console.log(r);

		//		백틱!
		//<fmt:formatDate value="${r.r_date }"/>
		let content = `
      <div class="post-cm" onclick="location.href='CmPostC?no=${r.cm_no}'">
      	<div class="cm-kind">
      		<div class="cm-menu">${r.cm_cate}</div>
      		<div class="cm-cate">${r.cm_size}</div>
      	</div>
      <div class="cm-title">${r.cm_title}</div>
      <div class="cm-content">
      <div class="cm-text"><span>${r.cm_text}</span></div>
      <div class="cm-img"><img alt="" src="img/post/${r.cm_img }"></div>
      </div>
      <div class="cm-info">
      	<div class="info-name">작성자 : ${r.cm_user_id}</div>
      	<div class="info-date">작성일 : ${r.cm_date}</div>
      	<div class="info-view">조회수 : ${r.cm_view}</div>
      	<div class="info-like">좋아요 : ${r.cm_like}</div>
      	<div hidden>${r.cm_no}</div>
      </div>
<!--       <hr> -->
      </div>
      </c:forEach>`;

		$("#cm-result").append(content);

	})
}


function deleteCm(noo){
	let ok = confirm ('really?')
	
	if (ok){
		location.href="CmDelC?no=" + noo;
		
	}
	
}


function reply() {


	$(".size").click(function() {
		let size = $(this).data("val");
		console.log(size)
		if(size == undefined){
			size = "";
		}

		$.ajax({
			url: 'CmSearchC',	//어디로 요청?
			data: { size }	// 파라미터
		}).done(function(resData) {

			//나온 결과가 지워졌다 다시 나옴!

			console.log(resData)
			console.log(resData.length)
			console.log(JSON.stringify(resData))

			if (resData.length != 0) {
				$("#cm-result").empty();
				showResult(resData);
			}
		})				// done처럼 괄호뒤에 . 을 붙여 써도 되고 fail처럼 엔터치고 써도 된다.
			.fail(function(xhr) {

				console.log(xhr);
			})


	})
}