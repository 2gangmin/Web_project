<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 </title>
</head>
<body>
<%
	String uID = request.getParameter("uID");
	String uPW = request.getParameter("uPW");
	
	pstmt = conn.prepareStatement("SELECT passwd FROM user WHERE id=?");
	pstmt.setString(1, uID);
	rs = pstmt.executeQuery(); // (1)
	pstmt1 = conn.prepareStatement("SELECT manager, name FROM user WHERE id=?");
	pstmt1.setString(1, uID);
	rs1 = pstmt1.executeQuery();	// (2)
	
	if (rs.next()) // (1) 결과 검색
	{
		if (rs.getString("passwd").equals(uPW)) // passwd 값이 uPW 와 같으면
		{	
			if (rs1.next()) // (2) 결과 검색
			{	
				String manager = rs1.getString("manager");
				String name = rs1.getString("name");
				
				// 로그인 성공 시 다음 행동, 세션 생성 후
				session.setAttribute("userID", uID);
				session.setAttribute("userTYPE", manager);
				session.setAttribute("userNAME", name);
				
				if (manager.equals("1"))
				{
					%>
					<script type="text/javascript">
					alert("[ 관리자 권한 ] 로그인 성공");
					location.href=("admin.jsp");
					</script>
					<%
				}
				else
				{
					%>
					<script type="text/javascript">
					alert("로그인 성공");
					location.href=("user_Info.jsp");
					</script>
					<%
					String userNAME = (String)session.getAttribute("userNAME");
					String userTYPE = (String)session.getAttribute("userTYPE");
				}
			}
		}
		else
		{
			%>
			<script type="text/javascript">
			alert(" 비밀번호 불일치 ");
			location.href=("login.jsp");
			</script>
			<%
		}
	}
	else {
		%>
		<script type="text/javascript">
		alert(" 로그인 정보 불일치 ");
		location.href=("login.jsp");
		</script>
		<%
	}
		%>
</body>
</html>