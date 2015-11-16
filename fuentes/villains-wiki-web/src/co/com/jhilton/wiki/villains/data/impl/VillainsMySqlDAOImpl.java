package co.com.jhilton.wiki.villains.data.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.com.jhilton.wiki.villains.data.IVillainsDAO;
import co.com.jhilton.wiki.villains.data.ResourceManager;
import co.com.jhilton.wiki.villains.domain.Villain;

public class VillainsMySqlDAOImpl implements IVillainsDAO {
	
	@Override
	public Villain getVillainByName(String name) {
		ResourceManager connectionManager = new ResourceManager(); 
		Connection connection = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Villain villain = null;
		try {
			connection = connectionManager.getConnection();
			stmt = connection.prepareStatement("SELECT * FROM villains WHERE dsname = ?");
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			if (rs.next()) {
				villain = new Villain(rs.getString("dsname"), rs.getString("dsprofile"));
			}
			return villain;
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				connectionManager.closeConnection(connection);
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}

	@Override
	public int createVillain(Villain newVillain) {
		ResourceManager connectionManager = new ResourceManager(); 
		Connection connection = null;
		PreparedStatement stmt = null;
		try {
			connection = connectionManager.getConnection();
			stmt = connection.prepareStatement("INSERT INTO villains(dsname, dsprofile, dsphoto) VALUES (?, ?, ?)");
			stmt.setString(1, newVillain.getName());
			stmt.setString(2, newVillain.getDescription());
			stmt.setString(3, newVillain.getImageUrl());

			return stmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				connectionManager.closeConnection(connection);
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}

}
