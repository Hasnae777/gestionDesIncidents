<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="gestionDesIncidents.Ticket"%><%@page import="gestionDesIncidents.TicketImpl"%><%@page import="java.util.List"%><%@page import="gestionDesIncidents.Technicien"%><%@page import="gestionDesIncidents.TechnicienImpl"%>
<%@page import="java.util.ArrayList"%><%@page import="java.util.Iterator"%>    <%@ page import="java.sql.*" %>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>

<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
<%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>
    
    <%@ page import="org.jfree.chart.ChartFactory" %>
        <%@ page import="org.jfree.chart.plot.PlotOrientation" %>
    <%@ page import="org.jfree.chart.JFreeChart" %>
     <%@ page import="org.jfree.chart.ChartUtilities" %>
          <%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset" %>
               <%@ page import="org.jfree.util.PublicCloneable" %>
               <%@ page import="java.awt.Color" %>
               <%@ page import="java.awt.*" %>
                              <%@ page import="org.jfree.*" %>
               
                                    <%@ page import="org.jfree.chart.plot.CategoryPlot" %>
                                                            <%@ page import="org.jfree.chart.renderer.category.CategoryItemRenderer" %>
                                                            <%@ page import="org.jfree.chart.renderer.category.LineAndShapeRenderer" %>
                        
     <%@ page import="org.jfree.chart.renderer.xy.XYLineAndShapeRenderer" %>
          <%@ page import="org.jfree.chart.plot.PiePlot" %>
              <%@ page import="java.awt.BasicStroke" %>
     <%@ page import="org.jfree.chart.labels.PieSectionLabelGenerator" %>
   <%@ page import="org.jfree.chart.labels.StandardPieSectionLabelGenerator" %>
          <%@ page import="java.text.DecimalFormat" %>
                   
     
      <%@ page import="org.jfree.data.jdbc.JDBCPieDataset" %>
       <%@ page import="org.jfree.data.general.DefaultPieDataset" %>
       
       <%@page import="com.itextpdf.text.pdf.*"%>
       <%@page import="com.itextpdf.text.*"%>
       <%@page import="com.itextpdf.text.Font"%>
       <%@page import="com.itextpdf.text.Image"%>
       <%@page import="com.itextpdf.text.Rectangle"%>
        
