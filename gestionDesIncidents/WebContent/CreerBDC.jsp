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


String idBC=request.getParameter("idBC");
session.putValue("idBC", idBC);
String titre=request.getParameter("titre");
String categorie=request.getParameter("categorie");
String contenu=request.getParameter("contenu");


	try {
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=conn.createStatement();
PreparedStatement ps=conn.prepareStatement("insert into basedeconnaissance(idBC,titre,categorie,contenu) values(?,?,?,?)");
ps.setString(1, idBC);
ps.setString(2, titre);
ps.setString(3, categorie);
ps.setString(4, contenu);

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