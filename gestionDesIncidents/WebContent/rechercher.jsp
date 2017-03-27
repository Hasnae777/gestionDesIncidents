<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%String login= request.getParameter("login");%>
<div>
<form action="http://localhost:8080/gestionDesIncidents/RechercherDB.jsp?login="<%= login %> method="post">
<input  type="text" name="loop" autofocus />
Dans:
<select  name="dans" >
    <option value="ID">ID</option>
    <option value="Titre">Titre</option>
    <option value="Employé">Employé</option>
    <option value="Nom du technicien">Nom du technicien</option>
    
    
  </select>
Trier par:
<select  name="par" >
    <option value="statut">Statut</option>
    <option value="type">Type</option>
    <option value="categorie">Categorie</option>
    <option value="priorite">Priorité</option>
    <option value="employeId">Employé</option>
    <option value="nomTech">Nom du technicien</option>
    
    
  </select>
<input type="submit" value="rechercher"  />

</form>
</div>
</body>
</html>