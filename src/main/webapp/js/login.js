$(function () {
		$('login-button').click(function () {

			$.ajax({
				url: 'loginC',
				type: "get",
				data: {id: $('id').val(), pw: $('pw').val()}, // test?name=asd&age=10
				success: function (resData) {
					console.log(resData);
					console.log(resData.people);
					console.log(JSON.stringify(resData.people)); // 데이터를 문자열화
					for (let i = 0; i < resData.people.length; i++) {
							let content = `<h1> ${resData.people[i].no} / ${resData.people[i].name} / ${resData.people[i].age} </h1>`;
						$('span').append(content);

					}

				}, error: function (xhr, status, error) {
					console.log('에러 발생!');
					console.log('xhr: ' + xhr);
					console.log('status: ' + status);
					console.log('error: ' + error);
				}
			});
		});

	});