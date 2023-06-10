package com.ssafy.dto;

public class TripDto {
	private String title, first_image, overview;
	private double latitude, longitude;
	public TripDto() {
		
	}
	public TripDto(String title, String first_image, String overview, double latitude, double longitude) {
		super();
		this.title = title;
		this.first_image = first_image;
		this.overview = overview;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFirst_image() {
		return first_image;
	}
	public void setFirst_image(String first_image) {
		this.first_image = first_image;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
}
