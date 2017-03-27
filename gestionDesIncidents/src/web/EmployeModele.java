package web;
import java.util.ArrayList;
import java.util.List;

import gestionDesIncidents.Employe;

public class EmployeModele {
	private List<Employe> employe=new ArrayList<Employe>();
	private String mc;
	

	public String getMc() {
		return mc;
	}

	public void setMc(String mc) {
		this.mc = mc;
	}

	public List<Employe> getEmploye() {
		return employe;
	}

	public void setEmploye(List<Employe> employe) {
		this.employe = employe;
	}
	
	
}
