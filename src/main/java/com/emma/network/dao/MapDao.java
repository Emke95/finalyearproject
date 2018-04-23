package com.emma.network.dao;

import java.io.File;
import java.io.FileFilter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collection;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.lang.GeoLocation;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.GpsDirectory;
import com.emma.network.model.PhotoLocation;

public class MapDao extends DAO {

	public void addToMap() throws ImageProcessingException, IOException {

		String dir = "C:/Users/emma.keyes/eclipse-workspace/FinalYearProject/src/main/webapp/resources/assets/img/profile/user_images";
		FileOutputStream fos = null;
		File filepath = new File("C:/Users/emma.keyes/eclipse-workspace/FinalYearProject/src/main/webapp/WEB-INF/views/map.jsp");

		if (!filepath.exists()) 
		{
			filepath.createNewFile();
		}

		fos = new FileOutputStream(filepath);
		PrintStream ps= new PrintStream(fos);

		File path = new File(dir);
		final String[] acceptedExtensions = new String[] { ".jpg", ".jpeg",".png" };
		final File[] files = path.listFiles(new FileFilter()
		{
			public boolean accept(final File file) 
			{
				if (file.isDirectory())
					return false;
				for (String extension : acceptedExtensions) {
					if (file.getName().toLowerCase().endsWith(extension))
						return true;
				}
				return false;
			}
		});
		if (files == null)
		{
			System.err.println("No matching files found.");
		}
		ArrayList<PhotoLocation> photoLocations = new ArrayList<PhotoLocation>();
		for (File file : files)
		{
			Metadata metadata = ImageMetadataReader.readMetadata(file);
			Collection<GpsDirectory> gpsDirectories = metadata.getDirectoriesOfType(GpsDirectory.class);
			for (GpsDirectory gpsDirectory : gpsDirectories) {
				GeoLocation geoLocation = gpsDirectory.getGeoLocation();
				if (geoLocation != null && !geoLocation.isZero()) {
					photoLocations.add(new PhotoLocation(geoLocation, file));
					break;
				}
			}
		}
		writeHtml(ps, photoLocations);
		System.out.println("PHOTOS ADDED TO MAP");
		ps.flush();
	}

