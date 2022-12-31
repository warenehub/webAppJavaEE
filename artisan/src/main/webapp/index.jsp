<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@page import = "java.sql.ResultSet" %>
<%@page import = "conn.ConnexionBD" %>
<%@page import = "java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Artisan - accueil</title>
<link href="style/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel = "stylesheet" href = "style/style.css">
</head>
<body>
<%@ include file = "menu.jsp" %>
	<div class= "slide">
	<br><br>
		<h1>Binevenue sur Artisan</h1>
		<p>Decouvrez nos plus belles creations en un click</p>
	</div>
	<div class = "typeSections">
		<div class = "sections">
			<div class = "head">
				<i class = "fa fa-users" id = "i"></i>
				<span class = "titre"> Simples realisations</span>
			</div>
			<p class = "text">
				Nous realisons des oeuvres de qualite et de type varie pour le grand public<br>
				<button class = "btn-voir">Voir les realisations <i class = "fa fa-arrow-right"></i> </button>
			</p>
		</div>
		<div class = "sections">
			<div class = "head">
				<i class = "fa fa-user" id = "i"></i>
				<span class = "titre">Realisations sur mesure</span>
			</div>
			<p class = "text">
				Nous realisons des oeuvres pour des particuliers en fonctions de leurs besoins<br>
				<button class = "btn-voir">Nous contacter <i class = "fa fa-arrow-right"></i></button>
			</p>
		</div>
	</div>
	<div class = "content">
		
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