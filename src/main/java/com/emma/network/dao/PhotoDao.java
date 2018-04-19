package com.emma.network.dao;

import java.util.ArrayList;
import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.lang.GeoLocation;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.GpsDirectory;

import java.io.File;
import java.io.FileFilter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Collection;
import java.util.Date;

import org.apache.commons.lang.StringEscapeUtils;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.emma.network.exception.PhotoException;
import com.emma.network.model.Comments;
import com.emma.network.model.Notification;
import com.emma.network.model.Photo;
import com.emma.network.model.PhotoLocation;
import com.emma.network.model.UserAccount;

public class PhotoDao extends DAO {

	private static int counter;
	private static ArrayList<Integer> friends;

	public PhotoDao() {

	}

	public ArrayList<Photo> getMyPhotos(int personId)
	{
		Query q = getSession().createQuery("from Photo where personid = :personId");
		q.setInteger("personId", personId);
		@SuppressWarnings("unchecked")
		ArrayList<Photo> photoList = (ArrayList<Photo>) q.list();
		return photoList;
	}


	public Photo getPhoto(UserAccount user, int photoId){
		Query q= getSession().createQuery("from Photo where photoId= :photoId");
		q.setInteger("personId", user.getuId());

		q.setInteger("photoId", photoId);
		Photo photo = (Photo) q.uniqueResult();
		return photo;
	} 

	public ArrayList<Photo> getFriendPhotos(UserAccount user, ArrayList<Integer> friendList)
	{
		friendList.add(user.getuId());
		Query query = getSession().createQuery("from Photo where personid in (:personid) order by uploaddate desc").setMaxResults(2);
		query.setParameterList("personid", friendList);
		@SuppressWarnings("unchecked")
		ArrayList<Photo> photoList = (ArrayList<Photo>) query.list();
		counter = 2;
		friends = friendList;
		return photoList;
	}

	public void upload(Photo p) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Transaction tran = session.beginTransaction();			
			System.out.println("inside DAO");

