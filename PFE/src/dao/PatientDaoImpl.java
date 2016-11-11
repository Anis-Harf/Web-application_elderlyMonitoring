package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import beans.Patient;

public class PatientDaoImpl implements PatientDao{
	private DaoFactory factory;
	public PatientDaoImpl(DaoFactory fact) {
		this.factory=fact;
	}
	public List<Patient> lister(String id_user) {
		Connection connex;
		List<Patient> list = new ArrayList<Patient>();
		PreparedStatement stat;
		try {
			connex = factory.getConnection();
			stat= (PreparedStatement) connex.prepareStatement("Select * from patient where id_user=?");
			stat.setString(1, id_user);
			ResultSet result = stat.executeQuery();
			while (result.next()){
				Patient pat = new Patient(result.getString(2),result.getString(3),result.getString(4));
				list.add(pat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Patient> checkPatient(String nom, String prenom, String id_user){
		Connection connex;
		List<Patient> list = new ArrayList<Patient>();
try {
			connex = factory.getConnection();

		PreparedStatement stat;
		
		if (prenom !=null){
			stat= (PreparedStatement) connex.prepareStatement("select * from patient where ((nom=? and prenom=?) or (nom=? and prenom=?)) and id_user=?");
			stat.setString(1, nom);
			stat.setString(2, prenom);
			stat.setString(4, nom);
			stat.setString(3, prenom);
			stat.setString(5, id_user);
					
				}
		else {
			stat= (PreparedStatement) connex.prepareStatement("select * from patient where (nom=? or prenom=?) and id_user=?");
			stat.setString(1, nom);
			stat.setString(2, nom);
			stat.setString(5, id_user);
		}
				ResultSet result = stat.executeQuery();
				while (result.next()){
					//System.out.println(result.getString(2));
					Patient pat = new Patient(result.getString(2),result.getString(3),result.getString(4));
					list.add(pat);
				}
} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
}
		return list;
	}
	
	
	public List<String> getPhotos(String nom, String prenom,String id_user)
	{
		Connection connex;
		List<String> list = new ArrayList<String>();
		try {
			connex = factory.getConnection();

		PreparedStatement stat;
		
			stat= (PreparedStatement) connex.prepareStatement("select id_patient from patient where (nom=? and prenom=?) and id_user=?");
			stat.setString(1, nom);
			stat.setString(2, prenom);
			stat.setString(3, id_user);
			ResultSet result = stat.executeQuery();
			if (result.next()){
				String id_patient = result.getString(1);
				stat= (PreparedStatement) connex.prepareStatement("select nom_fichier from image where id_patient=?");
				stat.setString(1, id_patient);
				result = stat.executeQuery();
				while (result.next()){
					//System.out.println(result.getString(2));
					String tof = result.getString(1);
					list.add(tof);
				}
			}
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	return list;
	}

}
