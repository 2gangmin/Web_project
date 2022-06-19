<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 메인 화면 </title>
</head>
<body>
	<%
	if(session.getAttribute("userID")==null) {
		response.sendRedirect("login.jsp");
	}
	else if(session.getAttribute("userTYPE").equals("1")){
		String name = (String)session.getAttribute("userTYPE");
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
		%>
<div align="center">
	<img src="images/brain.jpg" width="400" height="300">
	<p>
		<table>
			<tr>
				<td>
					<form action="admin_main.jsp" method="post">
						<input type="submit" value=" ◀ 회원관리 ">
					</form>
				</td>
				<td>
					<form action="check_stat.jsp" method="post">
						<input type="submit" value=" ■ 통계확인 ">
					</form>
				</td>
				<td>
					<form action="logout.jsp" method="post">
						<input type="submit" value=" 로그 아웃 ▶ ">
					</form>
				</td>
			</tr>	
		</table>
</div>
</body>
</html>