<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@page import="gestionDesIncidents.Ticket"%><%@page import="gestionDesIncidents.TicketImpl"%><%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%><%@page import="java.util.Iterator"%><%@page import="gestionDesIncidents.SingletonConnection"%>
<%@page import="java.sql.SQLException"%><%@page import="java.sql.*"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<link rel="stylesheet" href="creerUnTicket.css">
<style>
label
{
	display: block;
	width: 150px;
	float: left;
}

</style>
<%String login=request.getParameter("login"); 
String nomTech = request.getParameter("technicien");
String idTicket= request.getParameter("idTicket");
Connection conn=SingletonConnection.getConnection();
try {PreparedStatement ps=conn.prepareStatement("select * from ticket where idTicket=?");
ps.setString(1, idTicket);
ResultSet rs=ps.executeQuery();
while(rs.next()){
	String type=rs.getString("type");
	String categorie=rs.getString("categorie");
	String urgence=rs.getString("urgence");
	String impact= rs.getString("impact");
	String priorite=rs.getString("priorite");
	String titre =rs.getString("titre");
	String lieu =rs.getString("lieu");
	String description =rs.getString("description");
	String statut =rs.getString("statut");
	Date dateOuverture= rs.getDate("dateOuverture");
	Date DateFermeture=rs.getDate("dateFermeture");
	String EmployeId=rs.getString("EmployeId");

	String ta="";
	if(type=="incident"){ 
		ta="Demande de service";} else {ta="Incident";}


	%>
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

		<header role="banner" class="transparent light">
			<div class="row">
				<div class="nav-inner row-content buffer-left buffer-right even clear-after">
					<div id="brand">
						<h1 class="reset"><!--<img src="img/logo.png" alt="logo">--><a href="home-01.html">ANRT</a></h1>
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
							<li class="menu-item"><a href="http://localhost:8080/gestionDesIncidents/confAgent.jsp?login=<%= login%>">Configuration</a></li>
							<li class="menu-item"><a href="http://localhost:8080/gestionDesIncidents/login.html">Deconnecter</a></li>
							
						</ul>
					</nav>
				</div><!-- row-content -->	
			</div><!-- row -->	
		</header>
		<main role="main">
		<div class="intro-item" style="background-image: url(login.jpg);">
						
		<br>			
<div >		
<form class="sign-up" action="http://localhost:8080/gestionDesIncidents/bienModifie.jsp?idTicket=<%= idTicket %>&login=<%= login %>" method="post">
  <h1 class="sign-up-title">Creer un nouveau ticket</h1>
<fieldset >
<FONT COLOR="#D76B60"><legend>Ticket Informations</legend></FONT>
  <br>

	
<label for="type">Type    :</label>
<select name="type" class="sign-up-input">
    <option value="Incident">Incident</option>
    <option value="Demande de service">Demande de service</option>
    
  </select>
  <br>
<label for="impact">  impact : </label> 
<select name="impact" class="sign-up-input">
    <option value="Haut" >Haut</option>
    <option value="Moyen" >Moyen</option>
    <option value="bas" >Bas</option>
  </select><br>
   

<label for="categorie">Categorie :  </label>
<select name="categorie" class="sign-up-input">
    <option value="reseau">Reseau</option>
    <option value="materiel">Materiel</option>
    <option value="logiciel">Logiciel</option>
  </select>
  <br>
<label for="urgence">Urgence : </label>
<select name="urgence" class="sign-up-input">
    <option value="Haute" >Haute</option>
    <option value="Moyenne" >Moyenne</option>
    <option value="Basse" >Basse</option>
    
  </select>
<br>
<label for="statut">statut : </label> 
<textarea name="statut" style=" WIDTH: 700px; height:40px;"><%=statut%></textarea>

<label for="titre">Titre    :</label>
<textarea name="titre" style=" WIDTH: 700px; height:40px;"><%=titre%></textarea>





<label for="description">Description:</label>
<textarea name="description" style=" WIDTH: 700px; height:80px;"><%=description%></textarea>


<FONT COLOR="#D76B60"><legend>Demandeur</legend></FONT>
<br>
<label for="utilisateur">Utilisateur:</label>
<textarea name="employeId" style=" WIDTH: 700px; height:40px;"><%=EmployeId%></textarea>


<label for="nomTech">Technicien</label>
<textarea name="nomTech" style=" WIDTH: 700px; height:40px;"><%=nomTech%></textarea>

<label for="lieu">Lieu :  </label>
<select name="lieu" class="sign-up-input">
    <option value="Centre de calcule">Centre de calcule</option>
    <option value="Centre informatique">Centre informatique</option>
    <option value="Departement logistique">Departement logistique</option>
    <option value="Administration">Administration</option>
    <option value="Ressource humaines">Ressource humaines</option>
  </select><br><br>
  </fieldset>
  

 

  
<input type="submit"  value="enregistrer" class="sign-up-button" style=" WIDTH: 120px; left: 400px;" />

</div><br></div></main><!-- main -->

<% }
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>

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