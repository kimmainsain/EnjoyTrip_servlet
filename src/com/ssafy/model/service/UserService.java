package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.dto.Board;
import com.ssafy.dto.User;

public interface UserService {
	void insert(User user) throws SQLException;
	User login(String id, String password) throws SQLException;
	User findPass(String id, String email) throws SQLException;
	User select(String id) throws SQLException;
	int delete(String id) throws SQLException;
	int update(User user) throws SQLException;
}
