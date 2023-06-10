package com.ssafy.dto;

public class User {
	private String userName;
	private String userNick;
	private String userId;
	private String userPass;
	private String userEmail;

	public User() {};
	
	public User(String userName, String userNick, String userId, String userPass, String userEmail) {
		super();
		this.userName = userName;
		this.userNick = userNick;
		this.userId = userId;
		this.userPass = userPass;
		this.userEmail = userEmail;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@Override
	public String toString() {
		return "User [userName=" + userName + ", userNick=" + userNick + ", userId=" + userId + ", userPass=" + userPass
				+ ", userEmail=" + userEmail + "]";
	}
	
}
