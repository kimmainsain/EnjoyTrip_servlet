package com.ssafy.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssafy.dto.GugunDto;
import com.ssafy.dto.SidoDto;
import com.ssafy.dto.TripDto;
import com.ssafy.model.service.RegionServiceImpl;

/**
 * Servlet implementation class DataServlet
 */
@WebServlet("/getData")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("action");
		try {
			if ("sido".equals(type)) {
				sido(request, response);
				forward(request, response, "/data/sido.jsp");
			} else if ("gugun".equals(type)) {
				gugun(request, response);
				forward(request, response, "/data/gugun.jsp");
			} else if ("map".equals(type)) {
				trip(request, response);
				forward(request, response, "/data/trip.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirect(request, response, "/error.jsp");
		}
	}
	
	protected void sido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		ArrayList<SidoDto> sidoArr = RegionServiceImpl.getServiceImpl().getSido();
		request.setAttribute("sidoArr", sidoArr);
	}
	
	protected void gugun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		ArrayList<GugunDto> gugunArr = RegionServiceImpl.getServiceImpl().getGugun(Integer.parseInt(request.getParameter("code")));
		request.setAttribute("gugunArr", gugunArr);
	}
	
	protected void trip(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int sidoCode = Integer.parseInt(request.getParameter("sidoCode"));
		int gugunCode = Integer.parseInt(request.getParameter("gugunCode"));
		int contentTypeId = Integer.parseInt(request.getParameter("contentTypeId"));
		String keyword = request.getParameter("keyword");
		
		ArrayList<TripDto> tripArr = RegionServiceImpl.getServiceImpl().getTrip(sidoCode, gugunCode, contentTypeId, keyword);
		request.setAttribute("tripArr", tripArr);
		if(tripArr==null) {
			System.out.println("데이터 없음");
			redirect(request, response, "/searchPage.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	
	protected void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath() + path);
	}
	
	protected void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher disp = request.getRequestDispatcher(path);
		disp.forward(request, response);
	}
	
	protected void keep(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
