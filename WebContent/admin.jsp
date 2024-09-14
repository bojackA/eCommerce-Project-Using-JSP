<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">



<html>

<style>
h2{

font-family: Lobster, Monospace;
margin: 20px;
 
 
}
h1{
text-align:center;
font-family:verdana;

}
form{
text-align:center;
}
body {
 background-image: url("anime-school-scenery-silver-aesthetic-school-lab-muzqr412rpk5zxqv.jpg");
 background-color: #cccccc;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Welcome to admin page</h2>
<!-- Navigation-->
	<div class="header">
  
  <div class="header-right">
    <a class="active" href="edit.jsp">View Services</a>
    
  </div>

<form name="form1" method="post" action="UploadService" enctype="multipart/form-data"> 
	<h1>Insert Services</h1> 
	<input placeholder="short description" type="text" name="short"><br><br>
	<input placeholder="long description" type="text" name="longdes"><br><br>
	<input placeholder="price"  name="price"><br><br>
	
	<input placeholder = "insert image " value="insert image" type="file" name="image"><br><br>
	<input type="submit" name="submit" value="Submit">
</form>
</body>
</html>