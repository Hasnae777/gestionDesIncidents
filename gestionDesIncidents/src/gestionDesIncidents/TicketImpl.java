package gestionDesIncidents;

import java.sql.Connection;
import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

public class TicketImpl implements ITicketCatalogue{

	@Override
	public List<Ticket> getTicket() {
		List<Ticket> ticket=new ArrayList<Ticket>();
		Connection conn=SingletonConnection.getConnection();
		try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,dureeTraitement,dureeTache,employeId,nomTech from ticket");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			Ticket t=new Ticket();
			t.setIdTicket(rs.getInt("idTicket"));
			t.setType(rs.getString("type"));
			t.setCategorie(rs.getString("categorie"));
			t.setUrgence(rs.getString("urgence"));
			t.setImpact(rs.getString("impact"));
			t.setPriorite(rs.getString("priorite"));
			t.setTitre(rs.getString("titre"));
			t.setLieu(rs.getString("lieu"));
			t.setDescription(rs.getString("description"));
			t.setStatut(rs.getString("statut"));
			
			t.setDateOuverture(rs.getTimestamp("dateOuverture"));
			t.setDateFermeture(rs.getTimestamp("dateFermeture"));
			t.setDureeTraitement(rs.getString("dureeTraitement"));
			t.setDureeTache(rs.getTime("dureeTache"));
			
			t.setEmployeId(rs.getString("employeId"));
			t.setNomTech(rs.getString("nomTech"));

			
			
			ticket.add(0,t);

		}
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ticket;
	}
	
public int nouveauT(){
	int nouveau = 0;
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select count(*) from ticket where statut='nouveau'");
	ResultSet rs=ps.executeQuery();
	while (rs.next()){
		nouveau=rs.getInt(1);	
	}
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return nouveau;
	
	
}

public int enattenteT(){
	int enattente=0;
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select count(*) from ticket where statut='en attente'");
	ResultSet rs=ps.executeQuery();
	while (rs.next()){
		enattente=rs.getInt(1);	
	}
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return enattente;
	
}
public int nonresoluT(){
	int nonresolu=0;
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select count(*) from ticket where statut='non resolu'");
	ResultSet rs=ps.executeQuery();
	while (rs.next()){
		nonresolu=rs.getInt(1);	
	}
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return nonresolu;
	
}
public int resoluT(){
	int resolu=0;
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select count(*) from ticket where statut='resolu'");
	ResultSet rs=ps.executeQuery();
	while (rs.next()){
		resolu=rs.getInt(1);	
	}
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return resolu;
	
}

public int closT(){
	int clos=0;
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select count(*) from ticket where statut='clos'");
	ResultSet rs=ps.executeQuery();
	while (rs.next()){
		clos=rs.getInt(1);	
	}
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return clos;
	
}


public List<Ticket> rechNouveau(){
	

List<Ticket> ticket=new ArrayList<Ticket>();
Connection conn=SingletonConnection.getConnection();
try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,employeId from ticket where statut='nouveau'");
ResultSet rs=ps.executeQuery();
while(rs.next()){
	Ticket t=new Ticket();
	t.setIdTicket(rs.getInt("idTicket"));
	t.setType(rs.getString("type"));
	t.setCategorie(rs.getString("categorie"));
	t.setUrgence(rs.getString("urgence"));
	t.setImpact(rs.getString("impact"));
	t.setPriorite(rs.getString("priorite"));
	t.setTitre(rs.getString("titre"));
	t.setLieu(rs.getString("lieu"));
	t.setDescription(rs.getString("description"));
	t.setStatut(rs.getString("statut"));
	t.setDateOuverture(rs.getTimestamp("dateOuverture"));
	t.setDateFermeture(rs.getTimestamp("dateFermeture"));
	t.setEmployeId(rs.getString("employeId"));
	
	
	ticket.add(t);

}
	
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
return ticket;

}


public List<Ticket> rechEnAttente(){
	List<Ticket> ticket=new ArrayList<Ticket>();
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,employeId from ticket where statut='en attente'");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		Ticket t=new Ticket();
		t.setIdTicket(rs.getInt("idTicket"));
		t.setType(rs.getString("type"));
		t.setCategorie(rs.getString("categorie"));
		t.setUrgence(rs.getString("urgence"));
		t.setImpact(rs.getString("impact"));
		t.setPriorite(rs.getString("priorite"));
		t.setTitre(rs.getString("titre"));
		t.setLieu(rs.getString("lieu"));
		t.setDescription(rs.getString("description"));
		t.setStatut(rs.getString("statut"));
		t.setDateOuverture(rs.getTimestamp("dateOuverture"));
		t.setDateFermeture(rs.getTimestamp("dateFermeture"));
		t.setEmployeId(rs.getString("employeId"));
		
		
		ticket.add(t);

	}
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ticket;

	}


