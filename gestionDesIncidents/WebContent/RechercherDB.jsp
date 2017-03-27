<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.*"%><%@page import="gestionDesIncidents.Ticket"%><%@page import="gestionDesIncidents.TicketImpl"%><%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%><%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #f29c93;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f29c93;
	box-shadow:inset 0px 1px 0px 0px #f29c93;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #fe1a00), color-stop(1, #ce0100));
	background:-moz-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background:-webkit-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background:-o-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background:-ms-linear-gradient(top, #fe1a00 5%, #ce0100 100%);
	background:linear-gradient(to bottom, #fe1a00 5%, #ce0100 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fe1a00', endColorstr='#ce0100',GradientType=0);
	background-color:#fe1a00;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #d83526;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ce0100), color-stop(1, #fe1a00));
	background:-moz-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background:-webkit-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background:-o-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background:-ms-linear-gradient(top, #ce0100 5%, #fe1a00 100%);
	background:linear-gradient(to bottom, #ce0100 5%, #fe1a00 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100', endColorstr='#fe1a00',GradientType=0);
	background-color:#ce0100;
}
.myButton:active {
	position:relative;
	top:1px;
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
        <h1><strong>Agent</strong>Workspace<a href="http://localhost:8080/gestionDesIncidents/login.html" style="position:relative; left:1200px;" class="deconnecter">déconnecter</a>
        </h1>
        </div>
              <ul class="main-navigation" >
        
<li><a href="http://localhost:8080/gestionDesIncidents/responsable.html" ><b>Acceuil</b></a></li>
  <li><a href="http://localhost:8080/gestionDesIncidents/responsable.html"><b>Ticket</b></a>
    <ul>
      <li><a href="http://localhost:8080/gestionDesIncidents/ListerTicketAgent.jsp?login=<%=login%>">Lister les tickets</a></li>
      <li><a href="http://localhost:8080/gestionDesIncidents/CreerUnTicketFormulaire.jsp?employeId=<%=login%>" action="creerUnTicket.html" method="post">Creer un nouveau ticket</a></li>
      
     
   
    </ul>
  </li>

  <li><a href="http://localhost:8080/gestionDesIncidents/confAgent.jsp?login=<%=login%>"><b>Configuration</b></a></li>
</ul>
<br><br>

<%
String loop=request.getParameter("loop");

String dans=request.getParameter("dans");
String par=request.getParameter("par");
TicketImpl ticket= new TicketImpl();
List<Ticket> tick= ticket.getTicketGroupBy(par,login);

if(tick.isEmpty()){%>

<div style="padding:20px;z-index: -1; " class="sign-up">
	<div>

	 <p>Il n'existe aucun Ticket</p>
</div></div>
<%}

else {%><%=dans%><%=loop%>
<table border="1" width="100%" style="background-color: #F8F8F8 ;">


<tr class="sign-up">
	<th id="Roman" style="width: 200px;"></th><th id="Roman">ID</th><th id="Roman">Type</th><th id="Roman">Categorie</th><th id="Roman">Urgence</th><th id="Roman">Impact</th><th id="Roman">Priorite</th><th id="Roman">Titre</th><th id="Roman">Lieu</th><th id="Roman">Description</th><th id="Roman">Statut</th><th id="Roman">Date d'ouverture</th><th id="Roman">Cible temps de résolution</th><th id="Roman">Date de fermeture</th><th id="Roman">Duree de la tache</th><th id="Roman">Employe</th><th id="Roman">Nom du technicien</th>
</tr>
<%for(Ticket e :tick){	int id=e.getIdTicket();
	String idTicket= Integer.toString(id);
	String technicien=e.getNomTech();
if(technicien==null){
		
		technicien="non encore affecte";
	}


if("ID".equals(dans) && loop.equals(idTicket)){
	
		
	
 %><%=loop%>
<tr>
			<td><INPUT type="checkbox" name="choix"><img src="modifier.png"><a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>">Modifier</a>
			&nbsp;&nbsp;<img src="delete.png" ><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'" >Effacer</a>     <div id="light" class="white_content">
			<p> Etes vous sur de vouloir supprimer?</p>
			<br>
			<a href="http://localhost:8080/gestionDesIncidents/SupprimerTicketAgent.jsp?login=<%= login %>&idTicket=<%= idTicket %>" class="myButton">oui</a>
			   <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">non</a></div>
			    <div id="fade" class="black_overlay"></div>		
			
			
			
			</td>
			<td> <a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>"><%= e.getIdTicket() %></td>
			<td><%= e.getType() %></td>
			<td><%= e.getCategorie() %></td>
			<td><%= e.getUrgence() %></td>
			<td><%= e.getImpact() %></td>
<% if(e.getPriorite().equals("Critique")){
				%><td style="background-color:#A80000  ;"><%= e.getPriorite() %></td>			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			

			<%}
			else if(e.getPriorite().equals("Haut")){
				%><td style="background-color:red ;"><%= e.getPriorite() %></td>
				<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId()%></td>
			<td><%= technicien %></td>
			
			
			<%	}
			else if(e.getPriorite().equals("Moyen")){
				%><td style="background-color:orange ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			
			<%	}
	else if(e.getPriorite().equals("Bas")){
		%><td style="background-color:#00FF00 ;"><%= e.getPriorite() %></td>
		<td><%= e.getTitre() %></td>
<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			
			<%	}
	else if(e.getPriorite().equals("à planifier")){
		%><td style="background-color:#CCFF99 ;"><%= e.getPriorite() %></td>
		<td><%= e.getTitre() %></td>
		<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
			<td><%= e.getDureeTache() %></td>

			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			<%}	
		%>
		
		</tr>
<%	}
else if(dans=="Titre"){
	if(loop.equals(e.getTitre())){
		
		%>
		<tr>
			<td><INPUT type="checkbox" name="choix"><img src="modifier.png"><a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>">Modifier</a>
			&nbsp;&nbsp;<img src="delete.png" ><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'" >Effacer</a>     <div id="light" class="white_content">
			<p> Etes vous sur de vouloir supprimer?</p>
			<br>
			<a href="http://localhost:8080/gestionDesIncidents/SupprimerTicketAgent.jsp?login=<%= login %>&idTicket=<%= idTicket %>" class="myButton">oui</a>
			   <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">non</a></div>
			    <div id="fade" class="black_overlay"></div>		
			
			
			
			</td>
		<td> <a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>"><%= e.getIdTicket() %></td>
			<td><%= e.getType() %></td>
			<td><%= e.getCategorie() %></td>
			<td><%= e.getUrgence() %></td>
			<td><%= e.getImpact() %></td>
<% if(e.getPriorite().equals("Critique")){
				%><td style="background-color:#A80000  ;"><%= e.getPriorite() %></td>			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			

			<%}
			else if(e.getPriorite().equals("Haut")){
				%><td style="background-color:red ;"><%= e.getPriorite() %></td>
				<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId()%></td>
			<td><%= technicien %></td>
			
			
			<%	}
			else if(e.getPriorite().equals("Moyen")){
				%><td style="background-color:orange ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			
			<%	}
	else if(e.getPriorite().equals("Bas")){
		%><td style="background-color:#00FF00 ;"><%= e.getPriorite() %></td>
		<td><%= e.getTitre() %></td>
<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			
			<%	}
	else if(e.getPriorite().equals("à planifier")){
		%><td style="background-color:#CCFF99 ;"><%= e.getPriorite() %></td>
		<td><%= e.getTitre() %></td>
		<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
			<td><%= e.getDureeTache() %></td>

			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			<%}	
		%>
		
		</tr>
		<%}}
else if(dans=="Employé"){
	if(loop.equals(e.getEmployeId())){
			
		%>
		<tr>
			<td><INPUT type="checkbox" name="choix"><img src="modifier.png"><a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>">Modifier</a>
			&nbsp;&nbsp;<img src="delete.png" ><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'" >Effacer</a>     <div id="light" class="white_content">
			<p> Etes vous sur de vouloir supprimer?</p>
			<br>
			<a href="http://localhost:8080/gestionDesIncidents/SupprimerTicketAgent.jsp?login=<%= login %>&idTicket=<%= idTicket %>" class="myButton">oui</a>
			   <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">non</a></div>
			    <div id="fade" class="black_overlay"></div>		
			
			
			
			</td>
		<td> <a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>"><%= e.getIdTicket() %></td>
			<td><%= e.getType() %></td>
			<td><%= e.getCategorie() %></td>
			<td><%= e.getUrgence() %></td>
			<td><%= e.getImpact() %></td>
<% if(e.getPriorite().equals("Critique")){
				%><td style="background-color:#A80000  ;"><%= e.getPriorite() %></td>			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			

			<%}
			else if(e.getPriorite().equals("Haut")){
				%><td style="background-color:red ;"><%= e.getPriorite() %></td>
				<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId()%></td>
			<td><%= technicien %></td>
			
			
			<%	}
			else if(e.getPriorite().equals("Moyen")){
				%><td style="background-color:orange ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			
			<%	}
	else if(e.getPriorite().equals("Bas")){
		%><td style="background-color:#00FF00 ;"><%= e.getPriorite() %></td>
		<td><%= e.getTitre() %></td>
<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			
			<%	}
	else if(e.getPriorite().equals("à planifier")){
		%><td style="background-color:#CCFF99 ;"><%= e.getPriorite() %></td>
		<td><%= e.getTitre() %></td>
		<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
			<td><%= e.getDureeTache() %></td>

			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			<%}	
		%>
		
		</tr>
		
		<%}}
else if(dans=="Nom du technicien"){
	if(loop.equals(technicien)){
		
		
		
		
		
		%>

<tr>
			<td><INPUT type="checkbox" name="choix"><img src="modifier.png"><a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>">Modifier</a>
			&nbsp;&nbsp;<img src="delete.png" ><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'" >Effacer</a>     <div id="light" class="white_content">
			<p> Etes vous sur de vouloir supprimer?</p>
			<br>
			<a href="http://localhost:8080/gestionDesIncidents/SupprimerTicketAgent.jsp?login=<%= login %>&idTicket=<%= idTicket %>" class="myButton">oui</a>
			   <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">non</a></div>
			    <div id="fade" class="black_overlay"></div>		
			
			
			
			</td>
		<td> <a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>"><%= e.getIdTicket() %></td>
			<td><%= e.getType() %></td>
			<td><%= e.getCategorie() %></td>
			<td><%= e.getUrgence() %></td>
			<td><%= e.getImpact() %></td>
<% if(e.getPriorite().equals("Critique")){
				%><td style="background-color:#A80000  ;"><%= e.getPriorite() %></td>			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			

			<%}
			else if(e.getPriorite().equals("Haut")){
				%><td style="background-color:red ;"><%= e.getPriorite() %></td>
				<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId()%></td>
			<td><%= technicien %></td>
			
			
			<%	}
			else if(e.getPriorite().equals("Moyen")){
				%><td style="background-color:orange ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			
			<%	}
	else if(e.getPriorite().equals("Bas")){
		%><td style="background-color:#00FF00 ;"><%= e.getPriorite() %></td>
		<td><%= e.getTitre() %></td>
<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			
			<%	}
	else if(e.getPriorite().equals("à planifier")){
		%><td style="background-color:#CCFF99 ;"><%= e.getPriorite() %></td>
		<td><%= e.getTitre() %></td>
		<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
			<td><%= e.getDureeTache() %></td>

			<td><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			<%}	
		%>
		
		</tr>




<%}}%>

<%}}%>
</body>
</html>