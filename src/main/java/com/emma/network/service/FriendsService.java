package com.emma.network.service;

import java.util.ArrayList;

import com.emma.network.model.Friends;
import com.emma.network.model.UserAccount;

public interface FriendsService {

	ArrayList<Integer> getAllFriends(UserAccount user);

	ArrayList<Friends> getFriendsandRequests(UserAccount user);

	ArrayList<Integer> getFriendRequests(UserAccount user);

	ArrayList<Integer> getPendingRequests(UserAccount user);

	void sendFriendRequest(UserAccount user, int personId);

	void acceptRequest(UserAccount user, int personId);

	void unFriend(UserAccount user, int personId);

	boolean checkIfFriend(UserAccount user, int personId);
}
