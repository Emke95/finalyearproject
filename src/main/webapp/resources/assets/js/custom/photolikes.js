$(document).ready(function() {

	$(".wrapper").on('click', '.addPhotoLike', function(){

		var link = $(this);
		var div = $(this).parent().parent();
		var photoId = $(div).find("hidden").attr("value");
		var like = $(div).find("span");
		
		$.ajax(
				{
					type : "GET",
					data : "id=" + photoId,
					url : "addPhotoLike",
					success : function(data) {
								$(like).html(data);
					},
					error : function(xhr, ajaxOptions, thrownError) {
	                        alert(xhr.status);
	                        alert(thrownError);
							}
			});
	});
});