<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.sql.PreparedStatement" %>


<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/lab";
String database = "test";
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
<!DOCTYPE html>
<html>
<body>
<style>

</style>
<h1>Available Services</h1>
<table border="1">
<tr>
<td>Short Description</td>
<td>Long Description</td>
<td>Price</td>
<td>image</td>

</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab ", "root", "cmpunk2000");
statement=connection.createStatement();
String sql ="select * from services";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("short") %></td>
<td><%=resultSet.getString("longdes") %></td>
<td><%=resultSet.getString("price") %></td>
<td><img  src="img.jsp?id=<%=id%>"></td>


</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table> 

</body>
</html>