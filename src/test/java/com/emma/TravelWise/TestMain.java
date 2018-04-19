package com.emma.TravelWise;

import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.emma.network.dao.HibernateUtil;
import com.emma.network.model.Person;
import com.emma.network.model.UserAccount;

public class TestMain {
	public static void main(String args[])
	{
		Session session = HibernateUtil.getSessionFactory().openSession();

		Transaction t = session.beginTransaction();
		
		// create person
		Person josh = new Person();
		josh.setFirstName("Josh");
		josh.setLastName("Kerry");
		josh.setGender("Male");
		josh.setEmail("josh@gmail.com");
		josh.setDob(new Date(1990-10-04));

		// create user account
		UserAccount userJosh = new UserAccount();
		userJosh.setUsername("joshkerry");
		userJosh.setPassword("password");
		userJosh.setPerson(josh);

		session.save(userJosh);

		t.commit();
		session.close();
		System.out.println("success");
	}
}
