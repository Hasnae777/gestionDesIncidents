package gestionDesIncidents;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BDCImpl implements BDCCatalogue{

	@Override
	public List<BDC> getBDC() {
		List<BDC> er=new ArrayList<BDC>();

		Connection conn=SingletonConnection.getConnection();
		try {PreparedStatement ps=conn.prepareStatement("select idBC,titre,categorie,contenu from basedeconnaissance");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			BDC t=new BDC();
			t.setIdBC(rs.getInt("idBC"));
			t.setTitre(rs.getString("titre"));
			t.setCategorie(rs.getString("categorie"));
			t.setContenu(rs.getString("contenu"));
			
			er.add(t);
		}}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return er;
	}

}

