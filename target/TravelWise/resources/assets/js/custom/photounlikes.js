$(document).ready(function() {
$(".wrapper").on('click', '.unLikePhoto', function(){

		var link = $(this);
		var div = $(this).parent().parent();
		var photoId = $(div).find("hidden").attr("value");
		var unLike = $(div).find("span");
		
		$.ajax(
				{
					type : "GET",
					data : "id=" + photoId,
					url : "unLikePhoto",
					success : function(data) {
								$(unLike).html(data);
					},
					error : function(xhr, ajaxOptions, thrownError) {
	                        alert(xhr.status);
	                        alert(thrownError);
							}
			});
	});
});