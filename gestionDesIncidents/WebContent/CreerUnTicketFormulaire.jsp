<!DOCTYPE html>
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
		 <%String login=request.getParameter("login");%>  

		 <div id="header">
        <h1><strong>Administration</strong>Workspace<a href="http://localhost:8080/gestionDesIncidents/login.html" style="position:relative; left:1260px;" class="deconnecter">déconnecter</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="http://time.is/Temara" id="time_is_link" rel="nofollow" style="font-size:36px"></a>
<span id="Temara_z00d" style="font-size:36px" ></span>
<script src="http://widget.time.is/t.js"></script>
<script>


time_is_widget.init({Temara_z00d:{}});
</script></h1>
        </h1>
        </div>

      <ul class="main-navigation" >
  <li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp" ><b>Acceuil</b></a></li>
  <li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp"><b>Ticket</b></a>
    <ul>
      <li><a href="http://localhost:8080/gestionDesIncidents/ListerLesTickets.jsp?login=<%=login%>">Lister les tickets</a></li>
      <li><a href="http://localhost:8080/gestionDesIncidents/creerUnTicket.html" action="creerUnTicket.html" method="post">Creer un nouveau ticket</a></li>
      <li><a href="http://localhost:8080/gestionDesIncidents/ListerBDC.jsp?login=<%= login %>">Base de connaissance</a></li>
      
     
   
    </ul>
  </li>
  <li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp"><b>Gestion</b></a>
    <ul>
      <li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Inventaires</a>
      	<ul>
          	<li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Consulter la liste des Inventaires</a>
          		<ul>
          			<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesMateriels.jsp?login=<%= login %>">Par materiel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesLogiciels.jsp?login=<%= login %>">Par logiciel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesEquipementsReseau.jsp?login=<%= login %>">Par equipement reseau</a></li>
          		</ul>
          	</li>
          	<li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Ajouter un inventaire</a>
          		<ul>
          			<li><a href="http://localhost:8080/gestionDesIncidents/CreerMateriel.html">Materiel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/CreerLogiciel.html">Logiciel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/CreerLesEquipementsReseau.html">Equipement reseau</a></li>
          		</ul>
          	</li>
       	</ul>
       </li>
      <li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Techniciens</a>
      <ul>
          <li><a href="http://localhost:8080/gestionDesIncidents/ListerLesTechniciens.jsp?login=<%= login %>">Consulter la liste des techniciens</a></li>
        </ul></li>
      
    </ul>
  </li>
  <li><a href="http://localhost:8080/gestionDesIncidents/Rapports.jsp"><b>Rapports</b></a></li>
  <li><a href="http://localhost:8080/gestionDesIncidents/Configuration.jsp"><b>Configuration</b></a></li>
</ul>


<%	String employeId=request.getParameter("employeId");%>



<form class="sign-up" action="http://localhost:8080/gestionDesIncidents/creerUnTicket.jsp?employeId=<%=employeId%>" method="post">
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
    <option value="ordinateur">Ordinateur</option>
    <option value="logiciel">Logiciel</option>
  </select>
impact : 
<select name="impact" class="sign-up-input">
    <option value="Haut" >Haut</option>
    <option value="Moyen" >Moyen</option>
    <option value="bas" >Bas</option>
  </select><br>

Titre    :
<input type="text" class="sign-up-input" name="titre" placeholder="le Type de votre incident" autofocus />
Urgence : 
<select name="urgence" class="sign-up-input">
    <option value="Haute" >Haute</option>
    <option value="Moyenne" >Moyenne</option>
    <option value="Basse" >Basse</option>
    
  </select>
<br>

Description:
<textarea name="description" cols=50></textarea>


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
<input  type="text" class="sign-up-input" name="nomTech" placeholder="le nom du technicien" autofocus />
<input type="file" name="file">

  
<input type="submit" value="Submit" class="sign-up-button" />

  
</body>
</html>
</html>