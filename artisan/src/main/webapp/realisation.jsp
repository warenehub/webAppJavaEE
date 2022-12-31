<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "conn.ConnexionBD" %>
<%@page import = "java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Artisan - Realisation</title>
<link href="style/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel = "stylesheet" href = "style/style.css">
</head>
<body>
	<%@ include file = "menu.jsp" %>

	<div class = "content">
	<br><br><br><br><br>
		<center><h1>Oeuvres</h1></center>
	<br>
	<%
		Connection conn = ConnexionBD.seConnecter();
		ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM article LIMIT 0,4");
		
		while(rs.next()){
	%>

	<div class = "card">
		<div class = "card-image">
			<img src="images/<%= rs.getString(3) %>">
		</div>
		<div class = "card-content">
			<div class = "card-title"><%= rs.getString(2) %></div>
		</div>
	</div>
	<% 
		}
	%>
	</div>
	<%@ include file = "footer.jsp" %>	
</body>
</html>