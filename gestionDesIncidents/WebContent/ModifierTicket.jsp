
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

</style>



</head>
<body>
		 <div id="header">
        <h1><strong>Administration</strong>Workspace</h1>
        </div>

      <ul class="main-navigation" >
  <li><a href="#" ><b>Acceuil</b></a></li>
  <li><a href="#"><b>Ticket</b></a>
    <ul>
      <li><a href="#">Lister les tickets</a></li>
      <li><a href="#">Creer un nouveau ticket</a></li>
      <li><a href="#">Base de connaissance</a></li>
      
     
   
    </ul>
  </li>
  <li><a href="#"><b>Gestion</b></a>
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

	String ta="";
	if(type=="incident"){ 
		ta="Demande de service";} else {ta="Incident";}


	%>

<form class="sign-up" action="http://localhost:8080/gestionDesIncidents/bienModifie.jsp?idTicket=<%= idTicket %>&login=<%= login %>" method="post">
  <h1 class="sign-up-title">Creer un nouveau ticket</h1>
<fieldset>
<legend>Ticket Informations</legend>

	
Type    :
<select name="type" class="sign-up-input">
    <option value="Incident">Incident</option>
    <option value="Demande de service">Demande de service</option>
    
  </select>
   
statut :  
<select name="statut" class="sign-up-input">
    <option value="nouveau">Nouveau</option>
    <option value="en attente">En attente</option>
    <option value="non resolu">Non resolu</option>
    <option value="resolu">Resolu</option>
    <option value="clos">Clos</option>
    
  </select><br>
Categorie :  
<select name="categorie" class="sign-up-input">
    <option value="reseau">Reseau</option>
    <option value="materiel">Materiel</option>
    <option value="logiciel">Logiciel</option>
  </select>
Urgence : 
<select name="urgence" class="sign-up-input">
    <option value="Haute" >Haute</option>
    <option value="Moyenne" >Moyenne</option>
    <option value="Basse" >Basse</option>
    
  </select>
<br>

Titre    :
<textarea name="titre" cols=50><%=titre%></textarea>
impact :  
<select name="impact" class="sign-up-input">
    <option value="Haut" >Haut</option>
    <option value="Moyen" >Moyen</option>
    <option value="bas" >Bas</option>
  </select><br>



Description:
<textarea name="description" cols=50><%=description%></textarea>


</fieldset><br>
  
<fieldset>
<legend>Demandeur</legend>
Utilisateur:
<select  name="utilisateur" class="sign-up-input">
    <option value="responsable">Responsable</option>
    <option value="technicien">Technicien</option>
    <option value="employe">Employe</option>
  </select>
Groupe:
<input  type="text" class="sign-up-input" name="nom" placeholder="group name" autofocus /><br>

Lieu :  
<select name="lieu" class="sign-up-input">
    <option value="Centre de calcule">Centre de calcule</option>
    <option value="Centre informatique">Centre informatique</option>
    <option value="Departement logistique">Departement logistique</option>
    <option value="Administration">Administration</option>
    <option value="Ressource humaines">Ressource humaines</option>
  </select><br><br>
  </fieldset><br>
  
 <p>Attribue a :</p>
 Technicien:
 <textarea name="nomTech" cols=50><%=nomTech%></textarea>
 
<input type="file" name="file">

  
<input type="submit"  value="Submit" class="sign-up-button" />



<% }
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
  
</body>
</html>
</html>