package beans;

public class Patient {
	private String nom;
	private String prenom;
	private String image;
	
	public Patient (String name,String last, String pic){
		this.nom=name;
		this.prenom=last;
		this.image=pic;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
}
