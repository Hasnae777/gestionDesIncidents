package gestionDesIncidents;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

public class Ticket implements Serializable {

	private int idTicket;
	private String type;
	private String categorie;
	private String urgence;
	private String impact;
	private String priorite;
	private String titre;
	private String lieu;
	private String description;
	private String statut;
	private Timestamp dateOuverture;
	private Timestamp dateFermeture;
	private Time dureeTache;
	private String dureeTraitement;
	public Time getDureeTache() {
		return dureeTache;
	}
	public void setDureeTache(Time dureeTache) {
		this.dureeTache = dureeTache;
	}
	public String getDureeTraitement() {
		return dureeTraitement;
	}
	public void setDureeTraitement(String dureeTraitement) {
		this.dureeTraitement = dureeTraitement;
	}
	private String employeId;
	private String nomTech;
	public String getNomTech() {
		return nomTech;
	}
	public void setNomTech(String nomTech) {
		this.nomTech = nomTech;
	}
	private String login;
	public String getEmployeId() {
		return employeId;
	}
	public void setEmployeId(String employeId) {
		this.employeId = employeId;
	}
	public int getIdTicket() {
		return idTicket;
	}
	public void setIdTicket(int idTicket) {
		this.idTicket = idTicket;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	public String getUrgence() {
		return urgence;
	}
	public void setUrgence(String urgence) {
		this.urgence = urgence;
	}
	public String getImpact() {
		return impact;
	}
	public void setImpact(String impact) {
		this.impact = impact;
	}
	public String getPriorite() {
		return priorite;
	}
	public void setPriorite(String priorite) {
		this.priorite = priorite;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getLieu() {
		return lieu;
	}
	public void setLieu(String lieu) {
		this.lieu = lieu;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatut() {
		return statut;
	}
	public void setStatut(String statut) {
		this.statut = statut;
	}
	public Date getDateOuverture() {
		return dateOuverture;
	}
	public void setDateOuverture(Timestamp dateOuverture) {
		this.dateOuverture = dateOuverture;
	}
	
	public Timestamp getDateFermeture() {
		return dateFermeture;
	}
	public void setDateFermeture(Timestamp dateFermeture) {
		this.dateFermeture = dateFermeture;
	}
	
	
	public Ticket(String type, String categorie, String urgence, String impact, String priorite, String titre,
			String lieu, String description, String statut, Timestamp dateOuverture, Timestamp dateFermeture,
			Time dureeTache, String dureeTraitement, String employeId, String nomTech, String login) {
		super();
		this.type = type;
		this.categorie = categorie;
		this.urgence = urgence;
		this.impact = impact;
		this.priorite = priorite;
		this.titre = titre;
		this.lieu = lieu;
		this.description = description;
		this.statut = statut;
		this.dateOuverture = dateOuverture;
		this.dateFermeture = dateFermeture;
		this.dureeTache = dureeTache;
		this.dureeTraitement = dureeTraitement;
		this.employeId = employeId;
		this.nomTech = nomTech;
		this.login = login;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public Ticket() {
		super();
	}
	
	
	
	
}
