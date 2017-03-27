package gestionDesIncidents;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class PriseEnCharge {
private int idPEC;
private Timestamp dateDebut;
private  Timestamp dateDerniereMod;
private Time dureeTache;
private String statut; 
private String priorite;
public PriseEnCharge() {
	super();
}
public PriseEnCharge(Timestamp dateDebut, Timestamp dateDerniereMod, Time dureeTache, String statutP, String note, int idTicket,
		String nomTech,String statut,String priorite) {
	super();
	this.dateDebut = dateDebut;
	this.dateDerniereMod = dateDerniereMod;
	this.dureeTache = dureeTache;
	this.statutP = statutP;
	this.note = note;
	this.idTicket = idTicket;
	this.nomTech = nomTech;
	this.statut=statut;
	this.priorite=priorite;
}
public String getPriorite() {
	return priorite;
}
public void setPriorite(String priorite) {
	this.priorite = priorite;
}
public String getStatut() {
	return statut;
}
public void setStatut(String statut) {
	this.statut = statut;
}
public int getIdPEC() {
	return idPEC;
}
public void setIdPEC(int idPEC) {
	this.idPEC = idPEC;
}
public Timestamp getDateDebut() {
	return dateDebut;
}
public void setDateDebut(Timestamp dateDebut) {
	this.dateDebut = dateDebut;
}
public Timestamp getDateDerniereMod() {
	return dateDerniereMod;
}
public void setDateDerniereMod(Timestamp dateDerniereMod) {
	this.dateDerniereMod = dateDerniereMod;
}
public Time getDureeTache() {
	return dureeTache;
}
public void setDureeTache(Time dureeTache) {
	this.dureeTache = dureeTache;
}
public String getStatutP() {
	return statutP;
}
public void setStatutP(String statutP) {
	this.statutP = statutP;
}
public String getNote() {
	return note;
}
public void setNote(String note) {
	this.note = note;
}
public int getIdTicket() {
	return idTicket;
}
public void setIdTicket(int idTicket) {
	this.idTicket = idTicket;
}
public String getNomTech() {
	return nomTech;
}
public void setNomTech(String nomTech) {
	this.nomTech = nomTech;
}
private String statutP;
private String note;
private int idTicket;
private String nomTech;

}