<%try {
		OutputStream file = new FileOutputStream(new File("RapportStatistiques.pdf"));
        Font font1 = new Font(Font.FontFamily.HELVETICA  , 25, Font.BOLD);
        Font font2 = new Font(Font.FontFamily.COURIER    , 10,
                Font.ITALIC | Font.UNDERLINE);
        Font font3 = new Font(Font.FontFamily.HELVETICA  , 10, Font.BOLD);
        Font font4 = new Font(Font.FontFamily.HELVETICA  , 15, Font.BOLD);


		Document document = new Document();
		PdfWriter.getInstance(document, file);

		document.open();
		
        document.add(new Chunk(    "Statistiques: ", font1));
       
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));

        PdfPTable table = new PdfPTable(1); // Create 2 columns in table
        table.setWidthPercentage(100);

        PdfPCell cell1 = new PdfPCell(new Paragraph(
                     "A propos du nombre des tickets:"));
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);

        /* Set Background colour */
        cell1.setBackgroundColor(new BaseColor(224, 224, 224));
		

        table.addCell(cell1);

        document.add(table);

        Image barchartTicket = Image.getInstance("barchart_3D.jpeg");
        barchartTicket.scaleToFit(226, 200);
        barchartTicket.setAbsolutePosition(220, 560);

        
    	

        
        
        document.add(barchartTicket);
  
        

        TicketImpl ticket= new TicketImpl();
        document.add(new Paragraph("\n\n\n\n Nombre de nouveaux tickets: "+ticket.nouveauT()+""));
        document.add(new Paragraph("Nombre de tickets en attente: "+ticket.enattenteT()+""));
        document.add(new Paragraph("Nombre de tickets non resolus:"+ticket.nonresoluT()+""));
        document.add(new Paragraph("Nombre de tickets clos: "+ticket.closT()+""));
        
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));

        PdfPTable table2 = new PdfPTable(1); // Create 2 columns in table
        table2.setWidthPercentage(100);

        PdfPCell cell2 = new PdfPCell(new Paragraph(
                     "A propos du type des tickets:"));
        cell2.setHorizontalAlignment(Element.ALIGN_CENTER);

        /* Set Background colour */
        cell2.setBackgroundColor(new BaseColor(224, 224, 224));
		

        table2.addCell(cell2);

        document.add(table2);

        Image pieType = Image.getInstance("piechartT.jpeg");
        pieType.scaleToFit(226, 200);
        pieType.setAbsolutePosition(229, 340);

        
    	
        try {       


       	 Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
            Statement stmt = conn.createStatement();
            /* Populate data from table to JFreeChart */
           
                    ResultSet query_set = stmt.executeQuery("select type, count(*) as nombre from ticket group by type");
                    document.add(new Phrase("\n"));
                    document.add(new Phrase("\n"));
                    document.add(new Phrase("\n"));
                 

                    while (query_set.next()) {
                            String type = query_set.getString("type");
                            int nombre = query_set.getInt("nombre");
                            document.add(new Paragraph(" Nombre des "+type+":"+nombre));

                    } }catch (Exception e) {
                 		// TODO Auto-generated catch block
                 		e.printStackTrace();
                 	}  
        
        document.add(pieType);
        
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));

        
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));

        PdfPTable table3 = new PdfPTable(1); // Create 2 columns in table
        table3.setWidthPercentage(100);

        PdfPCell cell3 = new PdfPCell(new Paragraph(
                     "Nombre des incidents et des demandes de services:"));
        cell3.setHorizontalAlignment(Element.ALIGN_CENTER);

        /* Set Background colour */
        cell3.setBackgroundColor(new BaseColor(224, 224, 224));
		

        table3.addCell(cell3);

        document.add(table3);

        Image lineIncident = Image.getInstance("chartline.jpeg");
        lineIncident.scaleToFit(400, 600);
        lineIncident.setAbsolutePosition(100, 170);
        document.add(lineIncident);

        Image lineDS = Image.getInstance("chartlineD.jpeg");
        lineDS.scaleToFit(400, 600);
        lineDS.setAbsolutePosition(100, 46);
        document.add(lineDS);

        
        document.newPage();
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));

        PdfPTable table4 = new PdfPTable(1); // Create 2 columns in table
        table4.setWidthPercentage(100);

        PdfPCell cell4 = new PdfPCell(new Paragraph(
                     "Performance des techniciens: "));
        cell4.setHorizontalAlignment(Element.ALIGN_CENTER);

        /* Set Background colour */
        cell4.setBackgroundColor(new BaseColor(224, 224, 224));
		

        table4.addCell(cell4);

        document.add(table4);

        Image pieTechnicien = Image.getInstance("piechartTech.jpeg");
        pieTechnicien.scaleToFit(226, 200);
        pieTechnicien.setAbsolutePosition(340, 530);

        document.add(pieTechnicien);
        
        
        
        document.add(new Phrase("\n"));
   

        document.add(new Paragraph(" Nom du technicien:           Pourcentage d'intervention:"));

        
        try {       


       	 Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
            Statement stmt = conn.createStatement();
            Statement stmt1 = conn.createStatement();
            Statement stmt2 = conn.createStatement();

            /* Populate data from table to JFreeChart */
           
                    ResultSet query_set = stmt.executeQuery("select nomTech, count(*) as nombre from priseencharge group by nomTech");
                    while (query_set.next()) {
                            String nomTech = query_set.getString("nomTech");
                            int nombre = query_set.getInt("nombre");
                            ResultSet rs = stmt1.executeQuery("select nom, prenom from technicien where login='"+nomTech+"'");
                            while (rs.next()) {
                                String nom = rs.getString("nom");
                                String prenom = rs.getString("prenom");
                                String nomComplet=nom+" "+prenom;
                                ResultSet rs2 = stmt2.executeQuery("select count(*) as somme from priseencharge");
                                while (rs2.next()) {
                                  	 int somme= rs2.getInt("somme");
				                     float pourcentage=nombre*100/somme;
		                                document.add(new Paragraph(" "+nomComplet+"                            "+pourcentage+"%"));

                                }

                                

                            }}  } catch (Exception e) {
                         		// TODO Auto-generated catch block
                         		e.printStackTrace();
                         	}  
        
        
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));
        document.add(new Phrase("\n"));

        PdfPTable table5 = new PdfPTable(1); // Create 2 columns in table
        table5.setWidthPercentage(100);

        PdfPCell cell5 = new PdfPCell(new Paragraph(
                     "Durée réelle de la prise en charge d'un ticket/ durée max:"));
        cell5.setHorizontalAlignment(Element.ALIGN_CENTER);

        /* Set Background colour */
        cell5.setBackgroundColor(new BaseColor(224, 224, 224));
		

        table5.addCell(cell5);

        document.add(table5);
        
        
        PdfPTable table6 = new PdfPTable(3);
        table6.setWidthPercentage(100);
        table6.getDefaultCell().setBorder(Rectangle.NO_BORDER);
        table6.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table6.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
        table6.getDefaultCell().setFixedHeight(70);

        table6.addCell(new Phrase(new Chunk("Priorite du ticket:",font4)));
        table6.addCell(new Phrase(new Chunk("Temps de la prise en charge:",font4)));
        table6.addCell(new Phrase(new Chunk("Cible temps de résolution:",font4)));
     

        
        try {       


       	 Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
            Statement stmt = conn.createStatement();
           
                    ResultSet query_set = stmt.executeQuery("select priorite, SEC_TO_TIME(AVG(TIME_TO_SEC(`dureeTache`))) as timo,dureeTraitement from ticket where statut='clos' group by priorite");
                    while (query_set.next()) {
               	 	     String priorite=query_set.getString("priorite");
       					 String dureeTraitement=query_set.getString("dureeTraitement");
                            Time dureeTache = query_set.getTime("timo");
                            table6.addCell(new Phrase(new Chunk(priorite)));
                            table6.addCell(new Phrase(new Chunk(""+dureeTache)));
                            table6.addCell(new Phrase(new Chunk(dureeTraitement)));


                    } }catch (Exception e) {
                 		// TODO Auto-generated catch block
                 		e.printStackTrace();
                 	}
        document.add(table6);

        
		document.close();
		file.close();

	} catch (Exception e) {

		e.printStackTrace();
	}%>
       
       
       
       
       
       
     <%
     try {       


	 Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
     DefaultPieDataset my_pie_chart_dataset = new DefaultPieDataset();
     Statement stmt = conn.createStatement();
     /* Populate data from table to JFreeChart */
    
             ResultSet query_set = stmt.executeQuery("select type, count(*) as nombre from ticket group by type");
             while (query_set.next()) {
                     String type = query_set.getString("type");
                     int nombre = query_set.getInt("nombre");
                     my_pie_chart_dataset.setValue(type, nombre);
                     JFreeChart PieChartObject=ChartFactory.createPieChart("Pie_ticket par type",my_pie_chart_dataset,true,true,false);
                     /* Close JDBC specific objects */
                     PiePlot plot = (PiePlot) PieChartObject.getPlot();
                    plot.setSectionPaint(0, new Color(51, 153, 102));
                     
                    plot.setSectionPaint(1, new Color(128, 0, 0));
                    PieSectionLabelGenerator gen = new StandardPieSectionLabelGenerator(
                            "{0}: {1} ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
                        plot.setLabelGenerator(gen);
                     int width=640; 
                                int height=480;   
                                float quality=1; /* Quality factor */
                                /* Write Pie Chart as a JPEG file */
                                File BarChart=new File("piechartT.jpeg");              
                                ChartUtilities.saveChartAsJPEG(BarChart, quality, PieChartObject,width,height); //Convert data source from table to Pie Chart Data Source                               
                     }
     
     
     } catch (Exception e) {
 		// TODO Auto-generated catch block
 		e.printStackTrace();
 	} 
%>


<%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>
    <%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
    <%@ page import="org.jfree.chart.ChartFactory" %>
    <%@ page import="org.jfree.chart.plot.PlotOrientation" %>
    <%@ page import="org.jfree.chart.JFreeChart" %>
     <%@ page import="org.jfree.chart.ChartUtilities" %>
          <%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset" %>
               <%@ page import="org.jfree.util.PublicCloneable" %>
    <%@ page import="org.jfree.chart.plot.CategoryPlot" %>
                                                            <%@ page import="org.jfree.chart.renderer.category.CategoryItemRenderer" %>
                                                               <%@ page import="org.jfree.chart.renderer.category.BarRenderer" %>
                                                            <%@ page import="java.awt.Paint" %>
     <%try {
    	 Class.forName("com.mysql.jdbc.Driver");
    	 java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
    	 Statement st=conn.createStatement();
         PreparedStatement ps=conn.prepareStatement("select statut,count(*) as nombre,MONTH(dateOuverture) as month from ticket group by statut");
         JDBCCategoryDataset dataset = new JDBCCategoryDataset(conn);

 		ResultSet rs=ps.executeQuery();
    	 
		while(rs.next()){
	String statut=rs.getString("statut");
	int nombre=rs.getInt("nombre");
	int month=rs.getInt("month");
	String mounthS=month+"";
	switch(month)
	{
	case 1:
		mounthS="Janvier";
	    dataset.addValue(nombre,statut,mounthS);

		break;
	case 2:
		mounthS="Fevrier";
	    dataset.addValue(nombre,statut,mounthS);

		break;
	case 3:
		mounthS="Mars";
	    dataset.addValue(nombre,statut,mounthS);
		break;
	case 4:
		mounthS="Avril";
	    dataset.addValue(nombre,statut,mounthS);

		break;
	case 5:
		mounthS="Mai";
	    dataset.addValue(nombre,statut,mounthS);

		break;
	case 6:
		mounthS="Juin";
	    dataset.addValue(nombre,statut,mounthS);

		break;
	case 7:
		mounthS="Juillet";
	    dataset.addValue(nombre,statut,mounthS);

		break;
	case 8:
		mounthS="Aout";
	    dataset.addValue(nombre,statut,mounthS);
	    
		break;
	case 9:
		mounthS="Semptembre";
	    dataset.addValue(nombre,statut,mounthS);

		break;
	case 10:
		mounthS="Octobre";
	    dataset.addValue(nombre,statut,mounthS);

		break;
	case 11:
		mounthS="Novembre";
	    dataset.addValue(nombre,statut,mounthS);

		break;
	case 12:
		mounthS="Decembre";
	    dataset.addValue(nombre,statut,mounthS);

		break;
	}



    }
		JFreeChart chart = ChartFactory.createBarChart3D("Nombre de tickets", "", "",dataset, PlotOrientation.VERTICAL, true, true, false);
		CategoryPlot plot = chart.getCategoryPlot();
		BarRenderer renderer = (BarRenderer) plot.getRenderer();
		Color color = new Color(213, 128, 255);
		renderer.setSeriesPaint(0, color);      
		renderer.setSeriesPaint(1, new Color(230, 172, 0));      
		renderer.setSeriesPaint(2, new Color(153, 0, 0));      
		renderer.setSeriesPaint(3, new Color(51, 153, 102));      

        ChartUtilities.saveChartAsJPEG(new File("barchart_3D.jpeg"),chart,400, 300); 
    	 
     } catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
     %>
    <%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
<%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>
    
    <%@ page import="org.jfree.chart.ChartFactory" %>
        <%@ page import="org.jfree.chart.plot.PlotOrientation" %>
    <%@ page import="org.jfree.chart.JFreeChart" %>
     <%@ page import="org.jfree.chart.ChartUtilities" %>
          <%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset" %>
               <%@ page import="org.jfree.util.PublicCloneable" %>
               <%@ page import="java.awt.Color" %>
               <%@ page import="java.awt.*" %>
                              <%@ page import="org.jfree.*" %>
               
                                    <%@ page import="org.jfree.chart.plot.CategoryPlot" %>
                                                            <%@ page import="org.jfree.chart.renderer.category.CategoryItemRenderer" %>
                                                            <%@ page import="org.jfree.chart.renderer.category.LineAndShapeRenderer" %>
                        
     <%@ page import="org.jfree.chart.labels.PieSectionLabelGenerator" %>
          <%@ page import="org.jfree.chart.plot.PiePlot" %>
              <%@ page import="java.awt.BasicStroke" %>
          <%@ page import="org.jfree.chart.labels.StandardPieSectionLabelGenerator" %>
          <%@ page import="java.text.DecimalFormat" %>
     
      <%@ page import="org.jfree.data.jdbc.JDBCPieDataset" %>
       <%@ page import="org.jfree.data.general.DefaultPieDataset" %>
     <%
     try {       


	 Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
     DefaultPieDataset my_pie_chart_dataset = new DefaultPieDataset();
     Statement stmt = conn.createStatement();
     Statement stmt1 = conn.createStatement();

     /* Populate data from table to JFreeChart */
    
             ResultSet query_set = stmt.executeQuery("select nomTech, count(*) as nombre from priseencharge group by nomTech");
             while (query_set.next()) {
                     String nomTech = query_set.getString("nomTech");
                     int nombre = query_set.getInt("nombre");
                     ResultSet rs = stmt1.executeQuery("select nom, prenom from technicien where login='"+nomTech+"'");
                     while (rs.next()) {
                         String nom = rs.getString("nom");
                         String prenom = rs.getString("prenom");
                         String nomComplet=nom+" "+prenom;
                         my_pie_chart_dataset.setValue(nomComplet, nombre);
                         JFreeChart PieChartObject=ChartFactory.createPieChart("Top techniciens",my_pie_chart_dataset,true,true,false);
                         /* Close JDBC specific objects */
                         PiePlot plot = (PiePlot) PieChartObject.getPlot();
                        plot.setSectionPaint(0, new Color(160, 160, 255));
                        plot.setSectionPaint(2, new Color(128, 0, 0));
                        plot.setSectionPaint(1, new Color(0, 102, 102));

                        PieSectionLabelGenerator gen = new StandardPieSectionLabelGenerator(
                                "{0}: {1} ({2})", new DecimalFormat("0"), new DecimalFormat("0%"));
                            plot.setLabelGenerator(gen);

                         
                         int width=640; 
                                    int height=480;   
                                    float quality=1; /* Quality factor */
                                    /* Write Pie Chart as a JPEG file */
                                    File BarChart=new File("piechartTech.jpeg");              
                                    ChartUtilities.saveChartAsJPEG(BarChart, quality, PieChartObject,width,height); //Convert data source from table to Pie Chart Data Source                               
                        
                     } 
                      }
            
     
     } catch (Exception e) {
 		// TODO Auto-generated catch block
 		e.printStackTrace();
 	}       
%>
<%try {
    	 Class.forName("com.mysql.jdbc.Driver");
    	 java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
    	 Statement st=conn.createStatement();
         PreparedStatement ps=conn.prepareStatement("select count(*) as nombre,dateOuverture  from ticket where type='incident' group by dateOuverture");
         JDBCCategoryDataset dataset = new JDBCCategoryDataset(conn);

 		ResultSet rs=ps.executeQuery();
    	 
		while(rs.next()){
			Timestamp dateOuverture=rs.getTimestamp("dateOuverture");
			int nombre=rs.getInt("nombre");
			String timeO=dateOuverture+"";

			dataset.addValue(nombre,"incidents",timeO);
	        
	  	
				JFreeChart chart = ChartFactory.createLineChart("Tickets", "", "Count",dataset, PlotOrientation.VERTICAL, true, true, false);
		        CategoryPlot plot = (CategoryPlot) chart.getPlot();

		        LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();
		       
		        plot.getRendererForDataset(plot.getDataset(0)).setSeriesPaint(0, Color.green); 
		        renderer.setShapesVisible(true);
		        		ChartUtilities.saveChartAsJPEG(new File("chartline.jpeg"),chart,1000, 300);
	  		}
				
				
		 		  
		
        } catch (Exception e) {
	    		// TODO Auto-generated catch block
	    		e.printStackTrace();
	    	}
	     %>
	     
	     <%try {
    	 Class.forName("com.mysql.jdbc.Driver");
    	 java.sql.Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
    	 Statement st=conn.createStatement();
         PreparedStatement ps=conn.prepareStatement("select count(*) as nombre,dateOuverture  from ticket where type='demande de service' group by dateOuverture");
         JDBCCategoryDataset dataset = new JDBCCategoryDataset(conn);

 		ResultSet rs=ps.executeQuery();
    	 
		while(rs.next()){
			Timestamp dateOuverture=rs.getTimestamp("dateOuverture");
			int nombre=rs.getInt("nombre");
			String timeO=dateOuverture+"";

			dataset.addValue(nombre,"Demande de service",timeO);
	     

	  	
				JFreeChart chart = ChartFactory.createLineChart("tickets", "", "Count",dataset, PlotOrientation.VERTICAL, true, true, false);
		        CategoryPlot plot = (CategoryPlot) chart.getPlot();

		        LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot.getRenderer();
		       
		        plot.getRendererForDataset(plot.getDataset(0)).setSeriesPaint(0, Color.blue); 
		        renderer.setShapesVisible(true);

		        		ChartUtilities.saveChartAsJPEG(new File("chartlineD.jpeg"),chart,1000, 300);
	  		}
				
				
		 		  
		
        } catch (Exception e) {
	    		// TODO Auto-generated catch block
	    		e.printStackTrace();
	    	}
	     %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>espace responsable</title>
<link rel="stylesheet" href="responsable.css">
<style>
body {
   background-color: LightGrey ;
   
}
 p.double {border-style: double;}
 .deconnecter {
	-moz-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	-webkit-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5));
	background:-moz-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-webkit-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-o-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:-ms-linear-gradient(top, #79bbff 5%, #378de5 100%);
	background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5',GradientType=0);
	background-color:#79bbff;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #84bbf3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 30px;
	text-decoration:none;
	text-shadow:0px 1px 0px #528ecc;
}
.deconnecter:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff));
	background:-moz-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-webkit-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-o-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:-ms-linear-gradient(top, #378de5 5%, #79bbff 100%);
	background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff',GradientType=0);
	background-color:#378de5;
}
.deconnecter:active {
	position:relative;
	top:1px;
}
 


