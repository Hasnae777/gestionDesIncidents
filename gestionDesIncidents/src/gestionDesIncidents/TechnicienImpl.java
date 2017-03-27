package gestionDesIncidents;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TechnicienImpl implements ITechnicienCatalogue{

	@Override
	public List<Technicien> getTechnicien() {
		List<Technicien> technicien=new ArrayList<Technicien>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from technicien");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Technicien e=new Technicien();
				e.setIdTechnicien(rs.getInt("idTechnicien"));
				e.setNom(rs.getString("nom"));
				e.setPrenom(rs.getString("prenom"));
				e.setEmail(rs.getString("email"));
				e.setNumTel(rs.getInt("numTel"));
				e.setLogin(rs.getString("login"));
				technicien.add(e);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return technicien;
	}
	
}
