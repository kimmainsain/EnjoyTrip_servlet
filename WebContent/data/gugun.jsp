<%@ page import="java.util.*" %>
<%@ page import="org.json.*" %>
<%@ page import="com.ssafy.dto.GugunDto" %>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<GugunDto> gugunArr = (ArrayList<GugunDto>)request.getAttribute("gugunArr");
	JSONArray jsonArr = new JSONArray();
	for(GugunDto gugun:gugunArr){
		JSONObject json = new JSONObject();
		json.put("gugunCode", String.valueOf(gugun.getGugunCode()));
		json.put("gugunName", gugun.getGugunName());
		jsonArr.put(json);
	}
%>
<%=jsonArr.toString()%>