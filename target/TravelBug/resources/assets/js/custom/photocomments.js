$(document).ready(function() {

	$(".wrapper").on('click', '.addPhotoComment', function(){

		var link = $(this);
		var comment = $(this).parent().find(".comment").val();
		var div = $(this).parent().parent();
		var photoId = $(div).find("hidden").attr("value");

		$.ajax(
				{
					type : "GET",
					data : "id=" + photoId + "&comment=" + comment,
					url : "addPhotoComment",
					success : function(data) {
								$(div).find(".commentSection").append(data);
								
					},
					error : function(xhr, ajaxOptions, thrownError) {
	                        alert(xhr.status);
	                        alert(thrownError);
							}
			});
	});
});