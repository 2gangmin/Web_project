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
		String u_id = request.getParameter("uID");
		String u_pw = request.getParameter("uPW");
		String u_name = request.getParameter("uNAME");
		String u_email = request.getParameter("uEMAIL");
		String u_manager = request.getParameter("uMANAGER");
		String isManager;
		if (u_manager == null) {
			isManager = "0";
		}
		else if (u_manager.equals("on")) {
			isManager = "1";
		}
		else {
			isManager = "0";
		}
		
		if (u_pw == null){
		%>
			<script type="text/javascript">
			alert(" 비밀번호를 입력해주세요. ");
			location.href=("regiform.jsp");
			</script>
		<%
		}
		
		try
		{
			String sql = "INSERT INTO user(id, passwd, name, email, manager) VALUES(?,?,?,?,?)";
			String sql1_a ="set @cnt = 0";
			String sql1_b ="update user set user.idx=@cnt:=@cnt+1";
			pstmt = conn.prepareStatement(sql);
			pstmt1 = conn.prepareStatement(sql1_a);
			PreparedStatement pstmt2 = conn.prepareStatement(sql1_b);
			pstmt.setString(1, u_id);
			pstmt.setString(2, u_pw);
			pstmt.setString(3, u_name);
			pstmt.setString(4, u_email);
			pstmt.setString(5, isManager);
			
			pstmt.executeUpdate(); // sql문 실행(회원추가 실행)
			pstmt1.executeUpdate();
			pstmt2.executeUpdate();
			
			pstmt.close();
			pstmt1.close();
			pstmt2.close();
			
			conn.close();
		}
		catch(SQLException e) {
			out.println(e);
		}
		response.sendRedirect("admin_main.jsp"); // 다시 메인리스트 를 실행하여 업데이트
	%>
</body>
</html>