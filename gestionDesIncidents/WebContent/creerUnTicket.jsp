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
<%@ page import="java.util.*"%>

<%@ page import="java.text.SimpleDateFormat"%><%

Calendar calendar = Calendar.getInstance();
java.sql.Timestamp dateOuverture = new java.sql.Timestamp(calendar.getTime().getTime());

Time time = new Time(0);


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
String login=request.getParameter("login");
String nomTech = request.getParameter("nomTech");
String employeId = request.getParameter("login");


	try {
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=conn.createStatement();
PreparedStatement ps=conn.prepareStatement("insert into ticket(idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,nomTech,employeId,dureeTraitement) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1, idTicket);
ps.setString(2, type);
ps.setString(3, categorie);
ps.setString(4, urgence);
ps.setString(5, impact);

if(impact.equals("Haut") && urgence.equals("Haute")){
	ps.setString(6, "Critique");
	ps.setString(15, "1:00:00");

}
else if((impact.equals("Moyen") && urgence.equals("Haute"))|| (urgence.equals("Moyenne") && impact.equals("Haut"))){
	ps.setString(6, "Haut");
	ps.setString(15,"8:00:00");

}
else if((impact.equals("Moyen") && urgence.equals("Moyenne"))|| (impact.equals("Bas") && urgence.equals("Haute")) || (impact.equals("Haut") && urgence.equals("Basse"))){
	ps.setString(6, "Moyen");
	ps.setString(15, "24:00:00");

}
else if((impact.equals("Moyen") && urgence.equals("Basse"))|| (impact.equals("Bas") && urgence.equals("Moyenne"))){
	ps.setString(6, "Bas");
	ps.setString(15,"48:00:00");

}
else { 
	ps.setString(6, "à planifier");
	ps.setString(15,"duree non spécifiée");

}

ps.setString(7, titre);
ps.setString(8, lieu);
ps.setString(9, description);
ps.setString(10, statut);
ps.setTimestamp(11, dateOuverture);

if(statut.equals("Clos")){
	ps.setDate(12, new java.sql.Date(System.currentTimeMillis()));

			
}
else{
	ps.setDate(12, null);
}


ps.setString(13, nomTech);
ps.setString(14, employeId);


ps.executeUpdate();


String redirectURL = "http://localhost:8080/gestionDesIncidents/ticketCree.jsp?login="+login;
response.sendRedirect(redirectURL);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	


%>
</body>
</html>