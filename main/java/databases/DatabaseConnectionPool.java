package databases;
import java.time.Duration;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import lombok.Getter;

public class DatabaseConnectionPool {
	@Getter
	private static final BasicDataSource dataSource;
	
	static {
		dataSource = new BasicDataSource();
		dataSource.setUrl("jdbc:mysql://localhost:3306/jsp_poll_project");
		dataSource.setUsername("kbc");
		dataSource.setPassword("12345");
		
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setInitialSize(5);
		dataSource.setMaxTotal(10);
		dataSource.setMinIdle(1);
		dataSource.setMaxIdle(2);
		dataSource.setMaxWait(Duration.ofMillis(7000));
	}
	
}
