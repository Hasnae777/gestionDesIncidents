package gestionDesIncidents;

import java.io.Serializable;
import java.sql.Date;

public class Materiel implements Serializable{
private int idMateriel;
private String numSerie;
private String type;
private String modele;
private String nom;
private String user;
private String etat;
private Date dateAffectation;
public Materiel() {
	super();
}
public Materiel(String numSerie, String type, String modele, String nom, String user, String etat, Date dateAffectation,
		Date dateAchat, String dureeGarantie, String iP, String mac, String os, String processeur, String ram,
		String lieu, String fabricant, Date dateDerniereMod, String description) {
	super();
	this.numSerie = numSerie;
	this.type = type;
	this.modele = modele;
	this.nom = nom;
	this.user = user;
	this.etat = etat;
	this.dateAffectation = dateAffectation;
	this.dateAchat = dateAchat;
	this.dureeGarantie = dureeGarantie;
	IP = iP;
	this.mac = mac;
	this.os = os;
	this.processeur = processeur;
	this.ram = ram;
	this.lieu = lieu;
	this.fabricant = fabricant;
	this.dateDerniereMod = dateDerniereMod;
	this.description = description;
}
public int getIdMateriel() {
	return idMateriel;
}
public void setIdMateriel(int idMateriel) {
	this.idMateriel = idMateriel;
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
public String getModele() {
	return modele;
}
public void setModele(String modele) {
	this.modele = modele;
}
public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public String getEtat() {
	return etat;
}
public void setEtat(String etat) {
	this.etat = etat;
}
public Date getDateAffectation() {
	return dateAffectation;
}
public void setDateAffectation(Date dateAffectation) {
	this.dateAffectation = dateAffectation;
}
public Date getDateAchat() {
	return dateAchat;
}
public void setDateAchat(Date dateAchat) {
	this.dateAchat = dateAchat;
}
public String getDureeGarantie() {
	return dureeGarantie;
}
public void setDureeGarantie(String dureeGarantie) {
	this.dureeGarantie = dureeGarantie;
}
public String getIP() {
	return IP;
}
public void setIP(String iP) {
	IP = iP;
}
public String getMac() {
	return mac;
}
public void setMac(String mac) {
	this.mac = mac;
}
public String getOs() {
	return os;
}
public void setOs(String os) {
	this.os = os;
}
public String getProcesseur() {
	return processeur;
}
public void setProcesseur(String processeur) {
	this.processeur = processeur;
}
public String getRam() {
	return ram;
}
public void setRam(String ram) {
	this.ram = ram;
}
public String getLieu() {
	return lieu;
}
public void setLieu(String lieu) {
	this.lieu = lieu;
}
public String getFabricant() {
	return fabricant;
}
public void setFabricant(String fabricant) {
	this.fabricant = fabricant;
}
public Date getDateDerniereMod() {
	return dateDerniereMod;
}
public void setDateDerniereMod(Date dateDerniereMod) {
	this.dateDerniereMod = dateDerniereMod;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
private Date dateAchat;
private String dureeGarantie;
private String IP;
private String mac;
private String os;
private String processeur;
private String ram;
private String lieu;
private String fabricant;
private Date dateDerniereMod;
private String description;
}
