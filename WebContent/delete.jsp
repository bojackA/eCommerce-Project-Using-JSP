<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.sql.PreparedStatement" %>
<%@page import=" java.sql.*" %>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id =request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab ", "root", "cmpunk2000");
	
		
		
		Statement ptsmt = con.createStatement();
		
		ptsmt.executeUpdate("DELETE FROM services WHERE id="+id);
	
		response.sendRedirect("edit.jsp");
		
		
	

%>	
	

</body>
</html>