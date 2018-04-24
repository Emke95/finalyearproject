package com.emma.network.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.Email;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


@Entity
@Table(name = "Person")
public class Person {

	@Id	@GeneratedValue
	@Column(name = "PersonId")
	private int pId;
	
	@Column(name = "FirstName", nullable=false)
	private String firstName;
	
	@Column(name = "LastName", nullable=false)
	private String lastName;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "DateOfBirth", nullable=false)
	private Date dob;
	
	@Column(name = "Gender")
	private String gender;
	
	@Column(name = "Email")
	@Email
	private String email;
	
	private CommonsMultipartFile profilePic;
	
	@Column(name = "ProfilePicPath")
	private String profilePicPath;
	
	@OneToOne(cascade = CascadeType.ALL) 
	@JoinColumn(name="PersonId")
	private UserAccount userAccount;
	
	public String getProfilePicPath() {
		return profilePicPath;
	}
	public void setProfilePicPath(String profilePicPath) {
		this.profilePicPath = profilePicPath;
	}
	public CommonsMultipartFile getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(CommonsMultipartFile profilePic) {
		this.profilePic = profilePic;
	}
	
	public UserAccount getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(UserAccount userAccount) {
		this.userAccount = userAccount;
	}
	
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDob() {
		return dob;
	}
	public String getDobString() {
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		String date = df.format(dob);
		return date;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
