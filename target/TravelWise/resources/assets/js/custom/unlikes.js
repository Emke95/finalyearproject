$(document).ready(function() {

	$(".wrapper").on('click', '.unLike', function(){

		var link = $(this);
		var div = $(this).parent().parent();
		var postId = $(div).find("hidden").attr("value");
		var unLike = $(div).find("span");
		
		$.ajax(
				{
					type : "GET",
					data : "id=" + postId,
					url : "unLike",
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