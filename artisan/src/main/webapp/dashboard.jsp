<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.ResultSet" %>
<%@page import = "conn.ConnexionBD" %>
<%@page import = "java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Artisan - Dashboard</title>
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

<div class = "spaceProduits">
	<div class = "spaceAddProduit">
	<br>
	<div class = "marges">
	<h2>Nouvelle oeuvre</h2>
	 <form method = "post" enctype = "multipart/form-data" action = "/artisan/PostArticle">
		<input type = "text" name = "nom" placeholder = "Nom de l'oeuvre" class = "form"><br>
		<input type = "file" name = "photo" class = "form"><br>
		<input type = "submit" value = "Publier" class = "formBtn">
	  </form>
	  
	  <% 
		if(request.getAttribute("erreur") != null){
		%>
		<div class = "msg"><%= request.getAttribute("erreur") %></div>
		<%
		}
	  %>
	 </div>
	</div>
	
	<div class = "spaceShowProduit">
	<br>
	<div class = "marges">
	<h2>Oeuvre</h2>
		<table border = "1">
			<tr>
				<th>Id</th>
				<th>Photo</th>
				<th>Nom</th>
			</tr>

			<%
				Connection conn = ConnexionBD.seConnecter();
				ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM article");
				
				while(rs.next()){
			%>
			 <tr>
				<td><%= rs.getInt(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><img src="images/<%= rs.getString(3) %>"></td>
			</tr>
			<% 
				}
			%>
		</table>
	</div>
	</div>
</div>

</body>
</html>