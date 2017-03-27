<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                        
     <%@ page import="org.jfree.data.category.*" %>
          <%@ page import="org.jfree.chart.axis.CategoryAxis" %>
              <%@ page import="java.awt.BasicStroke" %>
     
      <%@ page import="org.jfree.chart.plot.XYPlot" %>
     
 
      
     <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
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
		
 <IMG SRC="C:\Users\hp\Desktop\j2ee\eclipse\chartline.jpeg" WIDTH="1000" HEIGHT="400" BORDER="0" USEMAP="#chart" />
</body>
</html>