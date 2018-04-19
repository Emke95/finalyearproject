package com.emma.network.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.emma.network.dao.InboxDao;
import com.emma.network.model.Inbox;
import com.emma.network.model.Person;
import com.emma.network.model.UserAccount;
import com.emma.network.service.InboxService;

@Service("inboxService")
@Transactional
public class InboxServiceImpl implements InboxService {

	@Autowired
	private InboxDao dao;
	
	public ArrayList<Integer> getUnreadMessages(UserAccount user) {
		return dao.getUnreadMessages(user);
	}

	public void markAsRead(UserAccount user) {
		dao.markAsRead(user);
	}

	public ArrayList<Integer> getAllMessageList(UserAccount user) {
		return dao.getAllMessageList(user);
	}

	public String sendMessage(UserAccount user, Person person, String message) {
		return dao.sendMessage(user, person, message);
	}

	public ArrayList<Inbox> getPersonMessages(UserAccount user, int personId) {
		return dao.getPersonMessages(user, personId);
	}
}
