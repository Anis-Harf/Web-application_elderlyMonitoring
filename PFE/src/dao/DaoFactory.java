package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DaoFactory {
	private String url;
	private String user;
	private String pw;
	
	public DaoFactory(String ur,String utilisa,String mot){
		this.url=ur;
		this.user=utilisa;
		this.pw=mot;
	}
	
	public static DaoFactory getInstance(){
		 try {
	            Class.forName("com.mysql.jdbc.Driver");
	        } catch (ClassNotFoundException e) {

	        }

	        DaoFactory instance = new DaoFactory("jdbc:mysql://localhost:3306/ehealth", "root", "canal+");
	        return instance;
	}
	
	public Connection getConnection() throws SQLException{
		
		return DriverManager.getConnection(url, user, pw);
	}
	
	public UtilisateurDao getUtilisateur(){
		return new UtilisateurDaoImpl(this);
	}
	
	public PatientDao getPatient(){
		return new PatientDaoImpl(this);
	}
}
