package co.com.jhilton.wiki.villains.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ResourceManager {

	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost/villains", "villainApp", "imevil");
	}
}
