package gestionDesIncidents;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MaterielImpl implements IMaterielCatalogue{

	@Override
	public List<Materiel> getMateriel() {
		List<Materiel> materiel=new ArrayList<Materiel>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select * from materiel");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Materiel e=new Materiel();
				e.setIdMateriel(rs.getInt("idMateriel"));
				e.setType(rs.getString("type"));
				e.setNumSerie(rs.getString("numSerie"));
				e.setModele(rs.getString("modele"));
				e.setNom(rs.getString("nom"));
				e.setUser(rs.getString("user"));
				e.setEtat(rs.getString("etat"));
				e.setDateAffectation(rs.getDate("dateAffectation"));
				e.setDateAchat(rs.getDate("dateAchat"));
				e.setDureeGarantie(rs.getString("dureeGarantie"));
				e.setIP(rs.getString("IP"));
				e.setMac(rs.getString("mac"));
				e.setOs(rs.getString("os"));
				e.setProcesseur(rs.getString("processeur"));
				e.setRam(rs.getString("ram"));
				e.setLieu(rs.getString("lieu"));
				e.setFabricant(rs.getString("fabricant"));
				e.setDateDerniereMod(rs.getDate("dateDerniereMod"));
				e.setDescription(rs.getString("description"));

				materiel.add(e);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return materiel;
	}

}
