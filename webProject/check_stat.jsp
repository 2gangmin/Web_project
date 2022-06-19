<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 통계 확인 </title>
</head>
<body>
<div align="center">
<p>
<h1>
회원 통계 확인
</h1>
<p>
<hr>
<p>
	<%
	if(session.getAttribute("userID")==null) {
		response.sendRedirect("login.jsp");
	}
	else if(session.getAttribute("userTYPE").equals("1")){
		String name = (String)session.getAttribute("userNAME");
	}
	else
	{
	%>
	<script type="text/javascript">
					alert(" 관리자 권한이 없어 로그인 화면으로 돌아갑니다. ");
					location.href=("login.jsp");
	</script>
	<%
	}
	
	stmt = conn.createStatement();
	try{
		String sql = "select idx, name, a, b, c, d, e from user";
		rs = stmt.executeQuery(sql);
  %>
  	<table border="1" cellspacing="0">
		<tr align="center">
			<td> 번호 </td>
			<td> 이름 </td>
			<td> 기억 </td>
			<td> 지각 </td>
			<td> 직감 </td>
			<td> 분석 </td>
			<td> 계산 </td>
		</tr>
	<%
	int idx;
		while (rs.next()) {
			idx = rs.getInt("idx");
	%>
		<tr align="center">
			<td><%=idx %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("a") %></td>
			<td><%=rs.getString("b") %></td>
			<td><%=rs.getString("c") %></td>
			<td><%=rs.getString("d") %></td>
			<td><%=rs.getString("e") %></td>
		</tr>
	<%
		}
	%>
	</table>
	<%
	rs.close();
	stmt.close();
	conn.close();
	} catch(SQLException e) {
		out.println("err : "+e.toString());
	}
	%>
<p>
<hr>
<p>
	<table>
		<tr>
			<td>
					<form action="admin.jsp" method="post">
						<input type="submit" value=" ◀ 돌아가기 ">
					</form>
			</td>
				<td>
					<form action="searchform.jsp" method="post">
						<input type="submit" value=" 상세검색 ▶ ">
					</form>
				</td>
		</tr>
	</table>
</div>
</body>
</html>