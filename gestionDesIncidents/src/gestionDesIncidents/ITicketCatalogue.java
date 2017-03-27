package gestionDesIncidents;
import java.util.List;

public interface ITicketCatalogue {
	public  List<Ticket> getTicket();
	public  List<Ticket> getTicketTitre(String titre);
	
}
