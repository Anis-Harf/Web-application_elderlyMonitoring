package dao;

import java.util.List;

import beans.Patient;

public interface PatientDao {

		public List<Patient> lister(String id_user);
		public List<Patient> checkPatient(String nom, String prenom, String id_user);
		public List<String> getPhotos(String nom, String prenom, String id_user);
}
