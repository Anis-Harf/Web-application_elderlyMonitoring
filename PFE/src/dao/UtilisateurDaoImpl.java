package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.mysql.jdbc.PreparedStatement;

import beans.Utilisateur;

public class UtilisateurDaoImpl implements UtilisateurDao{
	private DaoFactory factory;
	
	public UtilisateurDaoImpl(DaoFactory fact) {
		this.factory=fact;
	}
	public int verifier(String pseudo, String mp) {

		try {
			
			Connection connex = factory.getConnection();
			String query = "SELECT id_user FROM user where pseudo=? and pw=?";
			PreparedStatement preparedStatement = (PreparedStatement) connex.prepareStatement(query);
			preparedStatement.setString(1, pseudo);
			preparedStatement.setString(2, mp);
			ResultSet result = preparedStatement.executeQuery();
			if (!result.next()) return 0;
			else{
				System.out.println(result.getString(1));
				return Integer.parseInt(result.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public boolean verifierIdent(String ident){
		try {
			
			Connection connex = factory.getConnection();
			String query = "SELECT * FROM user where pseudo=?";
			PreparedStatement preparedStatement = (PreparedStatement) connex.prepareStatement(query);
			preparedStatement.setString(1, ident);
			ResultSet result = preparedStatement.executeQuery();
			if (!result.next()) return false;
			else return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public int ajouter(Utilisateur user) {
		try {
			
			Connection connex = factory.getConnection();
			String query = "INSERT INTO user(pseudo,pw) VALUES(?,?)";
			PreparedStatement preparedStatement = (PreparedStatement) connex.prepareStatement(query);
			preparedStatement.setString(1, user.getPseudo());
			preparedStatement.setString(2, user.getMp());
			preparedStatement.execute();
			
			query = "SELECT id_user FROM user where pseudo=? and pw=?";
			preparedStatement = (PreparedStatement) connex.prepareStatement(query);
			preparedStatement.setString(1, user.getPseudo());
			preparedStatement.setString(2, user.getMp());
			ResultSet result = preparedStatement.executeQuery();
			return Integer.parseInt(result.getString(1));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
			
	}

}
