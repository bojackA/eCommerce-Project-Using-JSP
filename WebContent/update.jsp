<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import=" java.sql.PreparedStatement" %>
<%@page import=" java.sql.*" %>

<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "lab";
String userid = "root";
String password = "cmpunk2000";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from services where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<style>

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action= "update1.jsp" > 
	<h1>Update Service</h1> 
	<input placeholder="short description" type="text" name="short" value="<%=resultSet.getString("short") %>"><br><br>
	<input placeholder="long description" type="text" name="longdes" value="<%=resultSet.getString("longdes") %>"><br><br>
	<input placeholder="price"  name="price" value="<%=resultSet.getString("price") %>"><br><br>
	
	<input  type="file" name="image"><br><br>
	<input type="submit" name="submit" value="Submit">
	</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>