package conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnexionBD {
	public static Connection seConnecter(){
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/artisan","root","");
		}catch(Exception ex) {
			System.err.println(ex);
		}
		
		return conn; 
	}
}
