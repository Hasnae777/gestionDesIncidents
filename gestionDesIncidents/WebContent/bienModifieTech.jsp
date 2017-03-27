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
String nom=request.getParameter("nom");
String prenom=request.getParameter("prenom");
String email=request.getParameter("email");
String numTel=request.getParameter("numTel");
String groupeName=request.getParameter("groupeName");


try {
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=conn.createStatement();
PreparedStatement ps=conn.prepareStatement("UPDATE technicien SET nom=?, prenom=?, email=?, numTel=?, groupeName=? WHERE login='"+login+"'");
ps.setString(1, nom);
ps.setString(2, prenom);
ps.setString(3, email);
ps.setString(4, numTel);
ps.setString(5, groupeName);


ps.executeUpdate();
String redirectURL = "http://localhost:8080/gestionDesIncidents/Technicien.jsp?login="+login;
response.sendRedirect(redirectURL);

} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}



%>
</body>
</html>