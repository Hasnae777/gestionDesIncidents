<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="creerUnTicket.css">

<style>
body {
   background-image: url("login.jpg");
}

</style>
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


<%String login= request.getParameter("login");%>
<div id="header">
    <h1><strong><FONT size="10pt"> Espace&nbsp;utilisateur</FONT></strong><a href="http://localhost:8080/gestionDesIncidents/login.html" style="position:relative; left:1200px;" class="deconnecter">déconnecter</a></h1>
    
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

<br><br><br><br><br><br>


<div style="padding:20px;" class="sign-up">
<p><div>

  <p>Votre ticket a bien ete enregistré. Merci d'avoir utilisé notre systeme d'assistance</p>
</div></div>
</body>
</html>