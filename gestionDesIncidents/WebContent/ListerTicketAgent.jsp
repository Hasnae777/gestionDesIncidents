<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="gestionDesIncidents.Ticket"%><%@page import="gestionDesIncidents.TicketImpl"%><%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%><%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lister les tickets</title>

<style>
table {
    border-collapse: collapse;
    width: 60%;
    font-size: 14px;
    
}
#Roman { background-color: #D76B60; }
th, td {
    padding: 0px;
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

</head>




	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="The Page Description">
		<style type="text/css">@-ms-viewport{width: device-width;}</style>
		<title>Beetle - Home page</title>
		<link rel="stylesheet" href="css/layers.min.css" media="screen">
		<link rel="stylesheet" href="css/font-awesome.min.css" media="screen"> 
		<link rel="stylesheet" href="style.css" media="screen">
		<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css'>
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		<link rel="icon" href="favicon.ico">
		<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/apple-touch-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/apple-touch-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/apple-touch-icon-152x152.png">		
	</head>

	<body class="page">
	<%String login= request.getParameter("login");%>

		<header role="banner" class="transparent light">
			<div class="row">
				<div class="nav-inner row-content buffer-left buffer-right even clear-after">
					<div id="brand">
						<h1 class="reset"><!--<img src="img/logo.png" alt="logo">--><a href="home-01.html">ANRT agent</a></h1>
					</div><!-- brand -->
					<a id="menu-toggle" href="#"><i class="fa fa-bars fa-lg"></i></a>
					<nav>
						<ul class="reset" role="navigation">
							<li class="menu-item"><a href="http://localhost:8080/gestionDesIncidents/responsable.html">Acceuil</a></li>
						
							<li class="menu-item">
								<a href="http://localhost:8080/gestionDesIncidents/responsable.html">Ticket</a>
								<ul class="sub-menu">
									<li><a href="http://localhost:8080/gestionDesIncidents/ListerTicketAgent.jsp?login=<%=login%>">Lister les tickets</a></li>
									<li><a href="http://localhost:8080/gestionDesIncidents/CreerTicketAgent.jsp?employeId=<%=login%>">Creer un nouveau ticket</a></li>
								</ul>
							</li>
							<li class="menu-item"><a href="http://localhost:8080/gestionDesIncidents/confAgent.jsp?login=<%=login%>">Configuration</a></li>
							<li class="menu-item"><a href="http://localhost:8080/gestionDesIncidents/login.html">Deconnecter</a></li>
							
						</ul>
					</nav>
				</div><!-- row-content -->	
			</div><!-- row -->	
		</header>
<br><br><br>
        <%
	TicketImpl ticket= new TicketImpl();
	List<Ticket> tick= ticket.getTicket(login); 
	if(tick.isEmpty()){%>
	<div style="padding:20px;z-index: -1; " class="sign-up">
		<div>

		 <p>Il n'existe aucun Ticket</p>
	</div></div>
<%}

else {%>
	
	

 

<table border="1" width="100%" style="background-color: #F8F8F8  ;">


<tr >
	<th style="background-color:#EFEFEF;"></th><th style="background-color:#EFEFEF;" ></th>
	<th style="background-color:#EFEFEF;">Type</th><th style="background-color:#EFEFEF;">Categorie</th>
	<th style="background-color:#EFEFEF;">Priorite</th><th style="background-color:#EFEFEF;">Titre</th>
	<th style="background-color:#EFEFEF;">Lieu</th><th style="background-color:#EFEFEF;">Description</th>
	<th style="background-color:#EFEFEF;">Statut</th><th style="background-color:#EFEFEF;">Date d'ouverture</th>
	<th style="background-color:#EFEFEF;">Temps ideal</th><th style="background-color:#EFEFEF;">Date de fermeture</th>
	<th style="background-color:#EFEFEF;">Duree de la tache</th><th style="background-color:#EFEFEF;">Employe</th>
	<th style="background-color:#EFEFEF;">Nom du technicien</th>
</tr>
	
		<%for(Ticket e :tick){	int id=e.getIdTicket();
	String idTicket= Integer.toString(id);
	String technicien=e.getNomTech();
if(technicien==null){
		
		technicien="non encore affecte";
	}




 %>
	
	<tr>
			<td><a href="http://localhost:8080/gestionDesIncidents/ModifierTicketAgent.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>"><img src="modifier.png"></a>
			</td>
			<td>
			<a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'" ><img src="delete.png" ></a>     <div id="light" class="white_content">
			<p> Etes vous sur de vouloir supprimer?</p>
			
			<a href="http://localhost:8080/gestionDesIncidents/SupprimerTicketAgent.jsp?login=<%= login %>&idTicket=<%= idTicket %>" class="myButton">oui</a>
			   <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">non</a></div>
			    <div id="fade" class="black_overlay"></div>		
			
			
			
			</td>
			<td width="100px"><%= e.getType() %></td>
			<td width="100px"><%= e.getCategorie() %></td>
			
<% if(e.getPriorite().equals("Critique")){
				%><td style="background-color:#A80000  ;"><%= e.getPriorite() %></td>			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td width="100px"><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
			<td><%= e.getDureeTache() %></td>
			
			<td width="100px"><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			

			<%}
			else if(e.getPriorite().equals("Haut")){
				%><td style="background-color:red ;"><%= e.getPriorite() %></td>
				<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td width="100px"><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
			<td><%= e.getDureeTache() %></td>
			
			<td width="100px"><%= e.getEmployeId()%></td>
			<td><%= technicien %></td>
			
			
			<%	}
			else if(e.getPriorite().equals("Moyen")){
				%><td style="background-color:orange ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>
			<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td width="100px"><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td width="100px"><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			
			<%	}
	else if(e.getPriorite().equals("Bas")){
		%><td style="background-color:#00FF00 ;"><%= e.getPriorite() %></td>
		<td><%= e.getTitre() %></td>
<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td width="100px"><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
						<td><%= e.getDureeTache() %></td>
			
			<td width="100px"><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			
			<%	}
	else if(e.getPriorite().equals("� planifier")){
		%><td style="background-color:#CCFF99 ;"><%= e.getPriorite() %></td>
		<td><%= e.getTitre() %></td>
		<td><%= e.getLieu() %></td>
			<td><%= e.getDescription() %></td>
			<td width="100px"><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= e.getDureeTraitement() %></td>
			<td><%= e.getDateFermeture() %></td>
			<td><%= e.getDureeTache() %></td>

			<td width="100px"><%= e.getEmployeId() %></td>
			<td><%= technicien %></td>
			
			<%}	
		%>
		
		</tr>
		<% }} %>
	
		
	
</table>

		<footer role="contentinfo">
			<div class="row">
				<div class="row-content buffer clear-after">
					<section id="top-footer">
						<div class="widget column three"><!-- la class="widget" � forse generata utomaticamente da wp -->
							<h4>Menu</h4>
							<ul class="plain">
								<li><a href="home-01.html">Acceuil</a></li>
								<li><a href="works-3-columns.html">Tickets</a></li>
								<li><a href="blog-4-columns-masonry.html">Configuration</a></li>
							</ul>
						</div>
														
										
						<div class="widget meta-social column three">
							<h4>Follow Us</h4>
							<ul class="inline">
								<li><a href="https://twitter.com/?lang=fr" class="twitter-share border-box"><i class="fa fa-twitter fa-lg"></i></a></li>
								<li><a href="https://www.facebook.com/" class="facebook-share border-box"><i class="fa fa-facebook fa-lg"></i></a></li>
								<li><a href="https://fr.pinterest.com/" class="pinterest-share border-box"><i class="fa fa-pinterest fa-lg"></i></a></li>
							</ul>
						</div>														
					</section><!-- top-footer -->
					<section id="bottom-footer">
						<p class="keep-left">&copy; 2016 <a href="http://anrt.ma/" alt="Mokaine Lab">ANRT</a>. All Rights Reserved.</p>
					</section><!-- bottom-footer -->			
				</div><!-- row-content -->	
			</div><!-- row -->	
		</footer>

		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>		
		<script src="js/plugins.js"></script>
		<script src="js/beetle.js"></script>

	</body>

</html>