package gestionDesIncidents;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PriseEnChargeImpl implements PriseEnChargeCatalogue {

	@Override
	public List<PriseEnCharge> getPriseEnCharge(int idTicket) {
		List<PriseEnCharge> er=new ArrayList<PriseEnCharge>();

		Connection conn=SingletonConnection.getConnection();
		try {PreparedStatement ps=conn.prepareStatement("select idPEC,priorite, dateDebut,dateDerniereMod,dureeTache,statutP,statut, note,idTicket,nomTech from priseEnCharge where idTicket="+idTicket);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			PriseEnCharge t=new PriseEnCharge();
			t.setIdPEC(rs.getInt("idPEC"));
			
			t.setDateDebut(rs.getTimestamp("dateDebut"));
			t.setDateDerniereMod(rs.getTimestamp("dateDerniereMod"));
			t.setDureeTache(rs.getTime("DureeTache"));
			t.setStatutP(rs.getString("statutP"));
			t.setStatut(rs.getString("statut"));
			t.setNote(rs.getString("note"));
			t.setIdTicket(rs.getInt("idTicket"));
			t.setNomTech(rs.getString("nomTech"));
			t.setPriorite(rs.getString("priorite"));

			er.add(t);
		}}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return er;	}

}
