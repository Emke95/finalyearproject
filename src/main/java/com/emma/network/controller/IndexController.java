package com.emma.network.controller;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.emma.network.dao.FriendsDao;
import com.emma.network.dao.PhotoDao;
import com.emma.network.dao.PostsDao;
import com.emma.network.dao.UserDao;
import com.emma.network.model.Person;
import com.emma.network.model.Photo;
import com.emma.network.model.PhotoLocation;
import com.emma.network.model.Posts;
import com.emma.network.model.UserAccount;

@Controller
public class IndexController {

	@Autowired
	UserDao userDao;
	
	@Autowired
	PostsDao postDao;
	
	@Autowired
	PhotoDao photoDao;
	
	@Autowired
	FriendsDao friendDao;
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String getMap()
	{
		return "map";
	}
	

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String openProfile(@RequestParam("personId") int personId, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		boolean checkIfFriend = friendDao.checkIfFriend(user, personId);
		Person person = userDao.getPersonByIds(personId);
		
		ArrayList<Posts> postList = postDao.getMyPosts(personId);
		ArrayList<Photo> photoList = photoDao.getMyPhotos(personId);
		
		model.addAttribute("posts", postList);
		model.addAttribute("photos", photoList);
		model.addAttribute("person", person);
		model.addAttribute("checkIfFriend", checkIfFriend);
		return "profile";
	}
	
	@RequestMapping(value = "/infinite", method = RequestMethod.GET, produces = "application/text")
	public @ResponseBody String getInfiniteContent(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		String html = postDao.getInfinitePosts(user) + photoDao.getInfinitePhotos(user);
		
		return html;
	}
}
