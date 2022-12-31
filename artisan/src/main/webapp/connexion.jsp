<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Artisan - Connexion</title>
<link href="style/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel = "stylesheet" href = "style/style.css">
</head>
<body>
<%@ include file = "menu.jsp" %>

	<div class = "boxCon">
	<h2>Connexion</h2>
	 <form method = "post" action = "/artisan/Connexion">
		<input type = "text" name = "user" placeholder = "Votre nom d'utilisateur" class = "form"><br>
		<input type = "password" name = "password" placeholder = "Votre mot de passe" class = "form"><br>
		<input type = "submit" value = "Se connecter" class = "formBtn">
	  </form>
	  <% 
		if(request.getAttribute("erreur") != null){
		%>
		<div class="error"><%= request.getAttribute("erreur") %></div>
		<%
		}
	  %>
	</div>

<%@ include file = "footer.jsp" %>
</body>
</html>