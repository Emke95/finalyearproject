package com.emma.network.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.emma.network.dao.FriendsDao;
import com.emma.network.model.Friends;
import com.emma.network.model.UserAccount;
import com.emma.network.service.FriendsService;

@Service("friendsService")
@Transactional
public class FriendsServiceImpl implements FriendsService {
	
	@Autowired
	private FriendsDao dao;

	public ArrayList<Integer> getAllFriends(UserAccount user) {
		return dao.getAllFriends(user);
	}

	public ArrayList<Friends> getFriendsandRequests(UserAccount user) {
		return dao.getFriendsandRequests(user);
	}

	public ArrayList<Integer> getFriendRequests(UserAccount user) {
		return dao.getFriendRequests(user);
	}
	
	public ArrayList<Integer> getPendingRequests(UserAccount user) {
		return dao.getPendingRequests(user);
	}

	public void unFriend(UserAccount user, int personId) {
		dao.unFriend(user, personId);
	}

	public boolean checkIfFriend(UserAccount user, int personId) {
		ArrayList<Integer> friendIds = getAllFriends(user);
		for(int f : friendIds)
		{
			if(personId == f)
				return true;
		}
		
		return false;
	}

	public void acceptRequest(UserAccount user, int personId) {
		dao.acceptRequest(user, personId);
	}

	public void sendFriendRequest(UserAccount user, int personId) {
		dao.sendFriendRequest(user, personId);
	}

}
