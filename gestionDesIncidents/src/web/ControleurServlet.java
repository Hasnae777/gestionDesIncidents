package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gestionDesIncidents.Employe;
import gestionDesIncidents.EmployeImpl;
import gestionDesIncidents.IEmployeCatalogue;

public class ControleurServlet extends HttpServlet {
	private EmployeImpl employe;
	private static final long serialVersionUID=1L; 
	public void init() throws ServletException {
		employe=new EmployeImpl();
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

			EmployeModele mod= new EmployeModele();
			List<Employe> emp= employe.getEmploye();
			mod.setEmploye(emp);
			request.setAttribute("modele", mod);
			
		
		
		
		
		this.getServletContext().getRequestDispatcher("EmployeView.jsp").forward(request, response);
		
	}
}
