package gestionDesIncidents;

import java.io.Serializable;

public class Employe implements Serializable {
	private int idEmploye;
	private String nom;
	private String prenom;
	private String departement;
	private String email;
	private int numTel;
	private String login;
	public int getIdEmploye() {
		return idEmploye;
	}
	public void setIdEmploye(int idEmploye) {
		this.idEmploye = idEmploye;
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
	public String getDepartement() {
		return departement;
	}
	public void setDepartement(String departement) {
		this.departement = departement;
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
	public Employe(String nom, String prenom, String departement, String email, int numTel, String login) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.departement = departement;
		this.email = email;
		this.numTel = numTel;
		this.login = login;
	}
	public Employe() {
		super();
	}

}