</style>



</head>
<body>
 <%String login=request.getParameter("login");%>  

		 <div id="header">
        <h1><strong>ANRT</strong>administrateur<a href="http://localhost:8080/gestionDesIncidents/login.html" style="position:relative; left:960px;" class="deconnecter">déconnecter</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       


</script></h1>
        </h1>
        </div>

      <ul class="main-navigation" >
  <li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp" ><b>Acceuil</b></a></li>
  <li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp"><b>Ticket</b></a>
    <ul>
      <li><a href="http://localhost:8080/gestionDesIncidents/ListerLesTickets.jsp?login=<%=login%>">Lister les tickets</a></li>
      <li><a href="http://localhost:8080/gestionDesIncidents/creerUnTicket.html" action="creerUnTicket.html" method="post">Creer un nouveau ticket</a></li>
      <li><a href="http://localhost:8080/gestionDesIncidents/ListerBDC.jsp">Base de connaissance</a></li>
      
     
   
    </ul>
  </li>
  <li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp"><b>Gestion</b></a>
    <ul>
      <li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Inventaires</a>
      	<ul>
          	<li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Consulter la liste des Inventaires</a>
          		<ul>
          			<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesMateriels.jsp">Par materiel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesLogiciels.jsp">Par logiciel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/ListerLesEquipementsReseau.jsp">Par equipement reseau</a></li>
          		</ul>
          	</li>
          	<li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Ajouter un inventaire</a>
          		<ul>
          			<li><a href="http://localhost:8080/gestionDesIncidents/CreerMateriel.html">Materiel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/CreerLogiciel.html">Logiciel</a></li>
          			<li><a href="http://localhost:8080/gestionDesIncidents/CreerLesEquipementsReseau.html">Equipement reseau</a></li>
          		</ul>
          	</li>
       	</ul>
       </li>
      <li><a href="http://localhost:8080/gestionDesIncidents/responsable.jsp">Techniciens</a>
      <ul>
          <li><a href="http://localhost:8080/gestionDesIncidents/ListerLesTechniciens.jsp">Consulter la liste des techniciens</a></li>
        </ul></li>
      
    </ul>
  </li>
  <li><a href="http://localhost:8080/gestionDesIncidents/Rapports.jsp"><b>Rapports</b></a></li>
  <li><a href="http://localhost:8080/gestionDesIncidents/Configuration.jsp"><b>Configuration</b></a></li>
