<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="gestionDesIncidents.Ticket"%><%@page import="gestionDesIncidents.TicketImpl"%><%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%><%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lister les tickets</title>
<link rel="stylesheet" href="login.css">

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

    
    .black_overlay{
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: black;
        z-index:1001;
        -moz-opacity: 0.8;
        opacity:.80;
        filter: alpha(opacity=80);
    }
    .white_content {
        display: none;
        position: absolute;
        top: 25%;
        left: 25%;
        width: 50%;
        height: 50%;
        padding: 16px;
        border: 16px solid orange;
        background-color: white;
        z-index:1002;
        overflow: auto;
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

</style>


</head>
<body>

<%String login= request.getParameter("login");%>
<div id="header">
		        <img  src="hat.png">
		 
        <h1 style="position: relative;top:-100px;left: 130px;"><strong>Technicien&nbsp;</strong>Workspace<a href="http://localhost:8080/gestionDesIncidents/login.html" style="position:relative; left:1200px;" class="deconnecter">d�connecter</a>
        </h1>
       

        </div>
        
      <ul style="position: relative;top:-100px; " class="main-navigation" >
  <li><a href="http://localhost:8080/gestionDesIncidents/Technicien.jsplogin=<%= login %>" ><b>Acceuil</b></a></li>
  <li><a href="http://localhost:8080/gestionDesIncidents/Technicien.jsplogin=<%= login %>"><b>Ticket</b></a>
    <ul>
      <li><a href="http://localhost:8080/gestionDesIncidents/ConsulterTicketDTechR.jsp?login=<%=login %>">Lister les tickets non resolus</a></li>
      <li><a href="http://localhost:8080/gestionDesIncidents/ConsulterTicketDTechN.jsp?login=<%= login %>">Lister les nouveaux tickets</a></li>
      
      <li><a href="http://localhost:8080/gestionDesIncidents/CreerBDC.html">Ajouter dans la base de connaissance</a></li>
      <li><a href="http://localhost:8080/gestionDesIncidents/ListerBDC.jsp">Consulter la base de connaissance</a></li>
      
     
   
    </ul>
  </li>
    <li><a href="http://localhost:8080/gestionDesIncidents/Technicien.jsplogin=<%= login %>"><b>Intervention</b></a>
  <ul>
      <li><a href="http://localhost:8080/gestionDesIncidents/consulterTicketTech.jsp?login=<%= login %>">Consulter les tickets</a>
  </ul>
  
  <li><a href="http://localhost:8080/gestionDesIncidents/Technicien.jsplogin=<%= login %>"><b>Gestion</b></a>
    <ul>
      <li><a href="#">Inventaires</a>
      	<ul>
          	<li><a href="http://localhost:8080/gestionDesIncidents/Technicien.jsplogin=<%= login %>">Consulter la liste des Inventaires</a>
          		<ul>
          			<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesMateriels.jsp">Par materiel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesLogiciels.jsp">Par logiciel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesEquipementsReseau.jsp">Par equipement reseau</a></li>
          		</ul>
          	</li>
          	<li><a href="http://localhost:8080/gestionDesIncidents/Technicien.jsplogin=<%= login %>">Ajouter un inventaire</a>
          		<ul>
          			<li><a href="http://localhost:8080/gestionDesIncidents/CreerMateriel.html">Materiel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/CreerLogiciel.html">Logiciel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/CreerLesEquipementsReseau.html">Equipement reseau</a></li>
          		</ul>
          	</li>
       	</ul>
       </li>
     
    </ul>
    
  </li>
  <li><a href="http://localhost:8080/gestionDesIncidents/confTech.jsplogin=<%= login %>"><b>Configuration</b></a></li>
</ul>
<br><br>

<%
	String technicien=request.getParameter("login");
	TicketImpl ticket= new TicketImpl();
	List<Ticket> tick= ticket.getTicketTechNonR(technicien); 
	if(technicien==null){
		
		technicien="non encore affecte";
	}
	if(tick.isEmpty()){%>
	<div style="padding:20px;" class="sign-up">
	<p><div>

	  <p>La liste est vide, vous n'avez aucun ticket!, merci d'utiliser notre systeme d'assistance.</p>
	</div></div>
	
	<%}
	else {
	%>
        

<table border="1" width="100%" style="background-color: #F8F8F8  ;">


<tr class="sign-up">
	<th id="Roman">ID</th><th id="Roman">Type</th><th id="Roman">Categorie</th><th id="Roman">Urgence</th><th id="Roman">Impact</th><th id="Roman">Priorite</th><th id="Roman">Titre</th><th id="Roman">Lieu</th><th id="Roman">Description</th><th id="Roman">Statut</th><th id="Roman">Date d'ouverture</th><th id="Roman">Employe</th><th id="Roman">Nom du technicien</th><th></th>
</tr>
	
	
	<tr>
	<%for(Ticket e :tick){	int id=e.getIdTicket();
	String idTicket= Integer.toString(id);
	Date date= new java.util.Date();
	 Timestamp dateDebut=new Timestamp(date.getTime()- (60 * 60 * 1000));
	 
 %>
	<tr>
			<td> <a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>"><%= e.getIdTicket() %></td>
			<td><%= e.getType() %></td>
			<td><%= e.getCategorie() %></td>
			<td><%= e.getUrgence() %></td>
			<td><%= e.getImpact() %></td>
			<% if(e.getPriorite().equals("Critique")){
				%><td style="background-color:#A80000  ;"><%= e.getPriorite() %></td>
				<td><%= e.getTitre() %></td>		
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			<td>
			
			
		<p><a style="color:#FF0066;" href = "http://localhost:8080/gestionDesIncidents/PrisEnChargeNR.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">Prendre en charge</a>
   
			
			

			<%}
			else if(e.getPriorite().equals("Haut")){
				%><td style="background-color:red ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>		
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			<td>
    	<p><a style="color:#FF0066;" href = "http://localhost:8080/gestionDesIncidents/PrisEnChargeNR.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">Prendre en charge</a>
   
			
			
		<%	}
			else if(e.getPriorite().equals("Moyen")){
				%><td style="background-color:orange ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>		
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			<td>
    	<p><a style="color:#FF0066;" href = "http://localhost:8080/gestionDesIncidents/PrisEnChargeNR.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">Prendre en charge</a>
   
			
			

		<%	}
			else if(e.getPriorite().equals("Bas")){
				%><td style="background-color:#00FF00 ;"><%= e.getPriorite() %></td>
				<td><%= e.getTitre() %></td>		
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			<td>
    	<p><a style="color:#FF0066;" href = "http://localhost:8080/gestionDesIncidents/PrisEnChargeNR.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">Prendre en charge</a>
   
			
			

		<%	}
			else if(e.getPriorite().equals("� planifier")){
				%><td style="background-color:#CCFF99 ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>		
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			<td>
			
    	<p><a style="color:#FF0066;" href = "http://localhost:8080/gestionDesIncidents/PrisEnChargeNR.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">Prendre en charge</a>
   
			
			

		<%}	
		%>

			</td>
		</tr>
		<% }} %>
	
		
	</p>
</table>
</body>
</html>