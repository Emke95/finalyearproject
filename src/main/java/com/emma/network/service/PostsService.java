package com.emma.network.service;

import java.util.ArrayList;

import com.emma.network.model.Posts;
import com.emma.network.model.UserAccount;

public interface PostsService {
	
	Posts getPost(UserAccount user, int postId);
	
	ArrayList<Posts> getFriendPosts(UserAccount user, ArrayList<Integer> friendList);
	
	String getInfinitePosts(UserAccount user);
	
	ArrayList<Posts> getMyPosts(int personId);
	
	void addPost(Posts post);
	
	int addLikes(int postId, UserAccount user);
	
	String addComments(int postId, String comment, UserAccount user);
	
	void addNotification(UserAccount user, String notification, Posts post);
	
	
}
