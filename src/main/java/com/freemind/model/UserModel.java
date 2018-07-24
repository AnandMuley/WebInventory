package com.freemind.model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="USER")
public class UserModel{

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", nullable = false)
	private Integer userId;

	@Column(name = "USER_NAME")
	private String userName;

	@Column(name = "PASSWORD")
	private String password;


	@ManyToOne(fetch = FetchType.LAZY)
	@Cascade(value={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="USER_ROLL")
	private RoleModel userRoll;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userModel", targetEntity = UserPermissionModel.class)
	private Set<UserPermissionModel> userPermission = new HashSet<UserPermissionModel>(0);
	
	
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public RoleModel getUserRoll() {
		return userRoll;
	}

	public void setUserRoll(RoleModel userRoll) {
		this.userRoll = userRoll;
	}

	public Set<UserPermissionModel> getUserPermission() {
		return userPermission;
	}

	public void setUserPermission(Set<UserPermissionModel> userPermission) {
		this.userPermission = userPermission;
	}

	
	
	
}
