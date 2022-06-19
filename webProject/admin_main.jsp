<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 정보 관리 </title>
</head>
<body>
<div align="center">
<p>
<h1>
회원 정보 관리
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
	try {
		String sql = "select idx, id, passwd, name, email, manager from user";
		rs = stmt.executeQuery(sql);
	%>
	<table border="1" cellspacing="0">
		<tr align="center">
			<td> 번호 </td>
			<td> 아이디 </td>
			<td> 비밀번호 </td>
			<td> 이름 </td>
			<td> 이메일 </td>
			<td> 관리자 권한(0/1) </td>
			<TD> 비고 </TD>
		</tr>
	<%
	int idx;
		while (rs.next()) {
			idx = rs.getInt("idx");
	%>
		<tr align="center">
			<td><%=idx %></td>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("passwd") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getString("manager") %></td>
			<TD>
				<INPUT type="button" value="수정" onClick="location.href='modifyform.jsp?id=<%=rs.getString("id")%>&passwd=<%=rs.getString("passwd")%>&name=<%=rs.getString("name")%>&email=<%=rs.getString("email") %>&manager=<%=rs.getString("manager") %>'">
				<A href="delete_Info.jsp?idx=<%=idx %>"> X </A>
			</TD>
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
</div>
<p>
<hr>
<div align="center">
<table>
		<tr>
			<td>
				<form action="admin.jsp" method="post" >
					<input type="submit" value=" ◀ 돌아가기 " >
				</form>
			</td>
			<td>
				<form action="regiform.jsp" method="post">
					<input type="submit" value=" 등록하기 ▶ ">
				</form>
			</td>
		</tr>	
</table>
</div>
</body>
</html>