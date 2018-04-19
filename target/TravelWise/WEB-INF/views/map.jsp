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
        position:new google.maps.LatLng(53.374008333333336, -6.165097222222222),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_5598.JPG"});
                                google.maps.event.addListener(marker1, 'hover', function() {
                                    marker1.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_5598.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker2 = new google.maps.Marker({
        position:new google.maps.LatLng(52.96801111111111, -9.431155555555556),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_6117.JPG"});
                                google.maps.event.addListener(marker2, 'hover', function() {
                                    marker2.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_6117.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker3 = new google.maps.Marker({
        position:new google.maps.LatLng(52.84419166666667, -8.982477777777778),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_6132.JPG"});
                                google.maps.event.addListener(marker3, 'hover', function() {
                                    marker3.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_6132.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker4 = new google.maps.Marker({
        position:new google.maps.LatLng(52.12455, -10.460241666666667),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_6845.JPG"});
                                google.maps.event.addListener(marker4, 'hover', function() {
                                    marker4.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_6845.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker5 = new google.maps.Marker({
        position:new google.maps.LatLng(53.34306388888889, -6.259408333333333),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7179.JPG"});
                                google.maps.event.addListener(marker5, 'hover', function() {
                                    marker5.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7179.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker6 = new google.maps.Marker({
        position:new google.maps.LatLng(53.347655555555555, -6.320386111111111),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7467.JPG"});
                                google.maps.event.addListener(marker6, 'hover', function() {
                                    marker6.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7467.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker7 = new google.maps.Marker({
        position:new google.maps.LatLng(53.114025, -6.2634944444444445),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7534.JPG"});
                                google.maps.event.addListener(marker7, 'hover', function() {
                                    marker7.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7534.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker8 = new google.maps.Marker({
        position:new google.maps.LatLng(51.20882777777778, 3.2241444444444447),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7624.JPG"});
                                google.maps.event.addListener(marker8, 'hover', function() {
                                    marker8.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7624.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker9 = new google.maps.Marker({
        position:new google.maps.LatLng(53.14610555555556, -6.210616666666667),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_8023.JPG"});
                                google.maps.event.addListener(marker9, 'hover', function() {
                                    marker9.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_8023.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker10 = new google.maps.Marker({
        position:new google.maps.LatLng(53.38846111111111, -6.063938888888889),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_8489.JPG"});
                                google.maps.event.addListener(marker10, 'hover', function() {
                                    marker10.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_8489.JPG',
                                        scaledSize: new google.maps.Size(150, 200),
                                    });
                                });
    marker11 = new google.maps.Marker({
        position:new google.maps.LatLng(53.37334444444444, -6.241044444444444),
        map:map,
        title:"C:\\Users\\emma.keyes\\PatternWorkspace\\SocialNetworkTravel\\travelwise-master\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\snow.jpg"});
                                google.maps.event.addListener(marker11, 'hover', function() {
                                    marker11.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\snow.jpg',
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
