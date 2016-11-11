package beans;

public class Utilisateur {
	  private String pseudo;
	    private String mp;
	    
	    public Utilisateur(String iden, String pw){
	    	this.pseudo=iden;
	    	this.mp=pw;
	    }
		public String getPseudo() {
			return pseudo;
		}
		public void setPseudo(String pseudo) {
			this.pseudo = pseudo;
		}
		public String getMp() {
			return mp;
		}
		public void setMp(String mp) {
			this.mp = mp;
		}
	
}
