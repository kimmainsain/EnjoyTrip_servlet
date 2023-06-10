<%@ page import="java.util.*" %>
<%@ page import="org.json.*" %>
<%@ page import="com.ssafy.dto.TripDto" %>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<TripDto> tripArr = (ArrayList<TripDto>)request.getAttribute("tripArr");
	JSONArray jsonArr = new JSONArray();
	if(tripArr == null){
		JSONObject json = new JSONObject();
		json.put("overview", "overview");
		jsonArr.put(json);
	}else{
		for(TripDto trip:tripArr){
			JSONObject json = new JSONObject();
			json.put("overview", trip.getOverview());
			json.put("title", trip.getTitle());
			json.put("latitude", String.valueOf(trip.getLatitude()));
			json.put("longitude", String.valueOf(trip.getLongitude()));
			json.put("first_image", trip.getFirst_image());
			jsonArr.put(json);
		}
	}
%>
<%=jsonArr.toString()%>