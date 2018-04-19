package com.emma.network.service;

import java.util.ArrayList;

import com.emma.network.model.Notification;
import com.emma.network.model.UserAccount;

public interface NotificationService {

	ArrayList<Notification> getUnseenNotifications(UserAccount user);
	
	void markAsRead(UserAccount user);
	
}
