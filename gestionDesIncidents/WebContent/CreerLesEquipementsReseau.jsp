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


String idReseau=request.getParameter("idReseau");
session.putValue("idReseau", idReseau);
String type=request.getParameter("type");
String nom=request.getParameter("nom");
String IP=request.getParameter("IP");
String network=request.getParameter("network");
String mac=request.getParameter("mac");
String port=request.getParameter("port");
String login=request.getParameter("login");

	try {
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=conn.createStatement();
PreparedStatement ps=conn.prepareStatement("insert into equipementreseau(idReseau,type,nom,IP,network,mac,port,dateAjout) values(?,?,?,?,?,?,?,NOW())");
ps.setString(1, idReseau);
ps.setString(2, type);
ps.setString(3, nom);
ps.setString(4, IP);
ps.setString(5, network);
ps.setString(6, mac);
ps.setString(7, port);
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