package gestionDesIncidents;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LogicielImpl implements ILogicielCatalogue{

	@Override
	public List<Logiciel> getLogiciel() {

		List<Logiciel> er=new ArrayList<Logiciel>();

		Connection conn=SingletonConnection.getConnection();
		try {PreparedStatement ps=conn.prepareStatement("select idLogiciel,type,etat,nom,numSerie,version,licence,dateAchat,dateExpiration from logiciel");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			Logiciel t=new Logiciel();
			t.setIdLogiciel(rs.getInt("idLogiciel"));
			t.setType(rs.getString("type"));
			t.setNom(rs.getString("nom"));
			t.setEtat(rs.getString("etat"));

			t.setNumSerie(rs.getString("numSerie"));
			t.setVersion(rs.getString("version"));
			t.setLicence(rs.getString("licence"));
			t.setDateAchat(rs.getDate("dateAchat"));
			t.setDateExpiration(rs.getDate("dateExpiration"));
			er.add(t);
		}}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return er;
	}
	}

	
	

