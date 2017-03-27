<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="gestionDesIncidents.Ticket"%><%@page import="gestionDesIncidents.TicketImpl"%><%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%><%@page import="java.util.Iterator"%><%@page import="gestionDesIncidents.SingletonConnection"%>
<%@page import="java.sql.SQLException"%><%@page import="java.sql.*"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="creerUnTicket.css">
</head>
<body>
<link rel="stylesheet" href="responsable.css">
<style>
body {
   background-image: url("login.jpg");
}
textarea { vertical-align: top;
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
		<%String login= request.getParameter("login");%>
<div id="header">
		        <img  src="hat.png">
		 
        <h1 style="position: relative;top:-100px;left: 130px;"><strong>Technicien&nbsp;</strong>Workspace<a href="http://localhost:8080/gestionDesIncidents/login.html" style="position:relative; left:1200px;" class="deconnecter">déconnecter</a>
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
Connection conn=SingletonConnection.getConnection();
try {PreparedStatement ps=conn.prepareStatement("select * from technicien where login=?");
ps.setString(1, login);
ResultSet rs=ps.executeQuery();
while(rs.next()){
	String nom=rs.getString("nom");
	String prenom=rs.getString("prenom");
	String email= rs.getString("email");
	String numTel=rs.getString("numTel");
	String groupeName =rs.getString("groupeName");

	%>

<form style="width: 400px;" class="sign-up" action="http://localhost:8080/gestionDesIncidents/bienModifieTech.jsp?login=<%= login %>" method="post">
  <h1 class="sign-up-title">Modifier vos informations</h1>


	
Nom    :
<textarea class="sign-up-input" name="nom" cols=50 ><%=nom%></textarea><br>

   
Prenom :  
<textarea class="sign-up-input" name="prenom" cols=50><%=prenom%></textarea><br>

<br>

E-mail : 
<textarea class="sign-up-input" name="email" cols=50 ><%=email%></textarea><br>

<br>

Numero telephone  :
<textarea class="sign-up-input" name="numTel" cols=50 ><%=numTel%></textarea><br>
groupe name :  
<textarea class="sign-up-input" name="groupeName" cols=50 ><%=groupeName%></textarea><br>
<br>





  
<input type="submit"  value="enregistrer" class="sign-up-button" />



<% }
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
  
</body>
</html>
</html>