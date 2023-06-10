package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.dto.Board;
import com.ssafy.model.dao.UserDaoImpl;

public class BoardServiceImpl implements BoardService{

	private static BoardServiceImpl instance = new BoardServiceImpl();
	
	public static BoardServiceImpl getInstance() {
		return instance;
	}
	
	@Override
	public ArrayList<Board> select() throws SQLException {
		return UserDaoImpl.getInstance().list();
	}

	
	private BoardServiceImpl() {};
	
	@Override
	public void writeArticle(Board board) throws SQLException {
		UserDaoImpl.getInstance().writeArticle(board);
	}

	@Override
	public Board view(int articleNo) throws SQLException {
		return UserDaoImpl.getInstance().view(articleNo);
	}

	@Override
	public int delete(int articleNo) throws SQLException {
		return UserDaoImpl.getInstance().delete(articleNo);
	}

	@Override
	public int modify(int articleNo, String subject, String content) throws SQLException {
		return UserDaoImpl.getInstance().modify(articleNo, subject, content);
	}
	
}
