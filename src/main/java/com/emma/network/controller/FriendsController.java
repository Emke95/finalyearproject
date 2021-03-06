
package com.emma.network.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.emma.network.dao.FriendsDao;
import com.emma.network.dao.InboxDao;
import com.emma.network.dao.NotificationDao;
import com.emma.network.dao.UserDao;
import com.emma.network.model.Notification;
import com.emma.network.model.Person;
import com.emma.network.model.UserAccount;

@Controller
public class FriendsController {

	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private FriendsDao friendDao;
	
	@Autowired
	private NotificationDao notificationDao;
	
	@Autowired
	private InboxDao inboxDao;
	
	
	@RequestMapping(value = "/friends", method = RequestMethod.GET)
	public String friends(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		model.addAttribute("user", user);
		ArrayList<Integer> friendIds = friendDao.getAllFriends(user); 
		
		ArrayList<Notification> notificationList = notificationDao.getUnseenNotifications(user);
		session.setAttribute("notificationCount", notificationList.size());
		model.addAttribute("notificationCount",notificationList.size());
		session.setAttribute("notificationList", notificationList);				
		model.addAttribute("notificationList",notificationList);
		
		ArrayList<Integer> personIds = inboxDao.getUnreadMessages(user);
		ArrayList<Person> personList1 = userDao.getPersonByIds(personIds);
		session.setAttribute("messageCount", String.valueOf(personList1.size()));
		model.addAttribute("messageCount", String.valueOf(personList1.size()));
		session.setAttribute("messageList", personList1);
		model.addAttribute("messageList", personList1);
		
		ArrayList<Integer> friendRequests = friendDao.getFriendRequests(user);

		session.setAttribute("requestCount", String.valueOf(friendRequests.size()));
		model.addAttribute("requestCount", String.valueOf(friendRequests.size()));
		
		session.setAttribute("requestList", friendRequests);
		model.addAttribute("requestList", friendRequests);
		
		session.setAttribute("friendsCount", String.valueOf(friendIds.size()));
		model.addAttribute("friendsCount", String.valueOf(friendIds.size()));
		
		if(friendIds.size() > 0)
		{
			ArrayList<Person> personList = userDao.getPersonByIds(friendIds);
			model.addAttribute("personList", personList);
		}
		return "friends";
		
	}
	
	@RequestMapping(value = "/friendRequests", method = RequestMethod.GET)
	public String friendRequests(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		
		ArrayList<Integer> friendRequests = friendDao.getFriendRequests(user); 
		
		session.setAttribute("requestCount", String.valueOf(friendRequests.size()));
		model.addAttribute("requestCount", String.valueOf(friendRequests.size()));
		session.setAttribute("requestList", friendRequests);
		model.addAttribute("requestList", friendRequests);
		
		if(friendRequests.size() > 0)
		{
			ArrayList<Person> personList = userDao.getPersonByIds(friendRequests);
			model.addAttribute("personList", personList);
		}
		return "friendRequests";
	}
	
	@RequestMapping(value = "/pendingRequests", method = RequestMethod.GET)
	public String pendingRequests(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		ArrayList<Integer> pendingRequests = friendDao.getPendingRequests(user); 
		
		ArrayList<Notification> notificationList = notificationDao.getUnseenNotifications(user);
		session.setAttribute("notificationCount", notificationList.size());
		model.addAttribute("notificationCount",notificationList.size());
		session.setAttribute("notificationList", notificationList);				
		model.addAttribute("notificationList",notificationList);
		
		ArrayList<Integer> friendRequests = friendDao.getFriendRequests(user);

		session.setAttribute("requestCount", String.valueOf(friendRequests.size()));
		model.addAttribute("requestCount", String.valueOf(friendRequests.size()));
		
		session.setAttribute("requestList", friendRequests);
		model.addAttribute("requestList", friendRequests);
		
		ArrayList<Integer> personIds = inboxDao.getUnreadMessages(user);
		ArrayList<Person> personList1 = userDao.getPersonByIds(personIds);
		session.setAttribute("messageCount", String.valueOf(personList1.size()));
		model.addAttribute("messageCount", String.valueOf(personList1.size()));
		session.setAttribute("messageList", personList1);
		model.addAttribute("messageList", personList1);
		
		session.setAttribute("pendingCount", String.valueOf(pendingRequests.size()));
		model.addAttribute("pendingCount", String.valueOf(pendingRequests.size()));
	
		
		if(pendingRequests.size() > 0)
		{
			ArrayList<Person> personList = userDao.getPersonByIds(pendingRequests);
			model.addAttribute("personList", personList);
		}
		return "pendingRequests";
	}
	
	@RequestMapping(value = "/sendRequest", method = RequestMethod.POST)
	public String sendRequest(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		String personId = (String) request.getParameter("personId");
		friendDao.sendFriendRequest(user, Integer.parseInt(personId));
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/acceptRequest", method = RequestMethod.POST)
	public String acceptRequest(@RequestParam("personId") String personId, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		friendDao.acceptRequest(user, Integer.parseInt(personId));
		return "redirect:/friendRequests";
	}
	
	@RequestMapping(value = "/unFriend", method = RequestMethod.POST)
	public String delete(@RequestParam("personId") String personId, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		friendDao.unFriend(user, Integer.parseInt(personId));
		return "redirect:/index";
	}
}
