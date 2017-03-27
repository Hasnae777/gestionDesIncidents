<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="web.EmployeModele"%><%@page import="gestionDesIncidents.Employe"%><%@page import="gestionDesIncidents.EmployeImpl"%><%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%><%@page import="java.util.Iterator"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liste des employes</title>
</head>
<body>



<table border="1" width="100%">


<p>
<tr>
	<th>idEmploye</th><th>nom</th><th>prenom</th><th>departement</th><th>email</th><th>numTel</th><th>login</th>
</tr>
	<%
	EmployeImpl employe= new EmployeImpl();
	List<Employe> emp= employe.getEmploye(); %>
	<tr>
	<%for(Employe e :emp){  %>
	<tr>
			<td><%= e.getIdEmploye() %></td>
			<td><%= e.getNom() %></td>
			<td><%= e.getPrenom() %></td>
			<td><%= e.getDepartement() %></td>
			<td><%= e.getEmail() %></td>
			<td><%= e.getNumTel() %></td>
			<td><%= e.getLogin() %></td>
		</tr>
		<% } %>
	
		
	</p>
</table>
</body>
</html>