package com.emma.network.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.emma.network.dao.PostsDao;
import com.emma.network.model.Posts;
import com.emma.network.model.UserAccount;
import com.emma.network.service.PostsService;

@Service("postsService")
@Transactional
public class PostsServiceImpl implements PostsService {

	@Autowired
	private PostsDao dao;
	
	public Posts getPost(UserAccount user, int postId) {
		return dao.getPost(user, postId);
	}

	public ArrayList<Posts> getFriendPosts(UserAccount user, ArrayList<Integer> friendList) {
		return dao.getFriendPosts(user, friendList);
	}

	public String getInfinitePosts(UserAccount user) {
		return dao.getInfinitePosts(user);
	}

	public ArrayList<Posts> getMyPosts(int personId) {
		return dao.getMyPosts(personId);
	}

	public void addPost(Posts post) {
		dao.addPost(post);
	}

	public int addLikes(int postId, UserAccount user) {
		return dao.addLikes(postId, user);
	}

	public String addComments(int postId, String comment, UserAccount user) {
		return dao.addComments(postId, comment, user);
	}

	public void addNotification(UserAccount user, String notification, Posts post) {
		dao.addNotification(user, notification, post);
	}

}
