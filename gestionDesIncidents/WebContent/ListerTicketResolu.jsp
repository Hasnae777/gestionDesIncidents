<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="gestionDesIncidents.Ticket"%><%@page import="gestionDesIncidents.TicketImpl"%><%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%><%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lister les tickets</title>
<link rel="stylesheet" href="creerUnTicket.css">

<style>
table {
    border-collapse: collapse;
    width: 100%;
    
    
}
#Roman { background-color: #D76B60; }
th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    border: thin solid #808080;
    
}

tr:hover{background-color:#fff}
</style>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="responsable.css">

</head>
<body>
<link rel="stylesheet" href="responsable.css">
<style>
body {
   background-image: url("login.jpg");
}
.deconnecter {
	-moz-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	-webkit-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5));
	background:-moz-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-webkit-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-o-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-ms-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5',GradientType=0);
	background-color:#79bbff;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #84bbf3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 30px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
}
.deconnecter:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff));
	background:-moz-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-webkit-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-o-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-ms-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff',GradientType=0);
	background-color:#378de5;
}
.deconnecter:active {
	position:relative;
	top:1px;
}
</style>


</head>
<body>

		 <div id="header">
        <h1><strong>Administration</strong>Workspace<a href="http://localhost:8080/gestionDesIncidents/login.html" style="position:relative; left:1200px;" class="deconnecter">déconnecter</a>
        </h1>
        </div>
        
      <ul class="main-navigation" >
  <li><a href="http://localhost:8080/gestionDesIncidents/responsable.html" ><b>Acceuil</b></a></li>
  <li><a href="http://localhost:8080/gestionDesIncidents/responsable.html"><b>Ticket</b></a>
    <ul>
      <li><a href="http://localhost:8080/gestionDesIncidents/ListerLesTickets.jsp">Lister les tickets</a></li>
      <li><a href="http://localhost:8080/gestionDesIncidents/creerUnTicket.html">Creer un nouveau ticket</a></li>
      <li><a href="#">Base de connaissance</a></li>
      
     
   
    </ul>
  </li>
  <li><a href="http://localhost:8080/gestionDesIncidents/responsable.html"><b>Gestion</b></a>
    <ul>
      <li><a href="#">Inventaires</a><ul>
          <li><a href="#">Consulter la liste des Inventaires</a></li>
          <li><a href="#">Ajouter un inventaire</a></li>
        </ul></li>
      <li><a href="#">Techniciens</a>
      <ul>
          <li><a href="#">Consulter la liste des techniciens</a></li>
        </ul></li>
      <li><a href="#">Reservations</a>
        <ul>
          <li><a href="#">Afficher le planning</a></li>
        </ul>
      </li>
    </ul>
  </li>
  <li><a href="#"><b>Rapports</b></a></li>
  <li><a href="#"><b>Configuration</b></a></li>
  <li><a href="#"><b>Contact Us</b></a></li>
</ul>
<br><br>

<%String technicien=request.getParameter("nom");
TicketImpl ticket= new TicketImpl();
List<Ticket> tick= ticket.rechResolu(); 
	if(tick.isEmpty()){%>
		<div style="padding:20px;z-index: -1; " class="sign-up">
			<div>

 		 <p>Il n'existe aucun Ticket</p>
		</div></div>
	<%}
	
	else {%>

        

<table border="1" width="100%" id="marilyn">


<p class="sign-up">
<tr class="sign-up">
	<th id="Roman">ID</th><th id="Roman">Type</th><th id="Roman">Categorie</th><th id="Roman">Urgence</th><th id="Roman">Impact</th><th id="Roman">Priorite</th><th id="Roman">Titre</th><th id="Roman">Lieu</th><th id="Roman">Description</th><th id="Roman">Statut</th><th id="Roman">Date d'ouverture</th><th id="Roman">Date de fermeture</th><th id="Roman">Employe</th><th id="Roman">Nom du technicien</th>
</tr>
	<%
	
	if(technicien==null){
		
		technicien="non encore affecte";
	}
	

	
	
	for(Ticket e :tick){	int id=e.getIdTicket();
	String idTicket= Integer.toString(id);

 %>
	<tr>
			<td> <a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>"><%= e.getIdTicket() %></td>
			<td><%= e.getType() %></td>
			<td><%= e.getCategorie() %></td>
			<td><%= e.getUrgence() %></td>
			<td><%= e.getImpact() %></td>
			<td><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDateFermeture() %></td>
			<td><%= e.getLogin() %></td>
			<td><%= technicien %></td>
			
		</tr>
		<% }} %>
	
		
	</p>
</table>
</body>
</html>