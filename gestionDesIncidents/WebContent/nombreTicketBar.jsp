<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<IMG SRC="C:\Users\hp\Desktop\j2ee\eclipse\barchart_3D.jpeg" WIDTH="600" HEIGHT="400" BORDER="0" USEMAP="#chart" />

</body>
</html>