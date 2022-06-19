<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 정보 수정 </title>

<%
	if(session.getAttribute("userID")==null) {
		response.sendRedirect("login.jsp");
	}
	else if(session.getAttribute("userTYPE").equals("1")){
		String name = (String)session.getAttribute("userNAME");
	}

	String idx = request.getParameter("idx");
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String manager = request.getParameter("manager");
%>
<script type="text/javascript">
	function checkFun()
	{
		var f = document.user_modify;
		if(f.uID.value == "")
		{
			alter("아이디를 입력해주세요.");
			f.uID.focus();
			return false;
			}
		else if(f.uPW.value == "")
		{
			alter("비밀번호를 입력해주세요.");
			f.uPW.focus();
			return false;
		}
		else if(f.uNAME.value == "")
			{
			alter("이름을 입력해주세요.");
			f.uNAME.focus();
			return false;
			}
		else if(f.uEMAIL.value == "")
		{
		alter("이메일을 입력해주세요.");
		f.uEMAIL.focus();
		return false;
		}
		else return true;
	}
</script>
</head>
<body>
<div align="center">
	HOME > 회원 정보 수정
	<hr>
	<form name="user_modify" action="modify.jsp" method="post" onsubmit="return checkFun()">
	<fieldset style="width:230px">
		<legend> 회원 정보 수정 화면 </legend> <p>
		
		아이디 : <%= id %> <br>
		<input type="text" name="uID" value="<%= id %>"> <br><br>
		
		비밀번호 : <%= pw %> <br>
		<input type="password" name="uPW" value="<%= pw %>"> <br><br>
		
		이름 : <%= name %> <br>
		<input type="text" name="uNAME" value="<%= name %>"> <br><br>
		
		이메일 : <%= email %> <br>
		<input type="text" name="uEMAIL" value="<%= email %>"> <br><br>

		관리자 권한 : <br>
		<input type="checkbox" name="uMANAGER"> <br><br>
		
		<hr>
		<input type="reset" value=" ◀ 초기화 ">
		<input type="submit" value=" 수정 ▶ ">
		<br><br>
		</fieldset>
	</form>
</div>
</body>
</html>