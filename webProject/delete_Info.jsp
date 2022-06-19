<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
	 String idx = request.getParameter("idx");
	 
   try {            
      String sql = "DELETE FROM user WHERE idx=?";
			String sql1_a ="set @cnt = 0";
			String sql1_b ="update user set user.idx=@cnt:=@cnt+1";
			pstmt1 = conn.prepareStatement(sql1_a);
			PreparedStatement pstmt2 = conn.prepareStatement(sql1_b);
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1,Integer.parseInt(idx));
      
      pstmt.executeUpdate();
      pstmt1.executeUpdate();
      pstmt2.executeUpdate();
      
      
      pstmt.close();
      pstmt1.close();
      pstmt2.close();
      conn.close();
      
   }catch(SQLException e){
	   out.println(e);
   }
	 response.sendRedirect("admin_main.jsp");
	%>

</body>
</html>