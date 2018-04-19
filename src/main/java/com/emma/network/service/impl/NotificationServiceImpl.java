package com.emma.network.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.emma.network.dao.NotificationDao;
import com.emma.network.model.Notification;
import com.emma.network.model.UserAccount;
import com.emma.network.service.NotificationService;

@Service("notificationService")
@Transactional
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationDao dao;
	
	public ArrayList<Notification> getUnseenNotifications(UserAccount user) {
		return dao.getUnseenNotifications(user);
	}

	public void markAsRead(UserAccount user) {
		dao.markAsRead(user);
	}

}
