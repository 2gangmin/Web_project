<%@ page import = "java.sql.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt1 = null;
	ResultSet rs1 = null;
	Statement stmt = null;
	
	String url = "jdbc:mysql://localhost:3306/jsp_db";
	String user = "root";
	String passwd = "1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, passwd);
%>