package com.ssafy.model.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.dto.GugunDto;
import com.ssafy.dto.SidoDto;
import com.ssafy.dto.TripDto;

public interface RegionDao {
	public ArrayList<SidoDto> getSido() throws SQLException;
	
	public ArrayList<GugunDto> getGugun(int sidoCode) throws SQLException;
	
	public ArrayList<TripDto> getTrip(int sidoCode, int gugunCode, int contentTypeId, String keyword) throws SQLException;
}
