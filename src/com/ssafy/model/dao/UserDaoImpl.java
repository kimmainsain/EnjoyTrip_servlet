package com.ssafy.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.dto.Board;
import com.ssafy.dto.User;
import com.ssafy.util.DBUtil;

public class UserDaoImpl implements UserDao {

	private static UserDaoImpl instance = new UserDaoImpl();

	public static UserDaoImpl getInstance() {
		return instance;
	}

	private UserDaoImpl() {
	};
	
	@Override
	public ArrayList<Board> list() throws SQLException {
		ArrayList<Board> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from board";
			con = DBUtil.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setArticleNo(rs.getInt("article_no"));
				board.setUserId(rs.getString("user_id"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegisterTime(rs.getString("register_time"));
				list.add(board);
			}
		} finally {
			DBUtil.getInstance().close(rs, pstmt, con);
		}
		return list;
	}

	@Override
	public void writeArticle(Board board) throws SQLException {
		String sql = "insert into board (user_id, subject, content) values (?,?,?);";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getUserId());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} finally {
			DBUtil.getInstance().close(pstmt,con);
		}
	}

	@Override
	public User select(String id) throws SQLException {
		String sql = "select * from user where id=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User u = null;
		try {
			con = DBUtil.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setUserId(rs.getString("id"));
				u.setUserPass(rs.getString("password"));
				u.setUserName(rs.getString("name"));
				u.setUserNick(rs.getString("nick"));
				u.setUserEmail(rs.getString("email"));
			}
		} finally {
			DBUtil.getInstance().close(rs, pstmt, con);
		}
		return u;
	}

	@Override
	public void regist(User user) {
		String sql = "insert into user values(?,?,?,?,?)";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserNick());
			pstmt.setString(3, user.getUserId());
			pstmt.setString(4, user.getUserPass());
			pstmt.setString(5, user.getUserEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			DBUtil.getInstance().close(pstmt, con);
		}
	}

	@Override
	public Board view(int articleNo) throws SQLException {
		String sql = "select * from board where article_no=?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		try {
			con = DBUtil.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setArticleNo(rs.getInt("article_no"));
				board.setUserId(rs.getString("user_id"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setRegisterTime(rs.getString("register_time"));
				System.out.println(board.getRegisterTime());
			}
		} finally {
			DBUtil.getInstance().close(rs, pstmt, con);
		}
		return board;
	}

	@Override
	public int delete(int articleNo) throws SQLException {
		int cnt = -1;
		String sql = "delete from board where article_no = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNo);
			cnt = pstmt.executeUpdate();
		} finally {
			DBUtil.getInstance().close(pstmt, con);
		}
		return cnt;
	}

	@Override
	public int modify(int articleNo, String subject, String content) throws SQLException {
		int cnt = -1;
		String sql = "update board set subject = ?, content = ? where article_no = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, articleNo);
			cnt = pstmt.executeUpdate();
		} finally {
			DBUtil.getInstance().close(pstmt, con);
		}
		return cnt;
	}

	@Override
	public User findPass(String id, String email) throws SQLException {
		String sql = "select * from user where id = ? and email = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = null;
		try {
			con = DBUtil.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				user = new User();
				user.setUserName(rs.getString("name"));
				user.setUserNick(rs.getString("nick"));
				user.setUserId(rs.getString("id"));
				user.setUserPass(rs.getString("password"));
				user.setUserEmail(rs.getString("email"));
			}
		} finally {
			DBUtil.getInstance().close(rs, pstmt, con);
		}
		return user;
	}
	
	@Override
	public int deleteUser(String id) throws SQLException {
		int cnt = -1;
		String sql = "delete from user where id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			cnt = pstmt.executeUpdate();
		} finally {
			DBUtil.getInstance().close(pstmt, con);
		}
		return cnt;
	}

	@Override
	public int updateUser(User user) throws SQLException {
		int cnt = -1;
		String sql = "update user set name = ?, nick = ?, password = ?, email = ? where id = ?";
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DBUtil.getInstance().getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserNick());
			pstmt.setString(3, user.getUserPass());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserId());
			cnt = pstmt.executeUpdate();
		} finally {
			DBUtil.getInstance().close(pstmt, con);
		}
		return cnt;
	}

}
