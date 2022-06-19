<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 정보 등록 </title>
	<%
	if(session.getAttribute("userID")==null) {
		response.sendRedirect("login.jsp");
	}
	else if(session.getAttribute("userTYPE").equals("1")){
		String name = (String)session.getAttribute("userNAME");
	}
	%>
<script type="text/javascript">
	function checkFun()
	{
		var f = document.inputform;
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
<form name="inputform" action="regi_Info.jsp" method="post" onsubmit="return checkFun()">
	<fieldset style="width:230px">
		<legend> 회원 정보 등록 화면 </legend> <p>
		
		┌ 아이디 ┐<br>
		<input type="text" name="uID" maxlength="20" size="20"><br><br>
		
		┌ 비밀번호 ┐<br>
		<input type="text" name="uPW" maxlength="20" size="20"><br><br>
		
		┌ 이름 ┐<br>
		<input type="text" name="uNAME" maxlength="12" size="20"><br><br>
		
		┌ 이메일 ┐<br>
		<input type="text" name="uEMAIL" maxlength="30" size="20"><br><br>
		
		관리자 권한 : <input type="checkbox" name="uMANAGER"> <br><br>
		
		<hr>
		<input type="reset" value=" ◀ 초기화 ">
		<input type="submit" value="▶ 등록하기 ">
		<br><br>
	</fieldset>
</form>
</div>
</body>
</html>