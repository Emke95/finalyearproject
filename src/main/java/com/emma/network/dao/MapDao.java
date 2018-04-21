package com.emma.network.dao;

import java.io.File;
import java.io.FileFilter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collection;

import org.hibernate.Query;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.lang.GeoLocation;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.GpsDirectory;
import com.emma.network.model.PhotoLocation;

public class MapDao extends DAO {

	public void addToMap() throws ImageProcessingException, IOException {

		//		Query q = getSession().createQuery("from Photo where personid = :personId");
		//		q.setInteger("personId", personId);

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
				"                    <div id=\"map\">\r\n" + 
				"                        <script>\r\n" + 
				"                            var marker;\r\n" + 
				"                            var options = {\r\n" + 
				"                                zoom: 2,\r\n" + 
				"                                mapTypeId: google.maps.MapTypeId.ROADMAP,\r\n" + 
				"                                center: new google.maps.LatLng(0.0, 0.0)\r\n" + 
				"                            };\r\n" + 
				"                            var map = new google.maps.Map(document.getElementById('map_canvas'), options);\r\n" + 
				"                            var marker;\r\n" + 
				"\r\n" + 
				"                            function initMap() {\r\n" + 
				"                                var map = new google.maps.Map(document.getElementById('map'), {\r\n" + 
				"                                    zoom: 13,\r\n" + 
				"                                    center: {\r\n" + 
				"                                        lat: 53.3498,\r\n" + 
				"                                        lng: -6.2603\r\n" + 
				"                                    }\r\n" + 
				"                                });");

		int count=0;
		int countM=0;
		int countL=0;
		int countN=0;
		for (PhotoLocation photoLocation : photoLocations)
		{
			count++; countL++; countM++; countN++;
			final String fullPath = photoLocation.file.getAbsoluteFile().toString().trim().replace("\\", "\\\\");
			final String imageName = photoLocation.file.getName();


			ps.println("    marker"+count +" = new google.maps.Marker({");
			ps.println("	icon: ({ url: 'resources\\\\assets\\\\img\\\\profile\\\\marker.png',");
			ps.println("	scaledSize: new google.maps.Size(40,40),}),");
			ps.println("        position:new google.maps.LatLng(" + photoLocation.location + "),");
			ps.println("        map:map,");
			ps.println("        title:\"" + fullPath + "\"});");
			ps.println("                                google.maps.event.addListener(marker"+countM +", 'mouseover', function() {\r\n" + 
					"                                    marker"+countL +".setIcon({\r\n" + 
					"                                        url: 'resources\\\\assets\\\\img\\\\profile\\\\user_images\\\\"+imageName+"',\r\n" + 
					"                                        scaledSize: new google.maps.Size(150, 200),\r\n" + 
					"                                    });\r\n" + 
					"                                });"
					+ "google.maps.event.addListener(marker"+countN+", 'mouseout', function(){\r\n" + 
					"                                    marker"+countN+".setIcon({\r\n" + 
					"                                        url: 'resources\\\\assets\\\\img\\\\profile\\\\marker.png',\r\n" + 
					"                                        scaledSize: new google.maps.Size(40,40),\r\n" + 
					"                                        });\r\n" + 
					"                                });");
		}

