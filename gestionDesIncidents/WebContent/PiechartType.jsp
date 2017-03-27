
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <IMG SRC="C:\Users\hp\Desktop\j2ee\eclipse\piechartT.jpeg" WIDTH="600" HEIGHT="400" 
         BORDER="0" USEMAP="#chart">
    </body>
</html> 