public List<Ticket> rechNonResolu(){
	List<Ticket> ticket=new ArrayList<Ticket>();
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,employeId from ticket where statut='non resolu'");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		Ticket t=new Ticket();
		t.setIdTicket(rs.getInt("idTicket"));
		t.setType(rs.getString("type"));
		t.setCategorie(rs.getString("categorie"));
		t.setUrgence(rs.getString("urgence"));
		t.setImpact(rs.getString("impact"));
		t.setPriorite(rs.getString("priorite"));
		t.setTitre(rs.getString("titre"));
		t.setLieu(rs.getString("lieu"));
		t.setDescription(rs.getString("description"));
		t.setStatut(rs.getString("statut"));
		t.setDateOuverture(rs.getTimestamp("dateOuverture"));
		t.setDateFermeture(rs.getTimestamp("dateFermeture"));
		t.setEmployeId(rs.getString("employeId"));
		
		
		
		ticket.add(t);

	}
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ticket;

	}
public List<Ticket> rechResolu(){
	List<Ticket> ticket=new ArrayList<Ticket>();
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,employeId from ticket where statut='resolu'");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		Ticket t=new Ticket();
		t.setIdTicket(rs.getInt("idTicket"));
		t.setType(rs.getString("type"));
		t.setCategorie(rs.getString("categorie"));
		t.setUrgence(rs.getString("urgence"));
		t.setImpact(rs.getString("impact"));
		t.setPriorite(rs.getString("priorite"));
		t.setTitre(rs.getString("titre"));
		t.setLieu(rs.getString("lieu"));
		t.setDescription(rs.getString("description"));
		t.setStatut(rs.getString("statut"));
		t.setDateOuverture(rs.getTimestamp("dateOuverture"));
		t.setDateFermeture(rs.getTimestamp("dateFermeture"));
		t.setEmployeId(rs.getString("employeId"));
		
		
		ticket.add(t);

	}
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ticket;

	}

public List<Ticket> rechClos(){
	List<Ticket> ticket=new ArrayList<Ticket>();
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,employeId from ticket where statut='clos'");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		Ticket t=new Ticket();
		t.setIdTicket(rs.getInt("idTicket"));
		t.setType(rs.getString("type"));
		t.setCategorie(rs.getString("categorie"));
		t.setUrgence(rs.getString("urgence"));
		t.setImpact(rs.getString("impact"));
		t.setPriorite(rs.getString("priorite"));
		t.setTitre(rs.getString("titre"));
		t.setLieu(rs.getString("lieu"));
		t.setDescription(rs.getString("description"));
		t.setStatut(rs.getString("statut"));
		t.setDateOuverture(rs.getTimestamp("dateOuverture"));
		t.setDateFermeture(rs.getTimestamp("dateFermeture"));
		t.setEmployeId(rs.getString("employeId"));
		
		
		
		ticket.add(t);

	}
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ticket;

	}
