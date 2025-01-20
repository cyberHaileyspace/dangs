function searchCm(){
	

	$("#search-cm-btn").click(function(){
	const cmTitle = $("#search-cm-input").val();
	console.log(cmTitle);
		
		$.ajax({
			url:'ReviewSearchC',	//어디로 요청?
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

