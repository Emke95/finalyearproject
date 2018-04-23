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
<a href="/TravelBug/index" class="logo"><b><font color="FF00CC">TW</font></b></a>                    <input id="pac-input" class="controls" type="text" placeholder="Search Box">
                    <div id="map">
                        <script>
                            function initMap() {
                                var map = new google.maps.Map(document.getElementById('map'), {
                                    zoom: 13,
                                    center: {
                                        lat: 53.3498,
                                        lng: -6.2603
                                    }
                                });

                                var marker;
                                var options = {
                                    zoom: 2,
                                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                                    center: new google.maps.LatLng(0.0, 0.0)
                                };

                                var input = document.getElementById('pac-input');
                                var searchBox = new google.maps.places.SearchBox(input);
                                map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

                                map.addListener('bounds_changed', function() {
                                    searchBox.setBounds(map.getBounds());
                                });


                                var markers = [];

                                searchBox.addListener('places_changed', function() {
                                    var places = searchBox.getPlaces();

                                    if (places.length == 0) {
                                        return;
                                    }

                                    // Clear out the old markers.
                                    markers.forEach(function(marker) {
                                        marker.setMap(null);
                                    });
                                    markers = [];

                                    var bounds = new google.maps.LatLngBounds();
                                    places.forEach(function(place) {
                                        if (!place.geometry) {
                                            console.log("Returned place contains no geometry");
                                            return;
                                        }
                                        var icon = {
                                            url: place.icon,
                                            size: new google.maps.Size(71, 71),
                                            origin: new google.maps.Point(0, 0),
                                            anchor: new google.maps.Point(17, 34),
                                            scaledSize: new google.maps.Size(25, 25)
                                        };

                                        // Create a marker for each place.
                                        markers.push(new google.maps.Marker({
                                            map: map,
                                            icon: icon,
                                            title: place.name,
                                            position: place.geometry.location
                                        }));

                                        if (place.geometry.viewport) {
                                            // Only geocodes have viewport.
                                            bounds.union(place.geometry.viewport);
                                        } else {
                                            bounds.extend(place.geometry.location);
                                        }
                                    });
                                    map.fitBounds(bounds);

                                });
    marker1 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(40.545027777777776, 14.234852777777776),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-1837.JPG"});
		    google.maps.event.addListener(marker1, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-1837.JPG');
			return false;
		    });                                google.maps.event.addListener(marker1, 'mouseover', function() {
                                    marker1.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-1837.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker1, 'mouseout', function(){
                                    marker1.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker2 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(40.63235, 14.603019444444444),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-1859.JPG"});
		    google.maps.event.addListener(marker2, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-1859.JPG');
			return false;
		    });                                google.maps.event.addListener(marker2, 'mouseover', function() {
                                    marker2.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-1859.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker2, 'mouseout', function(){
                                    marker2.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker3 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(40.62646111111111, 14.375941666666668),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-1870.JPG"});
		    google.maps.event.addListener(marker3, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-1870.JPG');
			return false;
		    });                                google.maps.event.addListener(marker3, 'mouseover', function() {
                                    marker3.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-1870.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker3, 'mouseout', function(){
                                    marker3.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker4 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(52.3837, 4.902233333333334),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-3544.jpg"});
		    google.maps.event.addListener(marker4, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-3544.jpg');
			return false;
		    });                                google.maps.event.addListener(marker4, 'mouseover', function() {
                                    marker4.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-3544.jpg',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker4, 'mouseout', function(){
                                    marker4.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker5 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(52.51862777777778, 13.399858333333333),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-3868.JPG"});
		    google.maps.event.addListener(marker5, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-3868.JPG');
			return false;
		    });                                google.maps.event.addListener(marker5, 'mouseover', function() {
                                    marker5.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-3868.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker5, 'mouseout', function(){
                                    marker5.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker6 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.37334444444444, -6.241044444444444),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\imgsnow.jpg"});
		    google.maps.event.addListener(marker6, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/imgsnow.jpg');
			return false;
		    });                                google.maps.event.addListener(marker6, 'mouseover', function() {
                                    marker6.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\imgsnow.jpg',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker6, 'mouseout', function(){
                                    marker6.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker7 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.393975, -6.0667027777777776),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_2410.JPG"});
		    google.maps.event.addListener(marker7, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_2410.JPG');
			return false;
		    });                                google.maps.event.addListener(marker7, 'mouseover', function() {
                                    marker7.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_2410.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker7, 'mouseout', function(){
                                    marker7.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker8 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(50.847905555555556, 4.3589416666666665),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_2700.JPG"});
		    google.maps.event.addListener(marker8, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_2700.JPG');
			return false;
		    });                                google.maps.event.addListener(marker8, 'mouseover', function() {
                                    marker8.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_2700.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker8, 'mouseout', function(){
                                    marker8.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker9 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.37146388888889, -6.185213888888889),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_5502.JPG"});
		    google.maps.event.addListener(marker9, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_5502.JPG');
			return false;
		    });                                google.maps.event.addListener(marker9, 'mouseover', function() {
                                    marker9.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_5502.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker9, 'mouseout', function(){
                                    marker9.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker10 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.374008333333336, -6.165097222222222),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_5598.JPG"});
		    google.maps.event.addListener(marker10, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_5598.JPG');
			return false;
		    });                                google.maps.event.addListener(marker10, 'mouseover', function() {
                                    marker10.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_5598.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker10, 'mouseout', function(){
                                    marker10.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker11 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(52.96801111111111, -9.431155555555556),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_6117.JPG"});
		    google.maps.event.addListener(marker11, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_6117.JPG');
			return false;
		    });                                google.maps.event.addListener(marker11, 'mouseover', function() {
                                    marker11.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_6117.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker11, 'mouseout', function(){
                                    marker11.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker12 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(52.84419166666667, -8.982477777777778),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_6132.JPG"});
		    google.maps.event.addListener(marker12, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_6132.JPG');
			return false;
		    });                                google.maps.event.addListener(marker12, 'mouseover', function() {
                                    marker12.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_6132.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker12, 'mouseout', function(){
                                    marker12.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker13 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.347655555555555, -6.320386111111111),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7467.JPG"});
		    google.maps.event.addListener(marker13, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_7467.JPG');
			return false;
		    });                                google.maps.event.addListener(marker13, 'mouseover', function() {
                                    marker13.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7467.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker13, 'mouseout', function(){
                                    marker13.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker14 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.114025, -6.2634944444444445),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7534.JPG"});
		    google.maps.event.addListener(marker14, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_7534.JPG');
			return false;
		    });                                google.maps.event.addListener(marker14, 'mouseover', function() {
                                    marker14.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7534.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker14, 'mouseout', function(){
                                    marker14.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker15 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.38846111111111, -6.063938888888889),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_8489.JPG"});
		    google.maps.event.addListener(marker15, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_8489.JPG');
			return false;
		    });                                google.maps.event.addListener(marker15, 'mouseover', function() {
                                    marker15.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_8489.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker15, 'mouseout', function(){
                                    marker15.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
				}
			</script>
		</div>
	</section>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0suNjU_wX-qYG5YaGOvi34Nbt4lRLmBo&libraries=places&callback=initMap">
	</script>
</body>
</html>