</ul>
<font size="7"> Resultats & statistiques :</font>
<object data="RapportStatistiques.pdf" type="application/pdf" width="100%" height="100%">
<a href="RapportStatistiques.pdf"><IMG SRC="pdf.png" >
</a>
</object>
<%
	TicketImpl ticket= new TicketImpl();
	
	
	
	%>
 <div  id="hbet" style=" width:200px; height:200px; background-color:white; border-style: ridge;border-color:Gainsboro ;">

 
    <p><center>Nouveau:<br>  <br><FONT size="7"><b> <%= ticket.nouveauT() %></b></FONT></center>
    			 <a href="http://localhost:8080/gestionDesIncidents/ListerTicketNouveau.jsp"> <img style="position: relative;top: 40px;left: 70px;" src="arrow.png"></a>
    </p>
    
  </div>
<div  id="hbet" style=" top: -186px; left: 275px; width:200px; height:200px; background-color:white; border-style: ridge;border-color:Gainsboro ;">


    <p><center>En attente :<br><br><FONT size="7"><b><%= ticket.enattenteT() %></b></FONT></center>
      <a href="http://localhost:8080/gestionDesIncidents/ListerTicketEnAttente.jsp"><img style="position: relative;top: 40px;left: 70px;" src="arrow.png"></a></p>
    
    </div>
 <div id="hbet" style=" top: -412px; left: 499px;width:200px; height:200px;background-color:white; border-style: ridge;border-color:Gainsboro ; ">
    <p><center>Non resolu :<br> <br><FONT size="7"><b><%= ticket.nonresoluT() %></b></FONT></center>
    <a href="http://localhost:8080/gestionDesIncidents/ListerTicketNonResolu.jsp"> <img style="position: relative;top: 40px;left: 70px;" src="arrow.png"></a></p>
    
  </div> 
  
   <div  id="hbet" style="top: -638px; left: 724px; width:200px; height:200px;background-color:white; border-style: ridge;border-color:Gainsboro ; ">
  
    <p><center>Resolu :<br><br><FONT size="7"> <b><%= ticket.resoluT() %></b></FONT></center>
     <a href="http://localhost:8080/gestionDesIncidents/ListerTicketResolu.jsp"><img style="position: relative;top: 40px;left: 70px;" src="arrow.png"></a></p>
  </div> 


 <div  id="hbet" style=" top: -864px; left: 949px; width:200px; height:200px;background-color:white; border-style: ridge;border-color:Gainsboro ; ">
    <p><center>Clos :<br><br><FONT size="7"><b><%= ticket.closT() %></b></FONT></center>
     <a href="http://localhost:8080/gestionDesIncidents/ListerTicketClos.jsp"> <img style="position: relative;top: 40px;left: 70px;" src="arrow.png"></a></p>
  </div> 
  
  
  
  
  

