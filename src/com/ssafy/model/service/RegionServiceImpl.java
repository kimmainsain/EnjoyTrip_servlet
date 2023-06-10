package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.dto.GugunDto;
import com.ssafy.dto.SidoDto;
import com.ssafy.dto.TripDto;
import com.ssafy.model.dao.RegionDaoImpl;

public class RegionServiceImpl implements RegionService{
	
	private static RegionServiceImpl serviceImpl = new RegionServiceImpl();
	
	private RegionServiceImpl() {
		
	}
	
	public static RegionServiceImpl getServiceImpl() {
		return serviceImpl;
	}

	@Override
	public ArrayList<SidoDto> getSido() throws SQLException {
		return RegionDaoImpl.getImpl().getSido();
	}

	@Override
	public ArrayList<GugunDto> getGugun(int sidoCode) throws SQLException {
		return RegionDaoImpl.getImpl().getGugun(sidoCode);
	}

	@Override
	public ArrayList<TripDto> getTrip(int sidoCode, int gugunCode, int contentTypeId, String keyword) throws SQLException {
		return RegionDaoImpl.getImpl().getTrip(sidoCode, gugunCode, contentTypeId, keyword);
	}
	
}
