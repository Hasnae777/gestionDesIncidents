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
<%@ page import="java.text.SimpleDateFormat"%>
<%
String login=request.getParameter("login");
String idTicket=request.getParameter("idTicket");
session.putValue("idTicket", idTicket);
String type=request.getParameter("type");
String categorie=request.getParameter("categorie");
String urgence=request.getParameter("urgence");
String impact=request.getParameter("impact");
String titre=request.getParameter("titre");
String lieu=request.getParameter("lieu");
String description=request.getParameter("description");
String statut=request.getParameter("statut");
String nomTech=request.getParameter("nomTech");

try {
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=conn.createStatement();
PreparedStatement ps=conn.prepareStatement("UPDATE ticket SET type=?, categorie=?, urgence=?, impact=?, lieu=?, description=?, statut=?, nomTech=? WHERE idTicket="+idTicket);
ps.setString(1, type);
ps.setString(2, categorie);
ps.setString(3, urgence);
ps.setString(4, impact);
ps.setString(5, lieu);
ps.setString(6, description);
ps.setString(7, statut);
ps.setString(8, nomTech);

ps.executeUpdate();
String redirectURL = "http://localhost:8080/gestionDesIncidents/responsable.jsp?login="+login;
response.sendRedirect(redirectURL);

} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}



%>
</body>
</html>