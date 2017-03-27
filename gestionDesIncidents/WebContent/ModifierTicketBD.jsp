<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String idTicket= request.getParameter("idTicket");
String type= request.getParameter("type");
String statut= request.getParameter("statut");
String categorie= request.getParameter("categorie");
String urgence= request.getParameter("urgence");
String impact= request.getParameter("impact");
String titre= request.getParameter("titre");
String description= request.getParameter("description");
String nomTech= request.getParameter("nomTech");



try {
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=conn.createStatement();
PreparedStatement ps=conn.prepareStatement("UPDATE ticket SET type=?,statut=?,categorie=?,urgence=?,impact=?,titre=?,description=?,nomTech=? WHERE idTicket="+idTicket);
ps.setString(1, type);
ps.setString(2, statut);
ps.setString(3, categorie);
ps.setString(4, urgence);
ps.setString(5, impact);
ps.setString(6, titre);
ps.setString(7, description);
ps.setString(8, nomTech);
ps.executeUpdate();

} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
String redirectURL = "http://localhost:8080/gestionDesIncidents/bienModifie.jsp?idTicket="+idTicket;
response.sendRedirect(redirectURL);

%>
</body>
</html>