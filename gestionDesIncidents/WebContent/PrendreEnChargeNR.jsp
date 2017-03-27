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
String idTicket=request.getParameter("idTicket");
session.putValue("idTicket", idTicket);
String statut=request.getParameter("statut");
String statutP=request.getParameter("statutP");
String note=request.getParameter("note");
String nomTech=request.getParameter("nomTech");
String time=request.getParameter("dateDebut");
java.sql.Timestamp dateDebut= Timestamp.valueOf(time);


try {
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=conn.createStatement();
PreparedStatement ps=conn.prepareStatement("insert into priseencharge(dateDebut,dateDerniereMod,statutP,note,idTicket,nomTech,dureeTache) values(?,NOW(),?,?,?,?,TIMEDIFF(NOW(),dateDebut))");
ps.setTimestamp(1, dateDebut);
ps.setString(2, statutP);
ps.setString(3, note);
ps.setString(4,idTicket);
ps.setString(5, nomTech);
ps.executeUpdate();
if(statut.equals("clos")){
	PreparedStatement ps1=conn.prepareStatement("UPDATE ticket SET statut=?,dateFermeture=NOW() WHERE idTicket="+idTicket);
	ps1.setString(1, statut);	
	ps1.executeUpdate();

}
else if(statut.equals("nouveau")){
	PreparedStatement ps2=conn.prepareStatement("UPDATE ticket SET statut=? WHERE idTicket="+idTicket);
	ps2.setString(1, statut);
	ps2.executeUpdate();

}
else if(statut.equals("resolu")){
	PreparedStatement ps2=conn.prepareStatement("UPDATE ticket SET statut=? WHERE idTicket="+idTicket);
	ps2.setString(1, statut);
	ps2.executeUpdate();

}

else if(statut.equals("non resolu")){
	PreparedStatement ps2=conn.prepareStatement("UPDATE ticket SET statut=? WHERE idTicket="+idTicket);
	ps2.setString(1, statut);	
	ps2.executeUpdate();

}
else if(statut.equals("en attente")){
	PreparedStatement ps2=conn.prepareStatement("UPDATE ticket SET statut=? WHERE idTicket="+idTicket);
	ps2.setString(1, statut);	
	ps2.executeUpdate();

}
String redirectURL = "http://localhost:8080/gestionDesIncidents/consulterTicketDTechR.jsp?login="+nomTech;
response.sendRedirect(redirectURL);	

} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}



%>
</body>
</html>