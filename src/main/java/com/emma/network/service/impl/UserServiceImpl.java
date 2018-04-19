package com.emma.network.service.impl;

import java.util.ArrayList;

import org.apache.commons.lang.StringEscapeUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.emma.network.dao.HibernateUtil;
import com.emma.network.dao.UserDao;
import com.emma.network.model.Friends;
import com.emma.network.model.Person;
import com.emma.network.model.UserAccount;
import com.emma.network.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;

	public UserAccount loadUserByUserName(String username) {
		return dao.loadUserByUserName(username);
	}

	public UserAccount queryUserByNameAndPassword(String username, String password) throws Exception {
		UserAccount userAccount = dao.queryUserByNameAndPassword(username, password);
		return userAccount;
	}

	public void registerNewUsers(UserAccount user) {
		dao.registerNewUsers(user);
	}

	public void updateImage(int personId, String path) {
	dao.updateImage(personId, path);
	}

	public ArrayList<Person> getPersonByIds(ArrayList<Integer> personIds) {
		return dao.getPersonByIds(personIds);

	}

}
