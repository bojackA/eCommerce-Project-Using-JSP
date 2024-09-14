<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>image</h1>





<%       Blob image = null;
		Connection con = null;
		byte[] imgData = null ;
		Statement stmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab ", "root", "cmpunk2000");
			stmt = con.createStatement();
			rs = stmt.executeQuery("select img from services");
			if (rs.next()) {
				image = rs.getBlob(1);
				imgData = image.getBytes(1,(int)image.length());
			} else {
				out.println("Display Blob Example");
				out.println("image not found for given id>");
				return;
			}

			// display the image
         response.setContentType("image/gif");
         OutputStream o = response.getOutputStream();
         o.write(imgData);
         o.flush();
         o.close();
		} catch (Exception e) {
			out.println("Unable To Display image");
			out.println("Image Display Error=" + e.getMessage());
			return;
		} finally {
			try {
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	%>
	</body>
	</html>