	private static void writeHtml(PrintStream ps, Iterable<PhotoLocation> photoLocations)
	{
		ps.println("<!DOCTYPE html>\r\n" + 
				"<%@taglib uri=\"http://java.sun.com/jsp/jstl/core\" prefix=\"c\"%>\r\n" + 
				"    <%@taglib uri=\"http://www.springframework.org/tags/form\" prefix=\"form\"%>\r\n" + 
				"        <%@ include file=\"/WEB-INF/views/include/header.jsp\"%>\r\n" + 
				"            <html lang=\"en\">\r\n" + 
				"\r\n" + 
				"            <head>\r\n" + 
				"                <meta charset=\"utf-8\">\r\n" + 
				"                <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
				"            </head>\r\n" + 
				"\r\n" + 
				"            <body>\r\n" + 
				"                <section id=\"container\">\r\n" +
				"<a href=\"/TravelBug/index\" class=\"logo\"><b><font color=\"FF00CC\">TW</font></b></a>"+
				"                    <input id=\"pac-input\" class=\"controls\" type=\"text\" placeholder=\"Search Box\">\r\n" + 
				"                    <div id=\"map\">\r\n" + 
				"                        <script>\r\n" + 
				"                            function initMap() {\r\n" + 
				"                                var map = new google.maps.Map(document.getElementById('map'), {\r\n" + 
				"                                    zoom: 13,\r\n" + 
				"                                    center: {\r\n" + 
				"                                        lat: 53.3498,\r\n" + 
				"                                        lng: -6.2603\r\n" + 
				"                                    }\r\n" + 
				"                                });\r\n" + 
				"\r\n" + 
				"                                var marker;\r\n" + 
				"                                var options = {\r\n" + 
				"                                    zoom: 2,\r\n" + 
				"                                    mapTypeId: google.maps.MapTypeId.ROADMAP,\r\n" + 
				"                                    center: new google.maps.LatLng(0.0, 0.0)\r\n" + 
				"                                };\r\n" + 
				"\r\n" + 
				"                                var input = document.getElementById('pac-input');\r\n" + 
				"                                var searchBox = new google.maps.places.SearchBox(input);\r\n" + 
				"                                map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);\r\n" + 
				"\r\n" + 
				"                                map.addListener('bounds_changed', function() {\r\n" + 
				"                                    searchBox.setBounds(map.getBounds());\r\n" + 
				"                                });\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"                                var markers = [];\r\n" + 
				"\r\n" + 
				"                                searchBox.addListener('places_changed', function() {\r\n" + 
				"                                    var places = searchBox.getPlaces();\r\n" + 
				"\r\n" + 
				"                                    if (places.length == 0) {\r\n" + 
				"                                        return;\r\n" + 
				"                                    }\r\n" + 
				"\r\n" + 
				"                                    // Clear out the old markers.\r\n" + 
				"                                    markers.forEach(function(marker) {\r\n" + 
				"                                        marker.setMap(null);\r\n" + 
				"                                    });\r\n" + 
				"                                    markers = [];\r\n" + 
				"\r\n" + 
				"                                    var bounds = new google.maps.LatLngBounds();\r\n" + 
				"                                    places.forEach(function(place) {\r\n" + 
				"                                        if (!place.geometry) {\r\n" + 
				"                                            console.log(\"Returned place contains no geometry\");\r\n" + 
				"                                            return;\r\n" + 
				"                                        }\r\n" + 
				"                                        var icon = {\r\n" + 
				"                                            url: place.icon,\r\n" + 
				"                                            size: new google.maps.Size(71, 71),\r\n" + 
				"                                            origin: new google.maps.Point(0, 0),\r\n" + 
				"                                            anchor: new google.maps.Point(17, 34),\r\n" + 
				"                                            scaledSize: new google.maps.Size(25, 25)\r\n" + 
				"                                        };\r\n" + 
				"\r\n" + 
				"                                        // Create a marker for each place.\r\n" + 
				"                                        markers.push(new google.maps.Marker({\r\n" + 
				"                                            map: map,\r\n" + 
				"                                            icon: icon,\r\n" + 
				"                                            title: place.name,\r\n" + 
				"                                            position: place.geometry.location\r\n" + 
				"                                        }));\r\n" + 
				"\r\n" + 
				"                                        if (place.geometry.viewport) {\r\n" + 
				"                                            // Only geocodes have viewport.\r\n" + 
				"                                            bounds.union(place.geometry.viewport);\r\n" + 
				"                                        } else {\r\n" + 
				"                                            bounds.extend(place.geometry.location);\r\n" + 
				"                                        }\r\n" + 
				"                                    });\r\n" + 
				"                                    map.fitBounds(bounds);\r\n" + 
				"\r\n" + 
				"                                });");

		int count=0;
		int countM=0;
		int countL=0;
		int countN=0;
		int countC=0;
		for (PhotoLocation photoLocation : photoLocations)
		{
			count++; countL++; countM++; countN++; countC++;
			final String fullPath = photoLocation.file.getAbsoluteFile().toString().trim().replace("\\", "\\\\");
			final String imageName = photoLocation.file.getName();


			ps.println("    marker"+count +" = new google.maps.Marker({");
			ps.println("	icon: ({ url: 'resources\\\\assets\\\\img\\\\profile\\\\marker.png',");
			ps.println("	scaledSize: new google.maps.Size(40,40),}),");
			ps.println("        position:new google.maps.LatLng(" + photoLocation.location + "),");
			ps.println("        map:map,");
			ps.println("        title:\"" + fullPath + "\"});");
			ps.println("		    google.maps.event.addListener(marker"+countC+", 'click', function() {\r\n" + 
					"			var winPop = window.open(this.href=\'photo?picPath=resources/assets/img/profile/user_images/"+imageName+"');\r\n" + 
					"			return false;\r\n" + 
					"		    });"
					+ "                                google.maps.event.addListener(marker"+countM +", 'mouseover', function() {\r\n" + 
					"                                    marker"+countL +".setIcon({\r\n" + 
					"                                        url: 'resources\\\\assets\\\\img\\\\profile\\\\user_images\\\\"+imageName+"',\r\n" + 
					"                                        scaledSize: new google.maps.Size(150, 150),\r\n" + 
					"                                    });\r\n" + 
					"                                });"
					+ "google.maps.event.addListener(marker"+countN+", 'mouseout', function(){\r\n" + 
					"                                    marker"+countN+".setIcon({\r\n" + 
					"                                        url: 'resources\\\\assets\\\\img\\\\profile\\\\marker.png',\r\n" + 
					"                                        scaledSize: new google.maps.Size(40,40),\r\n" + 
					"                                        });\r\n" + 
					"                                });");
		}

		ps.println("				}");
		ps.println("			</script>"); 
		ps.println("		</div>"); 
		ps.println("	</section>"); 
		ps.println("	<script async defer"); 
		ps.println("		src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyA0suNjU_wX-qYG5YaGOvi34Nbt4lRLmBo&libraries=places&callback=initMap\">"); 
		ps.println("	</script>"); 
		ps.println("</body>"); 
		ps.println("</html>");
	}

}
