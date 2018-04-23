package com.emma.network.dao;

import java.util.ArrayList;
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

	public Photo getPhotoById(int photoId) {
	Photo photo = null;
	try
	{
		Query q = getSession().createQuery("from Photo where photoId = :photoId");
		q.setInteger("photoId", photoId);
		photo = (Photo) q.uniqueResult();	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return photo;
	}

	public Photo getPhoto(UserAccount user, int photoId){
		Query q= getSession().createQuery("from Photo where photoId = :photoId and personId = :personId");
		
		q.setInteger("personId", user.getPerson().getpId());
		q.setInteger("photoId", photoId);
		Photo photo = (Photo) q.uniqueResult();
		return photo;
	} 
	
	public Photo getPhotoPath(UserAccount user, String picPath){
		Query q= getSession().createQuery("from Photo where picPath = :picPath");
		q.setString("picPath", picPath);
		Photo photo = (Photo) q.uniqueResult();
		return photo;
	} 

	public ArrayList<Photo> getFriendPhotos(UserAccount user, ArrayList<Integer> friendList)
	{
		friendList.add(user.getuId());
		Query query = getSession().createQuery("from Photo where personid in (:personid) order by uploaddate desc").setMaxResults(200);
		query.setParameterList("personid", friendList);
		@SuppressWarnings("unchecked")
		ArrayList<Photo> photoList = (ArrayList<Photo>) query.list();
		counter = 200;
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
	
	public int unLikePhoto(int photoId, UserAccount user) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query query = session.createQuery("from Photo where photoId = :photoId");
		query.setInteger("photoId", photoId);
		Photo photo =(Photo) query.uniqueResult();
		int likes = photo.getLikes() - 1;
		if (photo.getLikes() < 0) {
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
		}
		else
			System.out.println("photo has no likes");
		
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
					"<p><button class='submitLink addPhotoLike class='fa fa-thumbs-up'></i> Like</button><span class='like'>	<button class=\"submitLink unLikePhoto\">\r\n" + 
					"											<i class=\"fa fa-thumbs-down\"></i> unlike\r\n" + 
					"										</button>" + photo.getLikes() + "</span></p>" +
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
}

