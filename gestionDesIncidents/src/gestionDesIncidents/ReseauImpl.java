package gestionDesIncidents;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

public class ReseauImpl implements IReseauCatalogue {

	@Override
	public List<EquipementReseau> getReseau() {
		
		List<EquipementReseau> er=new ArrayList<EquipementReseau>();

		Connection conn=SingletonConnection.getConnection();
		try {PreparedStatement ps=conn.prepareStatement("select idReseau,type,nom,etat,IP,network,mac,port,dateAjout from equipementreseau");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			EquipementReseau t=new EquipementReseau();
			t.setIdReseau(rs.getInt("idReseau"));
			t.setType(rs.getString("type"));
			t.setNom(rs.getString("nom"));
			t.setIP(rs.getString("IP"));
			t.setNetwork(rs.getString("network"));
			t.setMac(rs.getString("mac"));
			t.setPort(rs.getString("port"));
			t.setDateAjout(rs.getDate("dateAjout"));
			t.setEtat(rs.getString("etat"));

			er.add(t);
		}}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return er;
	}

}
