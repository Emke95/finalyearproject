<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ include file="/WEB-INF/views/include/header.jsp"%>
            <html lang="en">
            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
            </head>
            <body>
                <section id="container">
                    <div id="map">
                        <script>
                            var marker;
                            var options = {
                                zoom: 2,
                                mapTypeId: google.maps.MapTypeId.ROADMAP,
                                center: new google.maps.LatLng(0.0, 0.0)
                            };
                            var image = 'C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\marker.png';
                            var map = new google.maps.Map(document.getElementById('map_canvas'), options);
                            var marker;
                            function initMap() {
                                var map = new google.maps.Map(document.getElementById('map'), {
                                    zoom: 13,
                                   center: {
                                        lat: 53.3498,
                                        lng: -6.2603
                                    }
                                });
    marker1 = new google.maps.Marker({
        position:new google.maps.LatLng(52.12455, -10.460241666666667),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\user_images2\\IMG_6845.JPG"});
                                google.maps.event.addListener(marker1, 'mouseover', function() {
                                    marker1.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_6845.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker2 = new google.maps.Marker({
        position:new google.maps.LatLng(53.114025, -6.2634944444444445),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\user_images2\\IMG_7534.JPG"});
                                google.maps.event.addListener(marker2, 'mouseover', function() {
                                    marker2.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7534.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
}
			</script>
		</div>
	</section>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0suNjU_wX-qYG5YaGOvi34Nbt4lRLmBo&callback=initMap">
	</script>
</body>
</html>
