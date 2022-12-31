<%@page import = "java.sql.ResultSet" %>
<%@page import = "conn.ConnexionBD" %>
<%@page import = "java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Artisan - contact</title>
<link href="style/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel = "stylesheet" href = "style/style.css">
</head>
<body>
<%@ include file = "menu.jsp" %>
<div class= "slide2">
	<br>
		<h1>Nous contacter</h1>
	</div>
<div class = "contactSpace">
<br><br>
<% 
if(request.getAttribute("erreur") != null){
%>
<div class="msg"><%= request.getAttribute("erreur") %></div>
<%
}
%>
  <form method = "post" action = "/artisan/Contact">
	<input type = "text" name = "nom" placeholder = "Votre nom" class = "form"><br>
	<input type = "email" name = "email" placeholder = "Votre email" class = "form"><br>
	<textarea placeholder = "Message" name = "message" class = "form message"></textarea><br>
	<input type = "submit" value = "Envoyer" class = "formBtn">
  </form>
 </div>
 
<%@ include file = "footer.jsp" %>
</body>
</html>