<p style="position: relative; top: -864px;left: 50px;">
         <IMG  SRC="C:\Users\hp\Desktop\j2ee\eclipse\barchart_3D.jpeg" WIDTH="600" HEIGHT="400" BORDER="0" USEMAP="#chart" />
</p>
<p style="position: relative; top: -1280px;left: 700px;">

              <IMG SRC="C:\Users\hp\Desktop\j2ee\eclipse\piechartT.jpeg" WIDTH="600" HEIGHT="400" 
         BORDER="0" USEMAP="#chart">
         </p>
  <p style="position: relative; top: -1250px;left: 50px;">
          <IMG SRC="C:\Users\hp\Desktop\j2ee\eclipse\chartlineD.jpeg" WIDTH="1000" HEIGHT="400" BORDER="0" USEMAP="#chart" />
         </p>
  <p style="position: relative; top: -1270px;left: 50px;">
          <IMG SRC="C:\Users\hp\Desktop\j2ee\eclipse\chartline.jpeg" WIDTH="1000" HEIGHT="400" BORDER="0" USEMAP="#chart" />
          </p>
     <p style="position: relative; top: -1270px;left: 50px;">
          <IMG SRC="C:\Users\hp\Desktop\j2ee\eclipse\piechartTech.jpeg" WIDTH="600" HEIGHT="400" 
         BORDER="0" USEMAP="#chart">
