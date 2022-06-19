<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	String id = request.getParameter("uID");
	String pw = request.getParameter("uPW");
	String name = request.getParameter("uNAME");
	String email = request.getParameter("uEMAIL");
	String manager = request.getParameter("uMANAGER");
	String isManager;
	if (manager == null) {
		isManager = "0";
	}
	else if (manager.equals("on")) {
		isManager = "1";
	}
	else {
		isManager = "0";
	}
	

	try {
		String sql = "update user set id=?, passwd=?, name=?, email=?, manager=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setString(5, isManager);
		pstmt.setString(6, id);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	} finally {	}
	
	response.sendRedirect("admin_main.jsp");
	
	
%>
</body>
</html>