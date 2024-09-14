<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.sql.PreparedStatement" %>
<%@page import=" java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<% 
String id = request.getParameter("id");
String sdes= request.getParameter("short");
String ldes = request.getParameter("longdes");
String price = request.getParameter("price");
try{
	Class.forName("com.jdbc.mysql.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/lab ", "root", "cmpunk2000"); 
 	PreparedStatement ps = con.prepareStatement("UPDATE services SET short=?, longdes=?, price=? where id="+id);
	ps.setString(4, id);
	ps.setString(1, sdes);
	ps.setString(2, ldes);
	ps.setString(3, price);
	int i = ps.executeUpdate();
	if(i>0){
		response.sendRedirect("edit.jsp");
	}
	else{
		out.println("error");
	}
}catch(Exception e){
	
}
%>