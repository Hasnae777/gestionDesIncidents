package gestionDesIncidents;

import java.io.Serializable;

public class Technicien implements Serializable {
	private int idTechnicien;
	private String nom;
	private String prenom;
	private String email;
	private int numTel;
	private String login;
	
	public int getIdTechnicien() {
		return idTechnicien;
	}
	public void setIdTechnicien(int idTechnicien) {
		this.idTechnicien = idTechnicien;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNumTel() {
		return numTel;
	}
	public void setNumTel(int numTel) {
		this.numTel = numTel;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	
	public Technicien(String nom, String prenom, String email, int numTel, String login) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.numTel = numTel;
		this.login = login;
	}
	public Technicien() {
		super();
	}
}
