<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import=" java.sql.PreparedStatement" %>
<%@page import=" java.sql.*" %>
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

<h1>List of Services</h1>
<table border="1">
<tr>
<td>id</td>
<td>Short Description</td>
<td>Long Description</td>
<td>Price</td>
<td>image</td>
<td>delete</td>
<td>update</td>

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
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("short") %></td>
<td><%=resultSet.getString("longdes") %></td>

<td><%=resultSet.getInt("price") %></td>
<td><img  src="img.jsp?id=<%=id%>"></td>
<td><a href = "delete.jsp?id=<%=resultSet.getString("id")  %>"> delete</a></td>
<td><a href = "update.jsp?id=<%=resultSet.getString("id")  %>"> update</a></td>



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