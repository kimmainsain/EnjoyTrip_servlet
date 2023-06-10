package com.ssafy.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.dto.Board;
import com.ssafy.dto.User;
import com.ssafy.model.service.BoardServiceImpl;
import com.ssafy.model.service.UserServiceImpl;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MainServlet() {
		super();
	}

	protected void redirect(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		response.sendRedirect(request.getContextPath() + path);
	}

	protected void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher disp = request.getRequestDispatcher(path);
		disp.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("action");
		System.out.println("type : " + type);
		try {
			if ("mvmypage".equals(type)) {
				userInfo(request, response);
				redirect(request, response, "/mypage.jsp");
			} else if ("mvhome".equals(type)) {
				redirect(request, response, "/home.jsp");
			} else if ("mvlogin".equals(type)) {
				redirect(request, response, "/login.jsp");
			} else if ("mvsearchpage".equals(type)) {
				redirect(request, response, "/searchPage.jsp");
			} else if ("mvsignup".equals(type)) {
				redirect(request, response, "/signUp.jsp");
			} else if ("mvwrite".equals(type)) {
				redirect(request, response, "/write.jsp");
			} else if ("mvview".equals(type)) {
				view(request, response);
				forward(request, response, "/view.jsp");
			} else if ("regist".equals(type)) {
				regist(request, response);
			} else if ("login".equals(type)) {
				login(request, response);
			} else if ("logout".equals(type)) {
				logout(request, response);
			} else if ("write".equals(type)) {
				write(request, response);
			} else if ("list".equals(type)) {
				list(request, response);
			} else if ("mvmodify".equals(type)) {
				mvmodify(request, response);
				forward(request, response, "/modify.jsp");
			} else if ("modify".equals(type)) {
				modify(request, response);
				redirect(request, response, "/main?action=list");
			} else if ("delete".equals(type)) {
				delete(request, response);
				redirect(request, response, "/main?action=list");
			} else if ("mvpass".equals(type)) {
				redirect(request, response, "/password.jsp");
			} else if ("pass".equals(type)) {
				findPass(request, response);
				forward(request, response, "/resultPass.jsp");
			} else if ("mvUserInfo".equals(type)) {
				userInfo(request, response);
				forward(request, response, "/userInfo.jsp");
			} else if ("mvupdateuser".equals(type)) {
				forward(request, response, "/updateuser.jsp");
			} else if ("updateUser".equals(type)) {
//				deleteUser(request, response);
				updateUser(request, response);
				redirect(request, response, "/login.jsp");
			} else if ("deleteUser".equals(type)) {
				deleteUser(request, response);
				redirect(request, response, "/login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirect(request, response, "/error.jsp");
		}
	}

	protected void updateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userinfo");
		String id = user.getUserId();
		String pass = request.getParameter("userPass");
		String email = request.getParameter("userEmail");
		String nickname = request.getParameter("userNick");
		String name = request.getParameter("userName");
		int result = UserServiceImpl.getInstance().update(new User(name, nickname, id, pass, email));
		session.invalidate();
	}

	protected void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userinfo");
		int result = UserServiceImpl.getInstance().delete(user.getUserId());
		session.invalidate();
	}

	protected void userInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userinfo");
		user = UserServiceImpl.getInstance().select(user.getUserId());
		session.setAttribute("userDetail", user);
	}

	protected void mvmodify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		Board board = BoardServiceImpl.getInstance().view(articleNo);
		System.out.println(board.toString());
		request.setAttribute("article", board);
	}

	protected void findPass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String id = request.getParameter("userId");
		String email = request.getParameter("userEmail");
		User user = UserServiceImpl.getInstance().findPass(id, email);
		if (user == null) {
			request.setAttribute("msg", "해당 아이디, 이메일을 가진 계정이 존재하지 않습니다.");
		} else {
			request.setAttribute("user", user);
		}
	}

	protected void modify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int result = BoardServiceImpl.getInstance().modify(articleNo, subject, content);
		if (result == -1) {
			redirect(request, response, "/error.jsp");
		}
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		int result = BoardServiceImpl.getInstance().delete(articleNo);
		if (result == -1) {
			redirect(request, response, "/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		User login = UserServiceImpl.getInstance().login(id, password);

		if (login != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userinfo", login);
			redirect(request, response, "/home.jsp");
		} else {
			redirect(request, response, "/error.jsp");
		}
	}

	protected void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		redirect(request, response, "/login.jsp");
	}

	protected void regist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String userName = request.getParameter("userName");
		String userNick = request.getParameter("userNick");
		String userId = request.getParameter("userId");
		String userPass = request.getParameter("userPass");
		String userEmail = request.getParameter("userEmail");

		User user = new User(userName, userNick, userId, userPass, userEmail);
		UserServiceImpl.getInstance().insert(user);
		request.setAttribute("user", user);
		forward(request, response, "/login.jsp");
	}

	protected void write(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User member = (User) session.getAttribute("userinfo");
		if (member != null) {
			Board board = new Board();
			board.setUserId(member.getUserId());
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));
			try {
				BoardServiceImpl.getInstance().writeArticle(board);
				request.setAttribute("articles", board);
				System.out.println(request.getAttribute("articles").toString());
				redirect(request, response, "/main?action=list");
			} catch (Exception e) {
				redirect(request, response, "/error.jsp");
			}
		} else {
			redirect(request, response, "/login.jsp");
		}
	}

	protected void view(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));
		Board board = BoardServiceImpl.getInstance().view(articleNo);
		request.setAttribute("article", board);
	}

	protected void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		ArrayList<Board> list = new ArrayList<>();
		list = BoardServiceImpl.getInstance().select();
		Collections.sort(list, (o1, o2) -> o2.getArticleNo() - o1.getArticleNo());
		request.setAttribute("articles", list);
		forward(request, response, "/forum.jsp");
	}

	protected void keep(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
