package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.dto.Board;

public interface BoardService {
	void writeArticle(Board board) throws SQLException;
	ArrayList<Board> select() throws SQLException;
	Board view(int articleNo) throws SQLException;
	int delete(int articleNo) throws SQLException;
	int modify(int articleNo, String subject, String content) throws SQLException;
}
