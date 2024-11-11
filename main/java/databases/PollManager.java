package databases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import beans.PollBean;
import beans.PollItem;
import beans.PollListBean;

public class PollManager {
	private BasicDataSource dataSource;
	public PollManager() {
		dataSource = DatabaseConnectionPool.getDataSource();
	}
	
	public boolean createPoll(PollListBean pollListBean, PollBean pollBean) {
		String sqlPollList = "INSERT INTO poll_list "
				+ "(question, start_date, end_date, is_checkbox, is_active) "
				+ "VALUES (?, ?, ?, ?, ?)";
		String sqlPollItem = "INSERT INTO poll_item "
				+ "(poll_id, item_id, item_name) "
				+ "VALUES (?, ?, ?)";
		try(Connection connection = dataSource.getConnection()){
			
			try(PreparedStatement preparedStatement = connection.prepareStatement(sqlPollList)){
				preparedStatement.setString(1, pollListBean.getQuestion());
				preparedStatement.setString(2, pollListBean.getStartDate());
				preparedStatement.setString(3, pollListBean.getEndDate());
				preparedStatement.setBoolean(4, pollListBean.isCheckbox());
				preparedStatement.setBoolean(5, pollListBean.isActive());
				int result = preparedStatement.executeUpdate();
				if(result < 1) return false;
			}
			try(PreparedStatement preparedStatement = connection.prepareStatement(sqlPollItem)){
				int count = 1;
				for(var item : pollBean.getItems()) {
					preparedStatement.setInt(1, pollBean.getPollId());
					preparedStatement.setInt(2, count);
					preparedStatement.setString(3,item.getName());
					preparedStatement.executeUpdate();
					count++;
				}
			}
			return true;
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	public List<PollListBean> readAllPoll(){
		//Todo
		String sql = "select id, question, start_date, end_date, write_date, is_checkbox, is_active "
				+ "from poll_list "
				+ "order by id desc ";
		List<PollListBean> result = new ArrayList<PollListBean>();
		try(Connection connection = dataSource.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery()
		){
			
			while(resultSet.next()) {
				PollListBean pollList = new PollListBean();
				pollList.setId(resultSet.getInt("id"));
				pollList.setQuestion(resultSet.getString("question"));
				pollList.setStartDate(resultSet.getString("start_date"));
				pollList.setEndDate(resultSet.getString("end_date"));
				pollList.setWriteDate(resultSet.getString("write_date"));
				pollList.setCheckbox(resultSet.getBoolean("is_checkbox"));
				pollList.setActive(resultSet.getBoolean("is_active"));
				result.add(pollList);
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
		
		return result;
	}
	
	public PollBean readPoll(PollListBean pollListBean) {
		String sql = "Select item_id, item_name, count "
				+ "from poll_item "
				+ "where poll_id = ?";
		try(Connection connection = dataSource.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(sql)){
			preparedStatement.setInt(1, pollListBean.getId());
			try(ResultSet resultSet = preparedStatement.executeQuery()){
				//TODO
				PollBean pollBean = new PollBean();
				pollBean.setPollId(pollListBean.getId());
				while(resultSet.next()) {
					PollItem pollItem = new PollItem();
					pollItem.setId(resultSet.getInt("item_id"));
					pollItem.setName(resultSet.getString("item_name"));
					pollItem.setCount(resultSet.getInt("count"));
					pollBean.getItems().add(pollItem);
				}
				return pollBean;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			// When server crashes -- consider that time
			// Cache input to somewhere else?
		}
		return null;
	}
	
}
