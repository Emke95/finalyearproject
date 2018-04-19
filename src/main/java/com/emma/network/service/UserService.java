package com.emma.network.service;

import java.util.ArrayList;

import com.emma.network.model.UserAccount;
import com.emma.network.model.Person;

public interface UserService {

	UserAccount loadUserByUserName(String username);

	UserAccount queryUserByNameAndPassword(String username, String password) throws Exception;

	void registerNewUsers(UserAccount user);

	//void editDetails(UserAccount user);

	//String searchAll(UserAccount user, String value, ArrayList<Friends> friendList);

	ArrayList<Person> getPersonByIds(ArrayList<Integer> personIds);

	void updateImage(int personId, String path);
}
