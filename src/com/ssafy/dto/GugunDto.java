package com.ssafy.dto;

public class GugunDto {
	private int gugunCode;
	private String gugunName;
	
	public GugunDto() {
		
	}
	
	public GugunDto(int gugunCode, String gugunName) {
		super();
		this.gugunCode = gugunCode;
		this.gugunName = gugunName;
	}

	public int getGugunCode() {
		return gugunCode;
	}

	public void setGugunCode(int gugunCode) {
		this.gugunCode = gugunCode;
	}

	public String getGugunName() {
		return gugunName;
	}

	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	} 
	
	
}
