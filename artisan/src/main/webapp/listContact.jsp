<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.ResultSet" %>
<%@page import = "conn.ConnexionBD" %>
<%@page import = "java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Artisan - ContactList</title>
<link href="style/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel = "stylesheet" href = "style/style.css">
</head>
<body>
<div class = "headDash">
	<div class = "logo">Artisan</div>
	<div class = "links">
		<a href = "dashboard.jsp">Oeuvres</a>
		<a href = "listContact.jsp">Contacts</a>
	</div>
	<div class = "user">
		<c:if test="${!empty sessionScope.user }">
			<b>${sessionScope.user }</b>
		</c:if>
		<a href = "deconnexion.jsp"><i class="fa fa-power-off"></i> Déconnexion</a>
	</div>
</div>
<br><br><br><br>
<center>
<h1>Contacts</h1>
<%
	Connection conn = ConnexionBD.seConnecter();
	ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM contact");
	
	while(rs.next()){
%>
		
		
			<div class = "blocContact">
				<div class = "nameContact">
					<%= rs.getString(2) %>
					<div class = "emailContact"><%= rs.getString(3) %></div>
				</div>
				<div class = "messageContact">
					<%= rs.getString(4) %>
				</div>
			</div>
		
	<% 
		}
	%>
</center>
</body>
</html>