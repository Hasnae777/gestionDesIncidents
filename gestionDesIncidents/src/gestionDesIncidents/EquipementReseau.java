package gestionDesIncidents;

import java.io.Serializable;
import java.util.Date;

public class EquipementReseau implements Serializable{
	
	private int idReseau;
	private String type;
	private String nom;
	private String IP;
	private String network;
	private String mac;
	private String port;
	private Date dateAjout;
	private String etat;
	public EquipementReseau() {
		super();
	}
	public EquipementReseau(String type,String etat, String nom, String iP, String network, String mac, String port,
			Date dateAjout) {
		super();
		this.type = type;
		this.nom = nom;
		IP = iP;
		this.network = network;
		this.mac = mac;
		this.port = port;
		this.dateAjout = dateAjout;
		this.etat=etat;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	public int getIdReseau() {
		return idReseau;
	}
	public void setIdReseau(int idReseau) {
		this.idReseau = idReseau;
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
	public String getIP() {
		return IP;
	}
	public void setIP(String iP) {
		IP = iP;
	}
	public String getNetwork() {
		return network;
	}
	public void setNetwork(String network) {
		this.network = network;
	}
	public String getMac() {
		return mac;
	}
	public void setMac(String mac) {
		this.mac = mac;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public Date getDateAjout() {
		return dateAjout;
	}
	public void setDateAjout(Date dateAjout) {
		this.dateAjout = dateAjout;
	}

}
