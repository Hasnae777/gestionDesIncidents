<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%><%


String idMateriel=request.getParameter("idMateriel");
session.putValue("idMateriel", idMateriel);
String numSerie=request.getParameter("numSerie");
String type=request.getParameter("type");
String modele=request.getParameter("modele");

String nom=request.getParameter("nom");
String user=request.getParameter("user");
String etat=request.getParameter("etat");
String dateAffectation=request.getParameter("dateAffectation");
String dateAchat=request.getParameter("dateAchat");
String dureeGarantie=request.getParameter("dureeGarantie");
String IP=request.getParameter("IP");
String mac=request.getParameter("mac");
String os=request.getParameter("os");
String processeur=request.getParameter("processeur");
String ram=request.getParameter("ram");
String lieu=request.getParameter("lieu");
String fabricant=request.getParameter("fabricant");
String dateDerniereMod=request.getParameter("dateDerniereMod");
String description=request.getParameter("description");


	try {
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=conn.createStatement();
PreparedStatement ps=conn.prepareStatement("insert into materiel(idMateriel,numSerie,type,modele,nom,user,etat,dateAffectation,dateAchat,dureeGarantie,IP,mac,os,processeur,ram,lieu,fabricant,dateDerniereMod,description) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1, idMateriel);
ps.setString(2, numSerie);
ps.setString(3, type);
ps.setString(4, modele);
ps.setString(5, nom);
ps.setString(6, user);
ps.setString(7, etat);
ps.setString(8, dateAffectation);
ps.setString(9, dateAchat);
ps.setString(10, dureeGarantie);
ps.setString(11, IP);
ps.setString(12, mac);
ps.setString(13, os);
ps.setString(14, processeur);
ps.setString(15, ram);
ps.setString(16, lieu);
ps.setString(17, fabricant);
ps.setString(18, dateDerniereMod);
ps.setString(19, description);

ps.executeUpdate();


String redirectURL = "http://localhost:8080/gestionDesIncidents/bienAjoute.html";
response.sendRedirect(redirectURL);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	


%>
</body>
</html>