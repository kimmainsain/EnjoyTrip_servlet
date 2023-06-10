package com.ssafy.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.dto.GugunDto;
import com.ssafy.dto.SidoDto;
import com.ssafy.dto.TripDto;
import com.ssafy.util.DBUtil;

public class RegionDaoImpl implements RegionDao{
	
	private static RegionDaoImpl regionDao = new RegionDaoImpl();
	
	private RegionDaoImpl() {
		
	}
	
	public static RegionDaoImpl getImpl() {
		return regionDao;
	}
	
	@Override
	public ArrayList<SidoDto> getSido() throws SQLException {
		ArrayList<SidoDto> sidoArr = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getInstance().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * from sido");
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			//sido_code, sido_name
			while(rs.next()) {
				SidoDto sido = new SidoDto();
				sido.setSidoCode(rs.getInt(1));
				sido.setSidoName(rs.getString(2));
				sidoArr.add(sido);
			}
		}finally {
			DBUtil.getInstance().close(rs,pstmt,con);
		}
		return sidoArr;
	}

	@Override
	public ArrayList<GugunDto> getGugun(int sidoCode) throws SQLException {
		ArrayList<GugunDto> gugunArr = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = DBUtil.getInstance().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * from gugun where sido_code = ?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, sidoCode);
			rs = pstmt.executeQuery();
			//gugun_code, gugun_name
			while(rs.next()) {
				GugunDto gugun = new GugunDto();
				gugun.setGugunCode(rs.getInt(1));
				gugun.setGugunName(rs.getString(2));
				gugunArr.add(gugun);
			}
		}finally {
			DBUtil.getInstance().close(rs,pstmt,con);
		}
		return gugunArr;
	}

	@Override
	public ArrayList<TripDto> getTrip(int sidoCode, int gugunCode, int contentTypeId, String keyword) throws SQLException {
		ArrayList<TripDto> tripArr = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		System.out.println(sidoCode);
//		System.out.println(gugunCode);
//		System.out.println(contentTypeId);
//		System.out.println(keyword);
		try {
			con = DBUtil.getInstance().getConnection();
			StringBuilder sql = new StringBuilder("select d.overview, i.title, i.latitude, i.longitude, i.first_image ");
			sql.append("from attraction_description as d join attraction_info as i on d.content_id = i.content_id ");
			sql.append("where sido_code = ? and gugun_code = ? and i.content_type_id = ? and title like concat('%', ?, '%')");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, sidoCode);
			pstmt.setInt(2, gugunCode);
			pstmt.setInt(3, contentTypeId);
			pstmt.setString(4, keyword);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TripDto trip = new TripDto();
				trip.setOverview(rs.getString(1));
				trip.setTitle(rs.getString(2));
				trip.setLatitude(rs.getDouble(3));
				trip.setLongitude(rs.getDouble(4));
				trip.setFirst_image(rs.getString(5));
				tripArr.add(trip);
			}
		}finally {
			DBUtil.getInstance().close(rs,pstmt,con);
		}
		return tripArr;
	}

}
