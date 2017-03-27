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


String nom=request.getParameter("nom");
session.putValue("nom", nom);
String prenom=request.getParameter("prenom");
String email=request.getParameter("email");
String numTel=request.getParameter("numTel");
String groupeName=request.getParameter("groupeName");
String departement=request.getParameter("departement");
String login=request.getParameter("login");
String password=request.getParameter("password");
String flag=request.getParameter("flag");
if(flag.equals("employe")){
	try {
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
		Statement st=conn.createStatement();
		PreparedStatement ps=conn.prepareStatement("insert into employe(nom,prenom,email,numTel,groupeName,departement,login) values(?,?,?,?,?,?,?)");
		ps.setString(1, nom);
		ps.setString(2, prenom);
		ps.setString(3, email);
		ps.setString(4, numTel);
		ps.setString(5, groupeName);
		ps.setString(6, departement);
		ps.setString(7, login);


		ps.executeUpdate();
		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
}

if(flag.equals("responsable")){
	try {
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
		Statement st=conn.createStatement();
		PreparedStatement ps=conn.prepareStatement("insert into responsable(nom,prenom,email,numTel,groupeName,login) values(?,?,?,?,?,?)");
		ps.setString(1, nom);
		ps.setString(2, prenom);
		ps.setString(3, email);
		ps.setString(4, numTel);
		ps.setString(5, groupeName);
		ps.setString(6, login);


		ps.executeUpdate();
		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
}
if(flag.equals("technicien")){
	try {
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
		Statement st=conn.createStatement();
		PreparedStatement ps=conn.prepareStatement("insert into technicien(nom,prenom,email,numTel,groupeName,login) values(?,?,?,?,?,?)");
		ps.setString(1, nom);
		ps.setString(2, prenom);
		ps.setString(3, email);
		ps.setString(4, numTel);
		ps.setString(5, groupeName);
		ps.setString(6, login);


		ps.executeUpdate();
		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
}


Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
Statement st=conn.createStatement();

	PreparedStatement ps1=conn.prepareStatement("insert into identification(login,password,flag) values(?,?,?)");

	ps1.setString(1, login);
	ps1.setString(2, password);
	ps1.setString(3, flag);

ps1.executeUpdate();
String redirectURL = "http://localhost:8080/gestionDesIncidents/bienCreer.html";
response.sendRedirect(redirectURL);




%>
</body>
</html>