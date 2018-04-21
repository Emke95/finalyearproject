package com.emma.network.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.drew.imaging.ImageProcessingException;
import com.emma.network.dao.FriendsDao;
import com.emma.network.dao.MapDao;
import com.emma.network.dao.PhotoDao;
import com.emma.network.dao.UserDao;
import com.emma.network.model.Photo;
import com.emma.network.model.UserAccount;

@Controller
public class PhotoController {

	@Autowired
	@Qualifier("photoDao")
	PhotoDao photoDao;

	@Autowired
	@Qualifier("userDao")
	UserDao userDao;

	@Autowired
	private MapDao mapDao;

	@Autowired
	private FriendsDao friendDao;
	
		@RequestMapping(value = "/testmap", method = RequestMethod.GET)
		public String testmap() {
			try {
				mapDao.addToMap();
			} catch (ImageProcessingException | IOException e) {
				e.printStackTrace();
			}
			return "redirect:/index";
		}

	@RequestMapping(value = "/photo/upload", method = RequestMethod.GET)
	public String showForm(ModelMap model) {

		Photo photo = new Photo(); 
		model.addAttribute("photo", photo);
		return "photo-upload";
	}
	@RequestMapping(value = "/photo/upload", method = RequestMethod.POST)
	public String handleUpload(Model model,  Photo photo, HttpServletRequest request) {
		try {

			HttpSession session = (HttpSession) request.getSession();
			UserAccount u = (UserAccount) session.getAttribute("user");
			String check = File.separator;
			String dir1 = check + "user_images";
			String dir = check + "user_images" + u.getPerson().getpId();
			File directory, directory1;

			String path1 = "C:/Users/emma.keyes/eclipse-workspace/FinalYearProject/src/main/webapp/resources/assets/img/profile";
			String path = "C:/Users/emma.keyes/eclipse-workspace/FinalYearProject/src/main/webapp/resources/assets/img/profile";
			path += dir1;
			path += dir;
			path1 +=dir1;

			directory1 = new File(path1);
			directory = new File(path);

			boolean temp1 = directory1.exists();
			boolean temp = directory.exists();
			if (!temp) {
				temp = directory.mkdir();
			}
			else if(!temp1) {
				temp1 = directory1.mkdir();	
			}
			if (temp) {
				CommonsMultipartFile photoInMemory = photo.getPic();
				//CommonsMultipartFile publicPhoto = photo.getPic2();

				String fileName = photoInMemory.getOriginalFilename();

				File publicFile = new File(directory1.getPath(), fileName);
				File localFile = new File(directory.getPath(), fileName);

				photoInMemory.transferTo(localFile);
				//publicPhoto.transferTo(publicFile);

				String fName = check + "images" + dir + check + fileName;
				photo.setFileName(fName);
				photo.setPicPath("resources/assets/img/profile/" + photo.getPic().getOriginalFilename());	
				System.out.println("File is stored at" + localFile.getPath());
				photo.setPerson(u.getPerson());
				photo.setUploadDate(new Date());

				photoDao.upload(photo);
				mapDao.addToMap();

				ArrayList<Integer> friendList = friendDao.getAllFriends(u);
				ArrayList<Photo> photoList = photoDao.getFriendPhotos(u, friendList);
				model.addAttribute("photos", photoList);

			} else {
				System.out.println("Failed to create directory!");
			}

		} catch (IllegalStateException e) {
			System.out.println("*** IllegalStateException: " + e.getMessage());
		} catch (IOException e) {
			System.out.println("*** IOException: " + e.getMessage());
		} catch (ImageProcessingException e) {
			e.printStackTrace();
		} 
		return "redirect:/index";
	}


	@RequestMapping(value = "/addPhotoLike", method = RequestMethod.GET, produces = "application/text")
	public @ResponseBody String like(@RequestParam("id") String id, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		int photoId = Integer.parseInt(id);
		int likes = photoDao.addPhotoLikes(photoId, user);
		return String.valueOf(likes);
	}

	@RequestMapping(value="/unLikePhoto", method = RequestMethod.GET, produces = "application/text")
	public @ResponseBody String unLike(@RequestParam("id") String id,HttpServletRequest request)	
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		int photoId = Integer.parseInt(id);
		int likes = photoDao.unLikePhoto(photoId, user);
		return String.valueOf(likes);
	}
	@RequestMapping(value = "/addPhotoComment", method = RequestMethod.GET, produces = "application/text")
	public @ResponseBody String comment(@RequestParam("id") String id, @RequestParam("comment") String comment, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		int photoId = Integer.parseInt(id);
		String html = photoDao.addPhotoComments(photoId, comment, user);
		return html;
	}
}