			session.save(p);
			tran.commit();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}

	}

	public void delete(Photo p) throws PhotoException {
		try {
			begin();
			getSession().delete(p);
			commit();
		} catch (HibernateException e) {
			rollback();
			throw new PhotoException("Could not delete photo ");
		}
	}

	public String addPhotoComments(int photoId, String comment, UserAccount user)
	{
		String safe_comment = StringEscapeUtils.escapeHtml(comment);
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query q = session.createQuery("from Photo where photoId =:photoId");
		q.setInteger("photoId", photoId);
		Photo photo = (Photo) q.uniqueResult();
		try {
			Comments c = new Comments();
			c.setComment(safe_comment);
			c.setPerson(user.getPerson());
			c.setDateOfComment(new Date());
			c.setPhoto(photo);
			photo.getComments().add(c);

			Transaction transaction = session.beginTransaction();

			session.update(photo);

			transaction.commit();
		} 
		catch(Exception e)
		{
			System.out.println("Could not PhotoDao");
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}

		String notification = user.getPerson().getFirstName()+ " " + user.getPerson().getLastName() + " commented on your photo";
		addNotification(user, notification, photo);


		String html = "<a href='profile.html'><img src='"+ user.getPerson().getProfilePicPath() + " 'width=20px class='img-circle pull-left' />" +
				"<h5>&nbsp; " + user.getPerson().getFirstName() + " " + user.getPerson().getLastName() + "</a></h5>" +
				"<p>" + comment + "</p>";
		return html;
	}

	public int addPhotoLikes(int photoId, UserAccount user)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query query = session.createQuery("from Photo where photoId = :photoId");
		query.setInteger("photoId", photoId);
		Photo photo =(Photo) query.uniqueResult();
		int likes = photo.getLikes() + 1;
		try {
			Transaction transaction = session.beginTransaction();
			photo.setLikes(likes);
			session.update(photo);
			transaction.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
		String notification = user.getPerson().getFirstName() + " " + user.getPerson().getLastName() + " liked your photo";
		addNotification(user, notification, photo);
		return likes;
	}

	public String getInfinitePhotos(UserAccount user)
	{
		Query query = getSession().createQuery("from Photo where personid in (:personid) order by uploaddate desc").setFirstResult(counter).setMaxResults(2);
		query.setParameterList("personid", friends);
		counter += 2;
		StringBuilder html = new StringBuilder();
		StringBuilder comments;

		@SuppressWarnings("unchecked")
		ArrayList<Photo> photoList = (ArrayList<Photo>) query.list();
		for(Photo photo : photoList)
		{
			comments = new StringBuilder();
			for(Comments c : photo.getComments())
			{
				comments.append("<a href='profile?personId="+ c.getPerson().getpId() + "'><img src='" + c.getPerson().getProfilePicPath() + "' width=20px class='img-circle pull-left' />" +
						"<h5>&nbsp; " + c.getPerson().getFirstName() + " " + c.getPerson().getLastName() + "</a></h5>" +
						"<p>" + c.getComment() + "</p>");
			}
			html.append("<div class='row mtpost'>" +
					"<div class='form-panel'>" +
					"<a href='profile.html'><img src='" + photo.getPerson().getProfilePicPath() + "' width=40px class='img-circle pull-left' />" +
					"<h4>&nbsp; " + photo.getPerson().getFirstName() + " " + photo.getPerson().getLastName() +"</a></h4><br/>" +
					"<p>" + photo.getPic() + "</p>" +
					"<p><button class='submitLink addPhotoLike class='fa fa-thumbs-up'></i> Like</button><span class='like'>" + photo.getLikes() + "</span></p>" +
					"<div class='postEnd commentSection'>" +
					comments +
					"</div>" + 
					"<div class='form-group'>" + 
					"<input type='text' class='form-control form-post comment' name='comment' placeholder='Comment' />" +
					"</div>" +
					"<button type='submit' class='addComment btn btn-theme btn-xs'>Comment</button> <hidden name= 'hidden' value='" +  photo.getPhotoId() +"' />" +
					"</div><!-- /col-lg-9 -->" +
					"</div><input type='hidden' id='hiddenId' value='" + photo.getPhotoId() +"' /><!-- /row -->");
		}
		return html.toString();
	}

	public void addNotification(UserAccount user, String notification, Photo photo)
	{
		Session session = HibernateUtil.getSessionFactory().openSession();
		try
		{
			Notification n = new Notification();
			n.setFromUser(user.getPerson());
			n.setToUser(photo.getPerson());
			n.setNotification(notification);
			n.setSeen(false);
			n.setPhoto(photo);
			photo.getNotifications().add(n);

			Transaction transaction = session.beginTransaction();
			session.save(n);
			transaction.commit();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			session.close();
		}
	}

	public void addToMap() throws ImageProcessingException, IOException {
		
		String dir = "resources/assets/img/profile/user_images";
		FileOutputStream fos = null;
		File filepath = new File("WEB-INF/views/map.jsp");

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
		for (PhotoLocation photoLocation : photoLocations)
		{
			count++; countL++; countM++;
			final String fullPath = photoLocation.file.getAbsoluteFile().toString().trim().replace("\\", "\\\\");
			final String imageName = photoLocation.file.getName();

			
			ps.println("    marker"+count +" = new google.maps.Marker({");
			ps.println("        position:new google.maps.LatLng(" + photoLocation.location + "),");
			ps.println("        map:map,");
			ps.println("        title:\"" + fullPath + "\"});");
					ps.println("                                google.maps.event.addListener(marker"+countM +", 'mouseover', function() {\r\n" + 
					"                                    marker"+countL +".setIcon({\r\n" + 
					"                                        url: 'resources\\\\assets\\\\img\\\\profile\\\\user_images\\\\"+imageName+"',\r\n" + 
					"                                        scaledSize: new google.maps.Size(150, 200),\r\n" + 
					"                                    });\r\n" + 
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
}

