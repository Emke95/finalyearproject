package com.emma.network.service;

import java.util.ArrayList;

import com.emma.network.model.Inbox;
import com.emma.network.model.Person;
import com.emma.network.model.UserAccount;

public interface InboxService {

	ArrayList<Integer> getUnreadMessages(UserAccount user);
	
	void markAsRead(UserAccount user);
	
	ArrayList<Integer> getAllMessageList(UserAccount user);
	
	String sendMessage(UserAccount user, Person person, String message);
	
	ArrayList<Inbox> getPersonMessages(UserAccount user, int personId);
}
