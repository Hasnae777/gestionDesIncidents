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
Connection conn=SingletonConnection.getConnection();
try {PreparedStatement ps=conn.prepareStatement("select * from employe where login=?");
ps.setString(1, login);
ResultSet rs=ps.executeQuery();
while(rs.next()){
	String nom=rs.getString("nom");
	String prenom=rs.getString("prenom");
	String departement=rs.getString("departement");
	String email= rs.getString("email");
	String numTel=rs.getString("numTel");
	String groupeName =rs.getString("groupeName");

	%>

<form style="width: 400px;" class="sign-up" action="http://localhost:8080/gestionDesIncidents/bienModifieAgent.jsp?login=<%= login %>" method="post">
  <h1 class="sign-up-title">Modifier vos informations</h1>


	
Nom    :
<textarea class="sign-up-input" name="nom" cols=50 ><%=nom%></textarea><br>

   
Prenom :  
<textarea class="sign-up-input" name="prenom" cols=50><%=prenom%></textarea><br>

<br>
Departement :  
<textarea class="sign-up-input" name="departement" cols=50 ><%=departement%></textarea><br>

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