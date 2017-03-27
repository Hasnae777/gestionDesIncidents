<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="gestionDesIncidents.Ticket"%><%@page import="gestionDesIncidents.TicketImpl"%><%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%><%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="login.css">
<style>
body {
    background-image: url("login.jpg");
}
.myButton {
	-moz-box-shadow: 8px 5px 0px -1px #8a2a21;
	-webkit-box-shadow: 8px 5px 0px -1px #8a2a21;
	box-shadow: 8px 5px 0px -1px #8a2a21;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f24437));
	background:-moz-linear-gradient(top, #c62d1f 5%, #f24437 100%);
	background:-webkit-linear-gradient(top, #c62d1f 5%, #f24437 100%);
	background:-o-linear-gradient(top, #c62d1f 5%, #f24437 100%);
	background:-ms-linear-gradient(top, #c62d1f 5%, #f24437 100%);
	background:linear-gradient(to bottom, #c62d1f 5%, #f24437 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24437',GradientType=0);
	background-color:#c62d1f;
	-moz-border-radius:17px;
	-webkit-border-radius:17px;
	border-radius:17px;
	border:6px solid #d02718;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:23px;
	padding:7px 76px;
	text-decoration:none;
	text-shadow:0px -1px 0px #810e05;
	
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f24437), color-stop(1, #c62d1f));
	background:-moz-linear-gradient(top, #f24437 5%, #c62d1f 100%);
	background:-webkit-linear-gradient(top, #f24437 5%, #c62d1f 100%);
	background:-o-linear-gradient(top, #f24437 5%, #c62d1f 100%);
	background:-ms-linear-gradient(top, #f24437 5%, #c62d1f 100%);
	background:linear-gradient(to bottom, #f24437 5%, #c62d1f 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24437', endColorstr='#c62d1f',GradientType=0);
	background-color:#f24437;
}
.myButton:active {
	position:relative;
	top:1px;
}
</style>
</head>
<body>

        <h1 class="fg-12 omega text-center" style="color: SteelBlue; text-align:center; font-family:Calibri; position: relative;top: 40px;"  >La prise en charge du ticket</h1>
      


<%String idTicket=request.getParameter("idTicket");
session.putValue("idTicket", idTicket);
	String login=request.getParameter("nomTech");
	Date date= new java.util.Date();
	 Timestamp dateDebut=new Timestamp(date.getTime()- (60 * 60 * 1000));%>

 <form style=" height: 350px;
    width: 20%;position: relative;
        top: -100px;
        " class="sign-up" action="http://localhost:8080/gestionDesIncidents/PrendreEnChargeNR.jsp?idTicket=<%= idTicket%>&nomTech=<%=login%>&dateDebut=<%=dateDebut%>" method="post">
    <div id="light" class="white_content">
  <b>login du techncien: </b>  
    <input type="text" name="login"  /><br><br>
     
<b>statut du ticket:  </b>
<select name="statut" >
    <option value="nouveau">Nouveau</option>
    <option value="en attente">En attente</option>
    <option value="non resolu">Non resolu</option>
    <option value="resolu">Resolu</option>
    <option value="clos">Clos</option>
    
    
  </select><br><br>
  <b>statut de la prise en charge: </b> 
<select name="statutP" >
    <option value="succes">succes</option>
    <option value="echec">echec</option>
    
    
    
  </select><br><br>
<b>Note du technicien:</b>
<textarea style=" height: 100px;" name="note" cols=43></textarea>
   <br><br>
  
  <input type="submit" value="valider" class="sign-up-button" /></p>
<a href = "http://localhost:8080/gestionDesIncidents/consulterTicketTech.jsp?login=<%= login %>" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">Annuler</a></div>
    <div id="fade" class="black_overlay"></div>	
    		
			  
			  <img style="position: relative;top: -40px;" src="technicien.png">
			  <img style="position: relative;top: -730px; left: 280px;height: 100px; width: 70px;" src="engrenage.png">

</form>
				  <FORM action="http://localhost:8080/gestionDesIncidents/emailForm.jsp" target="_blank" >
				  
					<INPUT type=submit CLASS=myButton value="envoyer l'incident au prestataire">
</FORM>	  
			  
</body>
</html>