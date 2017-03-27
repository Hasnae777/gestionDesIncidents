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
<html lang="en">



	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="The Page Description">
		<style type="text/css">@-ms-viewport{width: device-width;}</style>
		<title>Espace Technicien</title>
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
						<h1 class="reset"><!--<img src="img/logo.png" alt="logo">--><a href="home-01.html">ANRT technicien</a></h1>
					</div><!-- brand -->
					<a id="menu-toggle" href="#"><i class="fa fa-bars fa-lg"></i></a>
					<nav>
						<ul class="reset" role="navigation">
							<li class="menu-item"><a href="http://localhost:8080/gestionDesIncidents/Technicien.jsplogin=<%= login %>">Acceuil</a></li>
						
							<li class="menu-item">
								<a href="http://localhost:8080/gestionDesIncidents/Technicien.jsplogin=<%= login %>">Ticket</a>
								<ul class="sub-menu">
									<li><a href="http://localhost:8080/gestionDesIncidents/ConsulterTicketDTechR.jsp?login=<%=login %>">Lister les tickets non resolus</a></li>
									<li><a href="http://localhost:8080/gestionDesIncidents/ConsulterTicketDTechN.jsp?login=<%= login %>">Lister les nouveaux tickets</a></li>
									<li><a href="http://localhost:8080/gestionDesIncidents/CreerBDC.html">Ajouter dans la base de connaissance</a></li>
									<li><a href="http://localhost:8080/gestionDesIncidents/ListerBDC.jsp">Consulter la base de connaissance</a></li>
								</ul>
							</li>
							<li class="menu-item">
								<a href="http://localhost:8080/gestionDesIncidents/Technicien.jsplogin=<%= login %>">Intervention</a>
								<ul class="sub-menu">
									<li><a href="http://localhost:8080/gestionDesIncidents/consulterTicketTech.jsp?login=<%= login %>">Consulter les tickets</a></li>
								</ul>
							</li>
													<li class="menu-item">
  								<a href="http://localhost:8080/gestionDesIncidents/Technicien.jsplogin=<%= login %>"><b>Gestion</b></a>
								<ul class="sub-menu">
									<li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Inventaires</a>
									<ul class="sub-menu">
          								<li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Consulter la liste des Inventaires</a>
     								 	<ul class="sub-menu">
										<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesMateriels.jsp?login=<%= login %>">Par materiel</a></li>
          								<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesLogiciels.jsp?login=<%= login %>">Par logiciel</a></li>
          								<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesEquipementsReseau.jsp?login=<%= login %>">Par equipement reseau</a></li>
          								</ul>
     								 	
     								 	</li> 
     								 	<li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Ajouter un inventaire</a>
     								 	<ul class="sub-menu">
          								
												<li><a href="http://localhost:8080/gestionDesIncidents/CreerMateriel.html">Materiel</a></li>
          										<li><a href="http://localhost:8080/gestionDesIncidents/CreerLogiciel.html">Logiciel</a></li>
          										<li><a href="http://localhost:8080/gestionDesIncidents/CreerLesEquipementsReseau.html">Equipement reseau</a></li>
          									 
     								 		
     								  </ul>
     								  
     								  
									</li>
								</ul></ul>
							</li>
							<li class="menu-item"><a href="http://localhost:8080/gestionDesIncidents/login.html">Deconnecter</a></li>
							
						</ul>
					</nav>
				</div><!-- row-content -->	
			</div><!-- row -->	
		</header>

		<main role="main">
				<div class="intro-item" style="background-image: url(login.jpg);">
		<br><br>
			<%
	String technicien=request.getParameter("login");
	TicketImpl ticket= new TicketImpl();
	List<Ticket> tick= ticket.getTicketTechN(technicien); 
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
	<th style="background-color:#EFEFEF;">ID</th><th style="background-color:#EFEFEF;">Type</th>
	<th style="background-color:#EFEFEF;">Categorie</th><th style="background-color:#EFEFEF;">Urgence</th>
	<th style="background-color:#EFEFEF;">Impact</th><th style="background-color:#EFEFEF;">Priorite</th>
	<th style="background-color:#EFEFEF;">Titre</th><th style="background-color:#EFEFEF;">Lieu</th>
	<th style="background-color:#EFEFEF;">Description</th><th style="background-color:#EFEFEF;">Statut</th>
	<th style="background-color:#EFEFEF;">Date d'ouverture</th><th style="background-color:#EFEFEF;">Nom du technicien</th>
	<th style="background-color:#EFEFEF;">Employe</th><th style="background-color:#EFEFEF;" ></th>
