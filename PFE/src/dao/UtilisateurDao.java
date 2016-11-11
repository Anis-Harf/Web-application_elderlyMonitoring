package dao;
import beans.Utilisateur;

public interface UtilisateurDao {

	 int verifier(String pseudo, String mp);
	 public boolean verifierIdent(String ident);
	 int ajouter(Utilisateur user);
}