</p>


<table  id="hbet" style="top: -1686px;left: 680px; width:350px; height:200px; background-color:white; border-style: ridge;border-color:Gainsboro ;">
											 <tr><th><b>Nom du Technicien </b></th><th><b>Average sum prise en charge:</b></th></tr>
 <%
     try {       


	 Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
     Statement stmt = conn.createStatement();
     Statement stmt1 = conn.createStatement();
     Statement stmt2 = conn.createStatement();

     ResultSet query_set2 = stmt2.executeQuery("select count(*) as somme from priseencharge");
             while (query_set2.next()) {
            	 int somme= query_set2.getInt("somme");

            
				             ResultSet query_set = stmt.executeQuery("select nomTech, count(*) as nombre from priseencharge group by nomTech");
				             while (query_set.next()) {
				                     String nomTech = query_set.getString("nomTech");
				                     int nombre = query_set.getInt("nombre");
				                     float pourcentage=nombre*100/somme;
				                     ResultSet rs = stmt1.executeQuery("select nom, prenom from technicien where login='"+nomTech+"'");
				                     while (rs.next()) {
				                         String nom = rs.getString("nom");
				                         String prenom = rs.getString("prenom");
				                         String nomComplet=nom+" "+prenom;
				                         
				                         %><tr>
 
   <td><%=nom %>&nbsp;&nbsp;<%=prenom %></td><td style="position: relative; left: 50px;"><%=pourcentage %>%</td></tr>
				                          <%
				                     }}} }catch (Exception e) {
                 		// TODO Auto-generated catch block
                 		e.printStackTrace();
                 	}       
                %></table>
  
  
  <table  id="hbet" style="top: -1686px;left: 680px; width:350px; height:200px; background-color:white; border-style: ridge;border-color:Gainsboro ;">
											 <tr><th><b>Priorite du ticket </b></th><th><b>Temps de la prise en charge</b></th><th><b>Cible temps de résolution</b></th></tr>
                
        <%
     try {       


	 Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondesincidents","root","");
     Statement stmt = conn.createStatement();
    
             ResultSet query_set = stmt.executeQuery("select priorite, SEC_TO_TIME(AVG(TIME_TO_SEC(`dureeTache`))) as timo,dureeTraitement from ticket where statut='clos' group by priorite");
             while (query_set.next()) {
        	 	     String priorite=query_set.getString("priorite");
					 String dureeTraitement=query_set.getString("dureeTraitement");
                     Time dureeTache = query_set.getTime("timo");
                     %><tr> <td><%=priorite  %></td><td style="position: relative; left: 50px;"> <%=dureeTache  %></td><td style="position: relative; left: 50px;"><%=dureeTraitement  %></td></tr><% }
     
     } catch (Exception e) {
 		// TODO Auto-generated catch block
 		e.printStackTrace();
 	}       
%>        
      </table>  
</body>
</html>