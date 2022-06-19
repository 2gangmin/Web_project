<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbConn.jsp" %>
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
<%
	request.setCharacterEncoding("utf-8");
	
	String ch = request.getParameter("check");
	String sum = request.getParameter("String");
	String sql = "select name, id, email, a, b, c, d, e from user where " + ch + " like ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, "%"+sum+"%");
	rs = pstmt.executeQuery();
%>
<html>
<body>
<div align="center">
<p>
<h1>
검색 결과
</h1>
<p>
<hr>
<p>
   <table border="1">
      <tr align="center">
         <td> 이름 </td>
         <td> 아이디 </td>
         <td> 이메일 </td>
		     <td> 기억 </td>
			   <td> 지각 </td>
			   <td> 직감 </td>
			   <td> 분석 </td>
			   <td> 계산 </td>
      </tr>

		<%
				while (rs.next()) {
		%>
		<tr align="center">
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("email")%></td>
			<td><%=rs.getString("a")%></td>
			<td><%=rs.getString("b")%></td>
			<td><%=rs.getString("c")%></td>
			<td><%=rs.getString("d")%></td>
			<td><%=rs.getString("e")%></td>
		</tr>
		<%
	
	}
		%>
	</table>
<p>
<hr>
<p>
	<table>
		<tr>
			<td>
					<form action="searchform.jsp" method="post">
						<input type="submit" value=" ◀ 돌아가기 ">
					</form>
			</td>
			<td>
					<form action="admin.jsp" method="post">
						<input type="submit" value=" ◀◀ 관리화면 ">
					</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
<%--	<%
		String sql1 = "select *from user";
		pstmt1 = conn.prepareStatement(sql1);
		rs1 = pstmt1.executeQuery(sql1);
	%>
   <table border="1">
      <tr align="center">
         <td> 번호 </td>
         <td> 아이디 </td>
         <td> 이름 </td>
         <td> 이메일 </td>
		     <td> 기억 </td>
			   <td> 지각 </td>
			   <td> 직감 </td>
			   <td> 분석 </td>
			   <td> 계산 </td>
      </tr>
      <%
      int num = 1;
         while (rs.next()) {
        num++; }
      String[] list = new String[num];
      int count = 1;
         while (rs.next()) {

      %>
      <tr align="center">
         <td><%list[count] += (char)count + " "; %> </td>
         <td><%list[count] += rs.getString("id") + " "; %></td>
         <td><%list[count] += rs.getString("name") + " "; %></td>
         <td><%list[count] += rs.getString("email") + " "; %></td>
         <td><%list[count] += rs.getString("a") + " "; %></td>
         <td><%list[count] += rs.getString("b") + " "; %></td>
         <td><%list[count] += rs.getString("c") + " "; %></td>
         <td><%list[count] += rs.getString("d") + " "; %></td>
         <td><%list[count] += rs.getString("e") + " "; %></td>
       </tr>
      <%
        count++; }
         int startPage = 1;
         int endPage = (int)Math.ceil(count/5);
         int maxPage = endPage;
         int currentPage = 1;
         int i;
      %>
      <ul class="pagination pull-right">
    <%if(1 != startPage){ %>
        <li><a href="search_Info.jsp?currentPage=<%=startPage - 1%>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
    <%}%>
    <%for (i = startPage; i <= endPage; i++){ %>
        <%for(int a = currentPage; a <= currentPage + 5; a++) {%>
         <td><%=list[a]%></td>
         <%} %>
         <%if(i == currentPage){ %>
            <li class="active"><a><%=i%></a></li>
        <%}else{ %>
            <li><a href="search_Info.jsp?currentPage=<%=i%>"><%=i%></a></li>
        <%} %>
    <%} %>
    <%if(endPage != maxPage){ %>
        <li><a href="search_Info.jsp?currentPage=<%=endPage + 1%>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
    <%}%>
</ul>
    --%>