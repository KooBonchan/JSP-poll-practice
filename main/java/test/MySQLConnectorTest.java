package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnectorTest {

	public static void main(String[] args) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb", "sql_practice", "12345")){
				System.out.println("Success");
			}
		}
		catch (SQLException e) {System.out.println("SQLException: " + e.getMessage());} 
		catch (Exception e) {System.out.println("Exception: " + e.getMessage());}
	}

}