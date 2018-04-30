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
<a href="/TravelBug/index" class="logo"><b><font color="125688">Tb</font></b></a>                    <input id="pac-input" class="controls" type="text" placeholder="Search Box">
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
        position:new google.maps.LatLng(55.605447222222224, 12.995225),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-3273.JPG"});
		    google.maps.event.addListener(marker4, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-3273.JPG');
			return false;
		    });                                google.maps.event.addListener(marker4, 'mouseover', function() {
                                    marker4.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-3273.JPG',
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
        position:new google.maps.LatLng(52.3837, 4.902233333333334),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-3544.jpg"});
		    google.maps.event.addListener(marker5, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-3544.jpg');
			return false;
		    });                                google.maps.event.addListener(marker5, 'mouseover', function() {
                                    marker5.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-3544.jpg',
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
        position:new google.maps.LatLng(52.51862777777778, 13.399858333333333),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-3868.JPG"});
		    google.maps.event.addListener(marker6, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-3868.JPG');
			return false;
		    });                                google.maps.event.addListener(marker6, 'mouseover', function() {
                                    marker6.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-3868.JPG',
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
        position:new google.maps.LatLng(52.51388055555555, 13.379608333333334),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-3930.JPG"});
		    google.maps.event.addListener(marker7, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-3930.JPG');
			return false;
		    });                                google.maps.event.addListener(marker7, 'mouseover', function() {
                                    marker7.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-3930.JPG',
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
        position:new google.maps.LatLng(52.52236666666666, 13.412930555555556),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-4022.JPG"});
		    google.maps.event.addListener(marker8, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-4022.JPG');
			return false;
		    });                                google.maps.event.addListener(marker8, 'mouseover', function() {
                                    marker8.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-4022.JPG',
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
        position:new google.maps.LatLng(52.50277222222222, 13.446177777777779),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-4082.JPG"});
		    google.maps.event.addListener(marker9, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-4082.JPG');
			return false;
		    });                                google.maps.event.addListener(marker9, 'mouseover', function() {
                                    marker9.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-4082.JPG',
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
        position:new google.maps.LatLng(51.978030555555556, 5.904227777777778),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-4399.JPG"});
		    google.maps.event.addListener(marker10, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-4399.JPG');
			return false;
		    });                                google.maps.event.addListener(marker10, 'mouseover', function() {
                                    marker10.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-4399.JPG',
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
        position:new google.maps.LatLng(51.97518055555556, 5.864),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-4609.jpg"});
		    google.maps.event.addListener(marker11, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-4609.jpg');
			return false;
		    });                                google.maps.event.addListener(marker11, 'mouseover', function() {
                                    marker11.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-4609.jpg',
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
        position:new google.maps.LatLng(52.72909444444445, 6.091222222222222),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-4745.JPG"});
		    google.maps.event.addListener(marker12, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-4745.JPG');
			return false;
		    });                                google.maps.event.addListener(marker12, 'mouseover', function() {
                                    marker12.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-4745.JPG',
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
        position:new google.maps.LatLng(52.71712777777778, 6.090691666666666),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-4770.JPG"});
		    google.maps.event.addListener(marker13, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-4770.JPG');
			return false;
		    });                                google.maps.event.addListener(marker13, 'mouseover', function() {
                                    marker13.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-4770.JPG',
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
        position:new google.maps.LatLng(52.362775, 4.888072222222222),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-5102.JPG"});
		    google.maps.event.addListener(marker14, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-5102.JPG');
			return false;
		    });                                google.maps.event.addListener(marker14, 'mouseover', function() {
                                    marker14.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-5102.JPG',
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
        position:new google.maps.LatLng(50.941291666666665, 6.956513888888889),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-5229.JPG"});
		    google.maps.event.addListener(marker15, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-5229.JPG');
			return false;
		    });                                google.maps.event.addListener(marker15, 'mouseover', function() {
                                    marker15.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-5229.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker15, 'mouseout', function(){
                                    marker15.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker16 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(50.94099722222222, 6.96305),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG-5251.JPG"});
		    google.maps.event.addListener(marker16, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG-5251.JPG');
			return false;
		    });                                google.maps.event.addListener(marker16, 'mouseover', function() {
                                    marker16.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG-5251.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker16, 'mouseout', function(){
                                    marker16.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker17 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.37334444444444, -6.241044444444444),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\imgsnow.jpg"});
		    google.maps.event.addListener(marker17, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/imgsnow.jpg');
			return false;
		    });                                google.maps.event.addListener(marker17, 'mouseover', function() {
                                    marker17.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\imgsnow.jpg',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker17, 'mouseout', function(){
                                    marker17.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker18 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(52.09858333333334, 5.836799999999999),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_2235.JPG"});
		    google.maps.event.addListener(marker18, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_2235.JPG');
			return false;
		    });                                google.maps.event.addListener(marker18, 'mouseover', function() {
                                    marker18.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_2235.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker18, 'mouseout', function(){
                                    marker18.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker19 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(52.37081944444444, 4.894597222222222),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_2365.JPG"});
		    google.maps.event.addListener(marker19, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_2365.JPG');
			return false;
		    });                                google.maps.event.addListener(marker19, 'mouseover', function() {
                                    marker19.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_2365.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker19, 'mouseout', function(){
                                    marker19.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker20 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.393975, -6.0667027777777776),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_2410.JPG"});
		    google.maps.event.addListener(marker20, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_2410.JPG');
			return false;
		    });                                google.maps.event.addListener(marker20, 'mouseover', function() {
                                    marker20.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_2410.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker20, 'mouseout', function(){
                                    marker20.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker21 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(50.84690555555556, 4.352244444444444),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_2649.JPG"});
		    google.maps.event.addListener(marker21, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_2649.JPG');
			return false;
		    });                                google.maps.event.addListener(marker21, 'mouseover', function() {
                                    marker21.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_2649.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker21, 'mouseout', function(){
                                    marker21.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker22 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(50.847905555555556, 4.3589416666666665),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_2700.JPG"});
		    google.maps.event.addListener(marker22, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_2700.JPG');
			return false;
		    });                                google.maps.event.addListener(marker22, 'mouseover', function() {
                                    marker22.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_2700.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker22, 'mouseout', function(){
                                    marker22.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker23 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(50.8947, 4.341944444444444),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_2786.JPG"});
		    google.maps.event.addListener(marker23, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_2786.JPG');
			return false;
		    });                                google.maps.event.addListener(marker23, 'mouseover', function() {
                                    marker23.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_2786.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker23, 'mouseout', function(){
                                    marker23.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker24 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(55.6797, 12.591252777777779),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_3043.JPG"});
		    google.maps.event.addListener(marker24, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_3043.JPG');
			return false;
		    });                                google.maps.event.addListener(marker24, 'mouseover', function() {
                                    marker24.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_3043.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker24, 'mouseout', function(){
                                    marker24.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker25 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(55.68515833333333, 12.579008333333332),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_3111.JPG"});
		    google.maps.event.addListener(marker25, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_3111.JPG');
			return false;
		    });                                google.maps.event.addListener(marker25, 'mouseover', function() {
                                    marker25.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_3111.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker25, 'mouseout', function(){
                                    marker25.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker26 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.25481111111111, -6.241711111111111),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_4513.JPG"});
		    google.maps.event.addListener(marker26, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_4513.JPG');
			return false;
		    });                                google.maps.event.addListener(marker26, 'mouseover', function() {
                                    marker26.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_4513.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker26, 'mouseout', function(){
                                    marker26.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker27 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.25481111111111, -6.241711111111111),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_4524.JPG"});
		    google.maps.event.addListener(marker27, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_4524.JPG');
			return false;
		    });                                google.maps.event.addListener(marker27, 'mouseover', function() {
                                    marker27.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_4524.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker27, 'mouseout', function(){
                                    marker27.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker28 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.329058333333336, -6.208833333333334),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_5174.JPG"});
		    google.maps.event.addListener(marker28, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_5174.JPG');
			return false;
		    });                                google.maps.event.addListener(marker28, 'mouseover', function() {
                                    marker28.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_5174.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker28, 'mouseout', function(){
                                    marker28.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker29 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.37146388888889, -6.185213888888889),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_5502.JPG"});
		    google.maps.event.addListener(marker29, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_5502.JPG');
			return false;
		    });                                google.maps.event.addListener(marker29, 'mouseover', function() {
                                    marker29.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_5502.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker29, 'mouseout', function(){
                                    marker29.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker30 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.374008333333336, -6.165097222222222),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_5598.JPG"});
		    google.maps.event.addListener(marker30, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_5598.JPG');
			return false;
		    });                                google.maps.event.addListener(marker30, 'mouseover', function() {
                                    marker30.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_5598.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker30, 'mouseout', function(){
                                    marker30.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker31 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(52.96801111111111, -9.431155555555556),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_6117.JPG"});
		    google.maps.event.addListener(marker31, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_6117.JPG');
			return false;
		    });                                google.maps.event.addListener(marker31, 'mouseover', function() {
                                    marker31.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_6117.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker31, 'mouseout', function(){
                                    marker31.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker32 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(52.84419166666667, -8.982477777777778),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_6132.JPG"});
		    google.maps.event.addListener(marker32, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_6132.JPG');
			return false;
		    });                                google.maps.event.addListener(marker32, 'mouseover', function() {
                                    marker32.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_6132.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker32, 'mouseout', function(){
                                    marker32.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker33 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(52.12455, -10.460241666666667),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_6845.JPG"});
		    google.maps.event.addListener(marker33, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_6845.JPG');
			return false;
		    });                                google.maps.event.addListener(marker33, 'mouseover', function() {
                                    marker33.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_6845.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker33, 'mouseout', function(){
                                    marker33.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker34 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(52.98005, -6.058755555555555),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_6890.JPG"});
		    google.maps.event.addListener(marker34, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_6890.JPG');
			return false;
		    });                                google.maps.event.addListener(marker34, 'mouseover', function() {
                                    marker34.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_6890.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker34, 'mouseout', function(){
                                    marker34.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker35 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.34306388888889, -6.259408333333333),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7179.JPG"});
		    google.maps.event.addListener(marker35, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_7179.JPG');
			return false;
		    });                                google.maps.event.addListener(marker35, 'mouseover', function() {
                                    marker35.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7179.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker35, 'mouseout', function(){
                                    marker35.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker36 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.347655555555555, -6.320386111111111),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7467.JPG"});
		    google.maps.event.addListener(marker36, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_7467.JPG');
			return false;
		    });                                google.maps.event.addListener(marker36, 'mouseover', function() {
                                    marker36.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7467.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker36, 'mouseout', function(){
                                    marker36.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker37 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.15089722222222, -6.333333333333333),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7517.JPG"});
		    google.maps.event.addListener(marker37, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_7517.JPG');
			return false;
		    });                                google.maps.event.addListener(marker37, 'mouseover', function() {
                                    marker37.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7517.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker37, 'mouseout', function(){
                                    marker37.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker38 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.114025, -6.2634944444444445),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7534.JPG"});
		    google.maps.event.addListener(marker38, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_7534.JPG');
			return false;
		    });                                google.maps.event.addListener(marker38, 'mouseover', function() {
                                    marker38.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7534.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker38, 'mouseout', function(){
                                    marker38.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker39 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(51.20882777777778, 3.2241444444444447),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7624.JPG"});
		    google.maps.event.addListener(marker39, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_7624.JPG');
			return false;
		    });                                google.maps.event.addListener(marker39, 'mouseover', function() {
                                    marker39.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7624.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker39, 'mouseout', function(){
                                    marker39.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker40 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.34422222222222, -6.2243),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_7931.JPG"});
		    google.maps.event.addListener(marker40, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_7931.JPG');
			return false;
		    });                                google.maps.event.addListener(marker40, 'mouseover', function() {
                                    marker40.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_7931.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker40, 'mouseout', function(){
                                    marker40.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker41 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.14610555555556, -6.210616666666667),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_8023.JPG"});
		    google.maps.event.addListener(marker41, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_8023.JPG');
			return false;
		    });                                google.maps.event.addListener(marker41, 'mouseover', function() {
                                    marker41.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_8023.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker41, 'mouseout', function(){
                                    marker41.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker42 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.38846111111111, -6.063938888888889),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_8489.JPG"});
		    google.maps.event.addListener(marker42, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_8489.JPG');
			return false;
		    });                                google.maps.event.addListener(marker42, 'mouseover', function() {
                                    marker42.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_8489.JPG',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker42, 'mouseout', function(){
                                    marker42.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker43 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.34241111111111, -6.263116666666667),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_8577.jpg"});
		    google.maps.event.addListener(marker43, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_8577.jpg');
			return false;
		    });                                google.maps.event.addListener(marker43, 'mouseover', function() {
                                    marker43.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_8577.jpg',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker43, 'mouseout', function(){
                                    marker43.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker44 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.340450000000004, -6.265555555555555),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_8578.jpg"});
		    google.maps.event.addListener(marker44, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_8578.jpg');
			return false;
		    });                                google.maps.event.addListener(marker44, 'mouseover', function() {
                                    marker44.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_8578.jpg',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker44, 'mouseout', function(){
                                    marker44.setIcon({
                                        url: 'resources\\assets\\img\\profile\\marker.png',
                                        scaledSize: new google.maps.Size(40,40),
                                        });
                                });
    marker45 = new google.maps.Marker({
	icon: ({ url: 'resources\\assets\\img\\profile\\marker.png',
	scaledSize: new google.maps.Size(40,40),}),
        position:new google.maps.LatLng(53.29325, -6.12953611111111),
        map:map,
        title:"C:\\Users\\emma.keyes\\eclipse-workspace\\FinalYearProject\\src\\main\\webapp\\resources\\assets\\img\\profile\\user_images\\IMG_8586.jpg"});
		    google.maps.event.addListener(marker45, 'click', function() {
			var winPop = window.open(this.href='photo?picPath=resources/assets/img/profile/user_images/IMG_8586.jpg');
			return false;
		    });                                google.maps.event.addListener(marker45, 'mouseover', function() {
                                    marker45.setIcon({
                                        url: 'resources\\assets\\img\\profile\\user_images\\IMG_8586.jpg',
                                        scaledSize: new google.maps.Size(150, 150),
                                    });
                                });google.maps.event.addListener(marker45, 'mouseout', function(){
                                    marker45.setIcon({
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