		ps.println("}");
		ps.println("			</script>"); 
		ps.println("		</div>"); 
		ps.println("	</section>"); 
		ps.println("	<script async defer"); 
		ps.println("		src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyA0suNjU_wX-qYG5YaGOvi34Nbt4lRLmBo&callback=initMap\">"); 
		ps.println("	</script>"); 
		ps.println("</body>"); 
		ps.println("</html>");
	}

	//	private void writeHtml(PrintStream ps, Iterable<PhotoLocation> photoLocations)
	//	{
	//
	//		ps.println("<!DOCTYPE html>"); 
	//		ps.println("<%@taglib uri=\"http://java.sun.com/jsp/jstl/core\" prefix=\"c\"%>"); 
	//		ps.println("    <%@taglib uri=\"http://www.springframework.org/tags/form\" prefix=\"form\"%>"); 
	//		ps.println("        <%@ include file=\"/WEB-INF/views/include/header.jsp\"%>"); 
	//		ps.println("            <html lang=\"en\">"); 
	//		ps.println("            <head>"); 
	//		ps.println("                <meta charset=\"utf-8\">"); 
	//		ps.println("                <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
	//		ps.println("            </head>"); 
	//		ps.println("            <body>"); 
	//		ps.println("                <section id=\"container\">");
	//		ps.println("                    <div id=\"map\">"); 
	//		ps.println("                        <script>"); 
	//		ps.println("                            var marker;"); 
	//		ps.println("                            var options = {"); 
	//		ps.println("                                zoom: 2,"); 
	//		ps.println("                                mapTypeId: google.maps.MapTypeId.ROADMAP,"); 
	//		ps.println("                                center: new google.maps.LatLng(0.0, 0.0)"); 
	//		ps.println("                            };"); 
	//		ps.println("                            var map = new google.maps.Map(document.getElementById('map_canvas'), options);"); 
	//		ps.println("                            var marker;"); 
	//		ps.println("                            function initMap() {"); 
	//		ps.println("                                var map = new google.maps.Map(document.getElementById('map'), {");
	//		ps.println("                                    zoom: 13,");
	//		ps.println("                                   center: {");
	//		ps.println("                                        lat: 53.3498,"); 
	//		ps.println("                                        lng: -6.2603"); 
	//		ps.println("                                    }"); 
	//		ps.println("                                });");
	//
	//
	//		int count=0;
	//		int countM=0;
	//		int countL=0;
	//		for (PhotoLocation photoLocation : photoLocations)
	//		{
	//			count++; countL++; countM++;
	//			final String fullPath = photoLocation.file.getAbsoluteFile().toString().trim().replace("\\", "\\\\");
	//			final String imageName = photoLocation.file.getName();
	//
	//
	//			ps.println("    marker"+count +" = new google.maps.Marker({");
	//			ps.println("        position:new google.maps.LatLng(" + photoLocation.location + "),");
	//			ps.println("        map:map,");
	//			ps.println("		icon:image,");
	//			ps.println("        title:\"" + fullPath + "\"});");
	//			ps.println("                                google.maps.event.addListener(marker"+countM +", 'mouseover', function() {"); 
	//			ps.println("                                    marker"+countL +".setIcon({"); 
	//			ps.println("                                        url: 'resources\\\\assets\\\\img\\\\profile\\\\user_images\\\\"+imageName+"',"); 
	//			ps.println("                                        scaledSize: new google.maps.Size(150, 200),"); 
	//			ps.println("                                    });"); 
	//			ps.println("                                });");
	//		}
	//
	//		ps.println("}");
	//		ps.println("			</script>"); 
	//		ps.println("		</div>"); 
	//		ps.println("	</section>"); 
	//		ps.println("	<script async defer"); 
	//		ps.println("		src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyA0suNjU_wX-qYG5YaGOvi34Nbt4lRLmBo&callback=initMap\">"); 
	//		ps.println("	</script>"); 
	//		ps.println("</body>"); 
	//		ps.println("</html>");
	//	}

	//	public void addFriendsToMap() throws ImageProcessingException, IOException {
	//
	//		int id = 0;
	//		String dir = "C:/Users/emma.keyes/eclipse-workspace/FinalYearProject/src/main/webapp/resources/assets/img/profile/user_images"+ id;
	//		FileOutputStream fos = null;
	//		File filepath = new File("C:/Users/emma.keyes/eclipse-workspace/FinalYearProject/src/main/webapp/WEB-INF/views/mapfriends.jsp");
	//
	//		if (!filepath.exists()) 
	//		{
	//			filepath.createNewFile();
	//		}
	//		fos = new FileOutputStream(filepath);
	//		PrintStream ps= new PrintStream(fos);
	//
	//		File path = new File(dir);
	//		final String[] acceptedExtensions = new String[] { ".jpg", ".jpeg",".png" };
	//		final File[] files = path.listFiles(new FileFilter()
	//		{
	//			public boolean accept(final File file) 
	//			{
	//				if (file.isDirectory())
	//					return false;
	//				for (String extension : acceptedExtensions) {
	//					if (file.getName().toLowerCase().endsWith(extension))
	//						return true;
	//				}
	//				return false;
	//			}
	//		});
	//		if (files == null)
	//		{
	//			System.err.println("No matching files found.");
	//		}
	//		ArrayList<PhotoLocation> photoLocations = new ArrayList<PhotoLocation>();
	//		for (File file : files)
	//		{
	//			Metadata metadata = ImageMetadataReader.readMetadata(file);
	//			Collection<GpsDirectory> gpsDirectories = metadata.getDirectoriesOfType(GpsDirectory.class);
	//			for (GpsDirectory gpsDirectory : gpsDirectories) {
	//				GeoLocation geoLocation = gpsDirectory.getGeoLocation();
	//				if (geoLocation != null && !geoLocation.isZero()) {
	//					photoLocations.add(new PhotoLocation(geoLocation, file));
	//					break;
	//				}
	//			}
	//		}
	//		writeHtmlUserId(ps, photoLocations);
	//		System.out.println("PHOTOS ADDED TO MAP");
	//		ps.flush();
	//	}

	//	private void writeHtmlUserId(PrintStream ps, Iterable<PhotoLocation> photoLocations)
	//	{
	//		ps.println("<!DOCTYPE html>"); 
	//		ps.println("<%@taglib uri=\"http://java.sun.com/jsp/jstl/core\" prefix=\"c\"%>"); 
	//		ps.println("    <%@taglib uri=\"http://www.springframework.org/tags/form\" prefix=\"form\"%>"); 
	//		ps.println("        <%@ include file=\"/WEB-INF/views/include/header.jsp\"%>"); 
	//		ps.println("            <html lang=\"en\">"); 
	//		ps.println("            <head>"); 
	//		ps.println("                <meta charset=\"utf-8\">"); 
	//		ps.println("                <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
	//		ps.println("            </head>"); 
	//		ps.println("            <body>"); 
	//		ps.println("                <section id=\"container\">");
	//		ps.println("                    <div id=\"map\">"); 
	//		ps.println("                        <script>"); 
	//		ps.println("                            var marker;"); 
	//		ps.println("                            var options = {"); 
	//		ps.println("                                zoom: 2,"); 
	//		ps.println("                                mapTypeId: google.maps.MapTypeId.ROADMAP,"); 
	//		ps.println("                                center: new google.maps.LatLng(0.0, 0.0)"); 
	//		ps.println("                            };"); 
	//		ps.println("                            var map = new google.maps.Map(document.getElementById('map_canvas'), options);"); 
	//		ps.println("                            var marker;"); 
	//		ps.println("                            function initMap() {"); 
	//		ps.println("                                var map = new google.maps.Map(document.getElementById('map'), {");
	//		ps.println("                                    zoom: 13,");
	//		ps.println("                                   center: {");
	//		ps.println("                                        lat: 53.3498,"); 
	//		ps.println("                                        lng: -6.2603"); 
	//		ps.println("                                    }"); 
	//		ps.println("                                });");
	//
	//		int count=0;
	//		int countM=0;
	//		int countL=0;
	//		for (PhotoLocation photoLocation : photoLocations)
	//		{
	//			count++; countL++; countM++;
	//			final String fullPath = photoLocation.file.getAbsoluteFile().toString().trim().replace("\\", "\\\\");
	//			final String imageName = photoLocation.file.getName();
	//
	//
	//			ps.println("    marker"+count +" = new google.maps.Marker({");
	//			ps.println("        position:new google.maps.LatLng(" + photoLocation.location + "),");
	//			ps.println("        map:map,");
	//			ps.println("        title:\"" + fullPath + "\"});");
	//			ps.println("                                google.maps.event.addListener(marker"+countM +", 'mouseover', function() {"); 
	//			ps.println("                                    marker"+countL +".setIcon({"); 
	//			ps.println("                                        url: 'resources\\\\assets\\\\img\\\\profile\\\\user_images\\\\"+imageName+"',"); 
	//			ps.println("                                       scaledSize: new google.maps.Size(150, 200),"); 
	//			ps.println("                                    });"); 
	//			ps.println("                                });");
	//		}
	//
	//		ps.println("}");
	//		ps.println("			</script>"); 
	//		ps.println("		</div>"); 
	//		ps.println("	</section>"); 
	//		ps.println("	<script async defer"); 
	//		ps.println("		src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyA0suNjU_wX-qYG5YaGOvi34Nbt4lRLmBo&callback=initMap\">"); 
	//		ps.println("	</script>"); 
	//		ps.println("</body>"); 
	//		ps.println("</html>");
	//	}
	//
	//	public void addToPublicMap() {
	//		// TODO Auto-generated method stub
	//		
	//	}

}
