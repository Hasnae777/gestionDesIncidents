package gestionDesIncidents;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeImpl implements IEmployeCatalogue {

	@Override
	public List<Employe> getEmploye() {
		List<Employe> employe=new ArrayList<Employe>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from employe");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Employe e=new Employe();
				e.setIdEmploye(rs.getInt("idEmploye"));
				e.setNom(rs.getString("nom"));
				e.setPrenom(rs.getString("prenom"));
				e.setDepartement(rs.getString("departement"));
				e.setEmail(rs.getString("email"));
				e.setNumTel(rs.getInt("numTel"));
				e.setLogin(rs.getString("login"));
				employe.add(e);	
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return employe;
	}
	public List<Employe> getEmployeParMc(String mc){
		List<Employe> employe=new ArrayList<Employe>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from employe where nom like ?");
			ps.setString(1, "%"+mc+"%");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Employe e=new Employe();
				e.setIdEmploye(rs.getInt("idEmploye"));
				e.setNom(rs.getString("nom"));
				e.setPrenom(rs.getString("prenom"));
				e.setDepartement(rs.getString("departement"));
				e.setEmail(rs.getString("email"));
				e.setNumTel(rs.getInt("numTel"));
				e.setLogin(rs.getString("login"));
				employe.add(e);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return employe;
	}

}
