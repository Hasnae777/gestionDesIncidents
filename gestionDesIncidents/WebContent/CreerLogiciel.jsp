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


String idLogiciel=request.getParameter("idLogiciel");
session.putValue("idLogiciel", idLogiciel);
String numSerie=request.getParameter("numSerie");
String nom=request.getParameter("nom");
String version=request.getParameter("version");
String licence=request.getParameter("licence");
String dateAchat=request.getParameter("dateAchat");
String type=request.getParameter("type");
String dateExpiration=request.getParameter("dateExpiration");

	try {
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=conn.createStatement();
PreparedStatement ps=conn.prepareStatement("insert into logiciel(idLogiciel,numSerie,nom,version,licence,dateAchat,type,dateExpiration) values(?,?,?,?,?,?,?,?)");
ps.setString(1, idLogiciel);
ps.setString(2, numSerie);
ps.setString(3, nom);
ps.setString(4, version);
ps.setString(5, licence);
ps.setString(6, dateAchat);
ps.setString(7, type);
ps.setString(8, dateExpiration);
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