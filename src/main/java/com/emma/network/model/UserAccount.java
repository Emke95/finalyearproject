
package com.emma.network.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "UserAccount")
public class UserAccount {

	public enum Role {
		USER, ADMIN
	}
	@Id	@GeneratedValue(generator="newGenerator")
	@GenericGenerator(name="newGenerator", strategy="foreign",parameters = { @Parameter(value= "person", name="property")})
	@Column(name="PersonId")
	private int uId;
	
	@NotEmpty(message="Username cannot be null")
	@Size(min=5, max=15, message="Username must be 5-15 characters.")
	@Column(name="username", nullable = false, unique = true)
	private String username;
	
	@NotEmpty(message="password cannot be null")
	@Column(name="password", nullable=false)
	@Size(min=4, max=15, message="Password must be 4-15 characters.")
	private String password;
	
	@OneToOne(cascade = CascadeType.ALL) 
	@JoinColumn(name="PersonId")
	private Person person;

	@Enumerated(EnumType.STRING)
	@Column(name = "role", nullable = false)
	private Role role = Role.USER;
	
	@Column(name="Active")
	private boolean active;
	
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}

	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
}
