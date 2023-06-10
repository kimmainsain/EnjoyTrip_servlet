<%@ page import="java.util.*" %>
<%@ page import="org.json.*" %>
<%@ page import="com.ssafy.dto.SidoDto" %>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<SidoDto> sidoArr = (ArrayList<SidoDto>)request.getAttribute("sidoArr");
	JSONArray jsonArr = new JSONArray();
	for(SidoDto sido:sidoArr){
		JSONObject json = new JSONObject();
		json.put("sidoCode", String.valueOf(sido.getSidoCode()));
		json.put("sidoName", sido.getSidoName());
		jsonArr.put(json);
	}
%>
<%=jsonArr.toString()%>