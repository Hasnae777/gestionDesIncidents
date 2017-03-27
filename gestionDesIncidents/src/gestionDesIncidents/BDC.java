package gestionDesIncidents;

import java.io.Serializable;

public class BDC implements Serializable{
private int idBC;
private String titre;
private String categorie;
private String contenu;
public int getIdBC() {
	return idBC;
}
public void setIdBC(int idBC) {
	this.idBC = idBC;
}
public String getTitre() {
	return titre;
}
public void setTitre(String titre) {
	this.titre = titre;
}
public String getCategorie() {
	return categorie;
}
public void setCategorie(String categorie) {
	this.categorie = categorie;
}
public String getContenu() {
	return contenu;
}
public void setContenu(String contenu) {
	this.contenu = contenu;
}
public BDC(String titre, String categorie, String contenu) {
	super();
	this.titre = titre;
	this.categorie = categorie;
	this.contenu = contenu;
}
public BDC() {
	super();
}

}
