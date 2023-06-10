package com.ssafy.model.service;

import java.sql.SQLException;

import com.ssafy.dto.User;
import com.ssafy.model.dao.UserDaoImpl;

public class UserServiceImpl implements UserService{

	private static UserServiceImpl instance = new UserServiceImpl();
	
	public static UserServiceImpl getInstance() {
		return instance;
	}
	
	private UserServiceImpl() {};
	
	
	public User login(String id, String password) throws SQLException {
		User l = UserDaoImpl.getInstance().select(id);
		if (l.getUserPass().equals(password)) {
			return l;
		} else {
			return null;
		}
	}
	
	@Override
	public void insert(User user) throws SQLException {
		UserDaoImpl.getInstance().regist(user);
	}

	@Override
	public User findPass(String id, String email) throws SQLException {
		return UserDaoImpl.getInstance().findPass(id, email);
	}
	
	@Override
	public User select(String id) throws SQLException{
		return UserDaoImpl.getInstance().select(id);
	}
	
	@Override
	public int delete(String id) throws SQLException{
		return UserDaoImpl.getInstance().deleteUser(id);
	}

	@Override
	public int update(User user) throws SQLException {
		return UserDaoImpl.getInstance().updateUser(user);
	}
	
}
