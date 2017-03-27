<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*,javax.naming.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
<%
String from=request.getParameter("from");

String to=request.getParameter("to");

String subject=request.getParameter("subject");
String comment=request.getParameter("comment");
String file=request.getParameter("file");







// Sender's email ID needs to be mentioned


final String username = "hasnae.777.dada@gmail.com";//change accordingly
final String password = "hello1997";//change accordingly

// Assuming you are sending email through relay.jangosmtp.net
String host = "smtp.gmail.com";

Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", host);
props.put("mail.smtp.port", "587");

// Get the Session object.
Session ses = Session.getInstance(props,
new javax.mail.Authenticator() {
   protected PasswordAuthentication getPasswordAuthentication() {
      return new PasswordAuthentication(username, password);
   }
});

try {
   // Create a default MimeMessage object.
   Message message = new MimeMessage(ses);

   // Set From: header field of the header.
   message.setFrom(new InternetAddress(from));

   // Set To: header field of the header.
   message.setRecipients(Message.RecipientType.TO,
   InternetAddress.parse(to));

   // Set Subject: header field
   message.setSubject(subject);

   // Now set the actual message
  BodyPart messageBodyPart1 = new MimeBodyPart();  
    messageBodyPart1.setText(comment);  
      
    //4) create new MimeBodyPart object and set DataHandler object to this object      
    MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
  
    String filename = file;//change accordingly  
    DataSource source = new FileDataSource(filename);  
    messageBodyPart2.setDataHandler(new DataHandler(source));  
    messageBodyPart2.setFileName(filename);  
     
     
    //5) create Multipart object and add MimeBodyPart objects to this object      
    Multipart multipart = new MimeMultipart();  
    multipart.addBodyPart(messageBodyPart1);  
    multipart.addBodyPart(messageBodyPart2);  
  
    //6) set the multiplart object to the message object  
    message.setContent(multipart );  


   // Send message
   Transport.send(message);

   System.out.println("Sent message successfully....");
   %><div style="padding:20px;" class="sign-up">
		<p><div>

		  <p>Sent message successfully...., merci d'utiliser notre systeme d'assistance.</p>
		</div></div> <%
} catch (MessagingException e) {
      throw new RuntimeException(e);
}

%>
</body>
</html>