public List<Ticket> getTicketTechN(String nomTech){
	List<Ticket> ticket=new ArrayList<Ticket>();
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,employeId from ticket where nomTech=? and statut='nouveau'");
	ps.setString(1, nomTech);

	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		Ticket t=new Ticket();
		t.setIdTicket(rs.getInt("idTicket"));
		t.setType(rs.getString("type"));
		t.setCategorie(rs.getString("categorie"));
		t.setUrgence(rs.getString("urgence"));
		t.setImpact(rs.getString("impact"));
		t.setPriorite(rs.getString("priorite"));
		t.setTitre(rs.getString("titre"));
		t.setLieu(rs.getString("lieu"));
		t.setDescription(rs.getString("description"));
		t.setStatut(rs.getString("statut"));
		t.setDateOuverture(rs.getTimestamp("dateOuverture"));
		t.setDateFermeture(rs.getTimestamp("dateFermeture"));
		t.setEmployeId(rs.getString("employeId"));
		
		
		ticket.add(t);

	}
		
	}catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ticket;

}
public List<Ticket> getTicketTechNonR(String nomTech){
	List<Ticket> ticket=new ArrayList<Ticket>();
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,employeId from ticket where nomTech=? and statut='non resolu'");
	ps.setString(1, nomTech);

	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		Ticket t=new Ticket();
		t.setIdTicket(rs.getInt("idTicket"));
		t.setType(rs.getString("type"));
		t.setCategorie(rs.getString("categorie"));
		t.setUrgence(rs.getString("urgence"));
		t.setImpact(rs.getString("impact"));
		t.setPriorite(rs.getString("priorite"));
		t.setTitre(rs.getString("titre"));
		t.setLieu(rs.getString("lieu"));
		t.setDescription(rs.getString("description"));
		t.setStatut(rs.getString("statut"));
		t.setDateOuverture(rs.getTimestamp("dateOuverture"));
		t.setDateFermeture(rs.getTimestamp("dateFermeture"));
		t.setEmployeId(rs.getString("employeId"));
		
		
		
		ticket.add(t);

	}
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ticket;

}
public List<Ticket> getTicket(String login) {
	List<Ticket> ticket=new ArrayList<Ticket>();
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,dureeTraitement,dureeTache,employeId,nomTech from ticket where employeId='"+login+"'");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		Ticket t=new Ticket();
		t.setIdTicket(rs.getInt("idTicket"));
		t.setType(rs.getString("type"));
		t.setCategorie(rs.getString("categorie"));
		t.setUrgence(rs.getString("urgence"));
		t.setImpact(rs.getString("impact"));
		t.setPriorite(rs.getString("priorite"));
		t.setTitre(rs.getString("titre"));
		t.setLieu(rs.getString("lieu"));
		t.setDescription(rs.getString("description"));
		t.setStatut(rs.getString("statut"));
		
		t.setDateOuverture(rs.getTimestamp("dateOuverture"));
		t.setDateFermeture(rs.getTimestamp("dateFermeture"));
		t.setDureeTraitement(rs.getString("dureeTraitement"));
		t.setDureeTache(rs.getTime("dureeTache"));
		
		t.setEmployeId(rs.getString("employeId"));
		t.setNomTech(rs.getString("nomTech"));

		
		
		ticket.add(0,t);

	}
		
	}catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ticket;
}

public List<Ticket> getTicketGroupBy(String gb,String login) {
	List<Ticket> ticket=new ArrayList<Ticket>();
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,dureeTraitement,dureeTache,employeId,nomTech from ticket where employeId='"+login+"' group by "+gb);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		Ticket t=new Ticket();
		t.setIdTicket(rs.getInt("idTicket"));
		t.setType(rs.getString("type"));
		t.setCategorie(rs.getString("categorie"));
		t.setUrgence(rs.getString("urgence"));
		t.setImpact(rs.getString("impact"));
		t.setPriorite(rs.getString("priorite"));
		t.setTitre(rs.getString("titre"));
		t.setLieu(rs.getString("lieu"));
		t.setDescription(rs.getString("description"));
		t.setStatut(rs.getString("statut"));
		
		t.setDateOuverture(rs.getTimestamp("dateOuverture"));
		t.setDateFermeture(rs.getTimestamp("dateFermeture"));
		t.setDureeTraitement(rs.getString("dureeTraitement"));
		t.setDureeTache(rs.getTime("dureeTache"));
		
		t.setEmployeId(rs.getString("employeId"));
		t.setNomTech(rs.getString("nomTech"));

		
		
		ticket.add(0,t);

	}
		
	}catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ticket;
}

@Override
public List<Ticket> getTicketTitre(String titre) {
	List<Ticket> ticket=new ArrayList<Ticket>();
	Connection conn=SingletonConnection.getConnection();
	try {PreparedStatement ps=conn.prepareStatement("select idTicket,type,categorie,urgence,impact,priorite,titre,lieu,description,statut,dateOuverture,dateFermeture,dureeTraitement,dureeTache,employeId,nomTech from ticket where titre='"+titre+"'");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		Ticket t=new Ticket();
		t.setIdTicket(rs.getInt("idTicket"));
		t.setType(rs.getString("type"));
		t.setCategorie(rs.getString("categorie"));
		t.setUrgence(rs.getString("urgence"));
		t.setImpact(rs.getString("impact"));
		t.setPriorite(rs.getString("priorite"));
		t.setTitre(rs.getString("titre"));
		t.setLieu(rs.getString("lieu"));
		t.setDescription(rs.getString("description"));
		t.setStatut(rs.getString("statut"));
		
		t.setDateOuverture(rs.getTimestamp("dateOuverture"));
		t.setDateFermeture(rs.getTimestamp("dateFermeture"));
		t.setDureeTraitement(rs.getString("dureeTraitement"));
		t.setDureeTache(rs.getTime("dureeTache"));
		
		t.setEmployeId(rs.getString("employeId"));
		t.setNomTech(rs.getString("nomTech"));

		
		
		ticket.add(0,t);
	}
	
	}catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ticket;

}}




