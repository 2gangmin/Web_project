<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 검색</title>
</head>
<body>
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
	%>
<div align="center">
<p>
<h1>
상세 검색
</h1>
<p>
	<hr>
	<p>
	<form name="searchForm" action="search_Info.jsp" 
		method="post" >
		<fieldset style="width:400px">
			<legend> 검색 화면 </legend><p>
			<table>
			<tr height="30">
				<td align="left">항목&nbsp;</td>
				<td><input type="radio" name="check" value="id">아이디</td>
				<td><input type="radio" name="check" value="name">이름</td>
				<td><input type="radio" name="check" value="email">이메일</td>
			</tr>
			<tr height="40">
				<td align="left">검색 내용&nbsp;</td>
				<td><input type="text" name="String"></td>
			</tr>
			<tr height="50">
				<td></td>
				<td><input type="submit" value=" 검색 ▶▶ "></td>
			</tr>
			</table>
		</fieldset>
	</form>
		<table>
		<tr>
			<td>
					<form action="check_stat.jsp" method="post">
						<input type="submit" value=" ◀ 돌아가기 ">
					</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>