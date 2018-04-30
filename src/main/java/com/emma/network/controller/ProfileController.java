package com.emma.network.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.emma.network.dao.FriendsDao;
import com.emma.network.dao.PhotoDao;
import com.emma.network.dao.PostsDao;
import com.emma.network.dao.UserDao;
import com.emma.network.model.Friends;
import com.emma.network.model.Person;
import com.emma.network.model.Photo;
import com.emma.network.model.Posts;
import com.emma.network.model.UserAccount;


@Controller
public class ProfileController {

private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	PostsDao postDao;
	
	@Autowired
	PhotoDao photoDao;
	
	@Autowired
	FriendsDao friendDao;

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String openProfile(@RequestParam("personId") int personId, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		boolean checkIfFriend = friendDao.checkIfFriend(user, personId);
		boolean checkIfNotFriend = friendDao.checkIfNotFriend(user, personId);
		Person person = userDao.getPersonByIds(personId);
		
		ArrayList<Posts> postList = postDao.getMyPosts(personId);
		ArrayList<Photo> photoList = photoDao.getMyPhotos(personId);
		
		model.addAttribute("posts", postList);
		model.addAttribute("photos", photoList);
		model.addAttribute("person", person);		
		model.addAttribute("checkIfNotFriend", checkIfNotFriend);
		model.addAttribute("checkIfFriend", checkIfFriend);
		return "profile";
	}
	
	
	@RequestMapping(value = "/editDetails", method = RequestMethod.POST)
	public String editDetails(Model model, UserAccount user, Person person, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount ua = (UserAccount) session.getAttribute("user");
		ua.setUsername(user.getUsername());
		ua.setPerson(person);
		try {
		userDao.editDetails(ua);
		}
		catch (IllegalStateException e) {
			e.printStackTrace();
		}
		return "redirect:/profile?personId=" + ua.getuId();
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateProfilePic(Model model, Person person, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount ua = (UserAccount) session.getAttribute("user");
		System.out.println("profilepictest");
		File localFile = new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\tmpFiles", person.getProfilePic().getOriginalFilename());
		try {
			person.getProfilePic().transferTo(localFile);
			ua.getPerson().setProfilePicPath("resources/assets/img/profile/" + person.getProfilePic().getOriginalFilename());
			ua.setPerson(ua.getPerson());
			userDao.updateImage(ua.getuId(), ua.getPerson().getProfilePicPath());
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:/profile?personId=" + ua.getuId();
	}
	
	
}