</tr>
	
			
			<tr>
	<%for(Ticket e :tick){	int id=e.getIdTicket();
	String idTicket= Integer.toString(id);
	Date date= new java.util.Date();
	 Timestamp dateDebut=new Timestamp(date.getTime()- (60 * 60 * 1000));
	 
	
 %>
	<tr>
			<td width="60px"> <a href="http://localhost:8080/gestionDesIncidents/ModifierTicket.jsp?idTicket=<%= idTicket %>&technicien=<%= technicien %>"><%= e.getIdTicket() %></td>
			<td width="108px"><%= e.getType() %></td>
			<td width="110px"><%= e.getCategorie() %></td>
			<td width="104px"><%= e.getUrgence() %></td>
			<td width="100px"><%= e.getImpact() %></td>
	<% if(e.getPriorite().equals("Critique")){
				%><td width="100px" style="background-color:#A80000  ;"><%= e.getPriorite() %></td>
				<td><%= e.getTitre() %></td>		
			<td><%= e.getLieu() %></td>
			<td width="300px"><%= e.getDescription() %></td>
			<td width="108px"><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= technicien %></td>
						<td width="100px"><%= e.getEmployeId() %></td>
			
			<td>
			
			
		<p><a href = "http://localhost:8080/gestionDesIncidents/PrisEnChargeN.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"><img src="tournevise.png" ></a>
   
			
			

			<%}
			else if(e.getPriorite().equals("Haut")){
				%><td width="100px" style="background-color:red ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>		
			<td><%= e.getLieu() %></td>
			<td width="128px"><%= e.getDescription() %></td>
			<td width="108px"><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= technicien %></td>
						<td width="100px"><%= e.getEmployeId() %></td>
			
			<td>
		<p><a href = "http://localhost:8080/gestionDesIncidents/PrisEnChargeN.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"><img src="tournevise.png" ></a>
   
			
			
		<%	}
			else if(e.getPriorite().equals("Moyen")){
				%><td width="100px" style="background-color:orange ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>		
			<td><%= e.getLieu() %></td>
			<td width="128px"><%= e.getDescription() %></td>
			<td width="108px"><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= technicien %></td>
						<td width="100px"><%= e.getEmployeId() %></td>
			
			<td>
		<p><a href = "http://localhost:8080/gestionDesIncidents/PrisEnChargeN.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"><img src="tournevise.png" ></a>
   
			
			

		<%	}
			else if(e.getPriorite().equals("Bas")){
				%><td width="100px" style="background-color:#00FF00 ;"><%= e.getPriorite() %></td>
				<td><%= e.getTitre() %></td>		
			<td><%= e.getLieu() %></td>
			<td width="128px"><%= e.getDescription() %></td>
			<td width="108px"><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= technicien %></td>
						<td width="100px"><%= e.getEmployeId() %></td>
			
			<td>
		<p><a href = "http://localhost:8080/gestionDesIncidents/PrisEnChargeN.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"><img src="tournevise.png" ></a>
   
			
			

		<%	}
			else if(e.getPriorite().equals("à planifier")){
				%><td width="100px" style="background-color:#CCFF99 ;"><%= e.getPriorite() %></td>
			<td><%= e.getTitre() %></td>		
			<td><%= e.getLieu() %></td>
			<td width="128px"><%= e.getDescription() %></td>
			<td width="108px"><%= e.getStatut() %></td>
			<td><%= e.getDateOuverture() %></td>
			<td><%= technicien %></td>
						<td width="100px"><%= e.getEmployeId() %></td>
			
			<td>
			
		<p><a href = "http://localhost:8080/gestionDesIncidents/PrisEnChargeN.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"><img src="tournevise.png" ></a>
   
			
			

		<%}	
		%>
			
			</td>
		</tr>
		<% }} %>
			</table>
			
			
			
				<br><br><br></div></main><!-- main -->

		<footer role="contentinfo">
			<div class="row">
				<div class="row-content buffer clear-after">
					<section id="top-footer">
						<div class="widget column three"><!-- la class="widget" è forse generata utomaticamente da wp -->
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