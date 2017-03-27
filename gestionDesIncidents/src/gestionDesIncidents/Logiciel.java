package gestionDesIncidents;

import java.io.Serializable;
import java.sql.Date;

public class Logiciel implements Serializable {
	private int idLogiciel;
	private String numSerie;
	private String type;
	private String nom;
	private String etat;
	
	private String version;
	private String licence;
	private Date dateAchat;
	private Date dateExpiration;
	public int getIdLogiciel() {
		return idLogiciel;
	}
	public void setIdLogiciel(int idLogiciel) {
		this.idLogiciel = idLogiciel;
	}
	public String getNumSerie() {
		return numSerie;
	}
	public void setNumSerie(String numSerie) {
		this.numSerie = numSerie;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getLicence() {
		return licence;
	}
	public void setLicence(String licence) {
		this.licence = licence;
	}
	public Date getDateAchat() {
		return dateAchat;
	}
	public void setDateAchat(Date dateAchat) {
		this.dateAchat = dateAchat;
	}
	public Date getDateExpiration() {
		return dateExpiration;
	}
	public void setDateExpiration(Date dateExpiration) {
		this.dateExpiration = dateExpiration;
	}
	public Logiciel(String numSerie, String type, String nom, String version, String licence, Date dateAchat,
			Date dateExpiration, String etat) {
		super();
		this.numSerie = numSerie;
		this.type = type;
		this.etat= etat;
		this.nom = nom;
		this.version = version;
		this.licence = licence;
		this.dateAchat = dateAchat;
		this.dateExpiration = dateExpiration;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public Logiciel() {
		super();
	}
	
	
}
