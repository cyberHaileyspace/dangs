$(function() {


$('#myPage').click(function() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'checkLogin', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            if (xhr.responseText === 'loggedIn') {
                window.location.href = 'myPageC';
            } else if (xhr.responseText === 'notLoggedIn') {
                window.location.href = 'loginC';
            }
        }
    };
    xhr.send();
});


	$('.adopt').click(function() {

		location.href = "AFController"

	})

})