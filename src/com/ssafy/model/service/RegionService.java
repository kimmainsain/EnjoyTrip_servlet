package com.ssafy.model.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ssafy.dto.GugunDto;
import com.ssafy.dto.SidoDto;
import com.ssafy.dto.TripDto;

public interface RegionService {
	public ArrayList<SidoDto> getSido() throws SQLException;
	
	public ArrayList<GugunDto> getGugun(int sidoCode) throws SQLException;
	
	public ArrayList<TripDto> getTrip(int sidoCode, int gugunCode, int contentTypeId, String keyword) throws SQLException;
}
