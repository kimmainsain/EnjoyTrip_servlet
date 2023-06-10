package com.ssafy.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.dto.Board;
import com.ssafy.dto.User;

public interface UserDao {
	void regist(User user);
	User select(String id) throws SQLException;
	void writeArticle(Board board) throws SQLException;
	ArrayList<Board> list() throws SQLException;
	Board view(int articleNo) throws SQLException;
	int delete(int articleNo) throws SQLException;
	int modify(int articleNo, String subject, String content) throws SQLException;
	User findPass(String id, String email) throws SQLException;
	int deleteUser(String id) throws SQLException;
	int updateUser(User user) throws SQLException;
}
