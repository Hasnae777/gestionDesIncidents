<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="login.css">

<style>
body {
    background-image: url("login.jpg");
   
}
 


</style>

<body>

<div class="fg-12 omega text-center" >
        <h1 class="h1 before" style="color:#E80000 ; text-align:center; font-family:Calibri; position:absolute; top:80px;left: 680px;" >Envoyer l'incident au prestataire</h1>
      </div>
<form class="sign-up" style="width:500px;" action="http://localhost:8080/gestionDesIncidents/emailSimple.jsp" method="post" >
<img style="position:absolute; top:10px; left:200px;" src="mail.png"><br><br><br>Votre e-mail:<br>
<input type="text" type="password" class="sign-up-input" name="from"><br>
E-mail du prestataire:<br>
<input type="text" type="password" class="sign-up-input" name="to"><br>
Objet:<br>
<input type="text" type="password" class="sign-up-input" name="subject"><br>
Centenu:<br>
<input type="text" style="height:200px;width:500px;" name="comment" size="50"><br>
<br>Attachement:<br>
<input type="file" class="sign-up-input" name="file" size="40">
<br>
<input type="submit" value="Send">
<input type="reset" value="Reset">
</form>

</body>
</html>