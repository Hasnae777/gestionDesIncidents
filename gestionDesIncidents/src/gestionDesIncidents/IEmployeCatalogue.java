package gestionDesIncidents;

import java.util.List;

public interface IEmployeCatalogue {
	public List<Employe> getEmploye();
	public List<Employe> getEmployeParMc(String mc);
	
}
