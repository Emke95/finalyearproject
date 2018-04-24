package com.emma.network.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.emma.network.dao.FriendsDao;
import com.emma.network.dao.InboxDao;
import com.emma.network.dao.NotificationDao;
import com.emma.network.dao.PhotoDao;
import com.emma.network.dao.PostsDao;
import com.emma.network.dao.UserDao;
import com.emma.network.model.Friends;
import com.emma.network.model.Notification;
import com.emma.network.model.Person;
import com.emma.network.model.Photo;
import com.emma.network.model.Posts;
import com.emma.network.model.UserAccount;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	@Autowired
	private UserDao userDao;

	@Autowired
	private PostsDao postDao;

	@Autowired
	private FriendsDao friendDao;

	@Autowired
	private NotificationDao notificationDao;

	@Autowired
	private InboxDao inboxDao;

	@Autowired
	private PhotoDao photoDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		UserAccount userAccount = new UserAccount();
		model.addAttribute("userAccount", userAccount);
		return "login";
	}

	@RequestMapping(value = "/index", method = RequestMethod.POST)
	public String login(Model model, @Valid UserAccount user, BindingResult result, HttpServletRequest request)
	{
		if(result.hasErrors()){
			return "login";		
		}
		else{
			try {
				UserAccount ua = userDao.queryUserByNameAndPassword(user.getUsername(), user.getPassword());
				if(ua != null)
				{
					model.addAttribute("userAccount", ua);
					HttpSession session = request.getSession();
					session.setAttribute("user", ua);

					ArrayList<Integer> friendList = friendDao.getAllFriends(ua);
					ArrayList<Posts> postList = postDao.getFriendPosts(ua, friendList);
					ArrayList<Photo> photoList = photoDao.getFriendPhotos(ua, friendList);
					model.addAttribute("posts", postList);
					model.addAttribute("photos", photoList);

					session.setAttribute("postCount", postList.size());
					model.addAttribute("postCount", postList.size());
					
					session.setAttribute("photoCount", photoList.size());
					model.addAttribute("photoCount", photoList.size());
					
					ArrayList<Notification> notificationList = notificationDao.getUnseenNotifications(ua);

					session.setAttribute("notificationCount", notificationList.size());
					model.addAttribute("notificationCount",notificationList.size());

					session.setAttribute("notificationList", notificationList);				
					model.addAttribute("notificationList",notificationList);

					ArrayList<Integer> personIds = inboxDao.getUnreadMessages(ua);
					ArrayList<Person> personList = userDao.getPersonByIds(personIds);

					session.setAttribute("messageCount", String.valueOf(personList.size()));
					session.setAttribute("messageList", personList);

					ArrayList<Integer> friendRequests = friendDao.getFriendRequests(ua);

					session.setAttribute("requestCount", String.valueOf(friendRequests.size()));
					model.addAttribute("requestCount", String.valueOf(friendRequests.size()));

					session.setAttribute("requestList", friendRequests);
					model.addAttribute("requestList", friendRequests);

					return "index";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "login";
		}
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String openIndex(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount ua = (UserAccount) session.getAttribute("user");

		ArrayList<Integer> friendList = friendDao.getAllFriends(ua);
		ArrayList<Posts> postList = postDao.getFriendPosts(ua, friendList);
		ArrayList<Photo> photoList = photoDao.getFriendPhotos(ua, friendList);

		model.addAttribute("photos", photoList);
		model.addAttribute("posts", postList);

		ArrayList<Notification> notificationList = notificationDao.getUnseenNotifications(ua);
		session.setAttribute("notificationCount", String.valueOf(notificationList.size()));
		session.setAttribute("notificationList", notificationList);

		ArrayList<Integer> personIds = inboxDao.getUnreadMessages(ua);
		ArrayList<Person> personList = userDao.getPersonByIds(personIds);

		session.setAttribute("messageCount", String.valueOf(personList.size()));
		session.setAttribute("messageList", personList);

		return "index";
	}


	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerNewUsers(Model model, UserAccount user, Person person, HttpServletRequest request)
	{
		user.setPerson(person);
		userDao.registerNewUsers(user);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		return "redirect:/index";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/uniqueUsername", method = RequestMethod.GET, produces = "application/text")
	public @ResponseBody String uniqueUsername(@RequestParam("username") String username)
	{
		UserAccount user = userDao.loadUserByUserName(username);
		if(user != null)
		{
			return "false";
		}
		return "true";
	}

}
