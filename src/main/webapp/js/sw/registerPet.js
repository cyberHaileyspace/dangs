$(document).ready(function() {
    $('#petPhoto').change(function(event) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#petPhotoPreview').attr('src', e.target.result).show();
        }
        reader.readAsDataURL(event.target.files[0]);
    });
});