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
body {
   background-image: url("login.jpg");
}

label
{
	display: block;
	width: 150px;
	float: left;
}

</style>


 <%String login=request.getParameter("login");%>  


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
						<h1 class="reset"><!--<img src="img/logo.png" alt="logo">--><a href="home-01.html">ANRT administrateur</a></h1>
					</div><!-- brand -->
					<a id="menu-toggle" href="#"><i class="fa fa-bars fa-lg"></i></a>
					<nav>
						<ul class="reset" role="navigation">
							<li class="menu-item"><a href="http://localhost:8080/gestionDesIncidents/responsable.html">Acceuil</a></li>
						
							<li class="menu-item">
								<a href="http://localhost:8080/gestionDesIncidents/responsable.html">Ticket</a>
								<ul class="sub-menu">
									<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesTickets.jsp?login=<%=login%>">Lister les tickets</a></li>
     								 <li><a href="http://localhost:8080/gestionDesIncidents/CreerTicketResp.jsp?login=<%=login%>">Creer un nouveau ticket</a></li>
    							  </ul>
							</li>
							<li class="menu-item">
  								<a href="http://localhost:8080/gestionDesIncidents/responsable.jsp"><b>Gestion</b></a>
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
							<li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Techniciens</a>
							<ul class="sub-menu">
							     <li><a href="http://localhost:8080/gestionDesIncidents/ListerLesTechniciens.jsp?login=<%= login %>">Consulter la liste des techniciens</a></li>
							
							</ul>
							</li>
							<li class="sub-menu"><a href="http://localhost:8080/gestionDesIncidents/Rapports.jsp"><b>Rapports</b></a></li>
  							<li class="sub-menu"><a href="http://localhost:8080/gestionDesIncidents/Configuration.jsp"><b>Configuration</b></a></li>
							<li class="menu-item"><a href="http://localhost:8080/gestionDesIncidents/login.html">Deconnecter</a></li>
	
						</ul>
					</nav>
				</div><!-- row-content -->	
			</div><!-- row -->	
		</header>




<br><br>
<main role="main">
		<div class="intro-item" style="background-image: url(login.jpg);">
						
		<br>			

<% String idTechnicien = request.getParameter("idTechnicien");
Connection conn=SingletonConnection.getConnection();
try {PreparedStatement ps=conn.prepareStatement("select * from technicien where idTechnicien=?");
ps.setString(1, idTechnicien);
ResultSet rs=ps.executeQuery();
while(rs.next()){
	String nom=rs.getString("nom");
	String prenom=rs.getString("prenom");
	String email=rs.getString("email");
	String numTel= rs.getString("numTel");
	String loginT=rs.getString("login");
	String groupeName =rs.getString("groupeName");
	

	if(groupeName==null){ 
		groupeName="n'appartient à aucun groupe";} 


	%>

<form class="sign-up"  action="http://localhost:8080/gestionDesIncidents/bienModifieTechnicien.jsp?idTechnicien=<%= idTechnicien %>" method="post">
  <h1 class="sign-up-title">Modifier les informations du technicien</h1>
<fieldset>
<FONT COLOR="#D76B60"><legend>Informations générales</legend></FONT>

	
<label for="nom">Nom    :</label>

   <textarea name="nom" style=" WIDTH: 700px; height:40px;"><%=nom%></textarea><br>
   
<label for="prenom">Prenom : </label><textarea name="prenom" style=" WIDTH: 700px; height:40px;"><%=prenom%></textarea>
 

<label for="email">E-mail :</label>  <textarea name="email" style=" WIDTH: 700px; height:40px;"><%=email%></textarea>


<label for="numTel">Numero de telephone :</label> <textarea name="numTel" style=" WIDTH: 700px; height:40px;"><%=numTel%></textarea>
<br>

<label for="login">Login    :</label>
<textarea name="loginT" style=" WIDTH: 700px; height:40px;"><%=loginT%></textarea>
<label for="groupe">Groupe Name :  </label>
<textarea name="groupeName" style=" WIDTH: 700px; height:40px;"><%=groupeName%></textarea>

  


  </fieldset><br>
  
 

  
<input type="submit"  value="Enregistrer" style="width: 20%;position: relative; left: 400px;" class="sign-up-button" />
</form>


<% }
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%><br><br></div>
</main><!-- main -->

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