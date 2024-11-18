package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

import beans.PollBean;
import beans.PollItem;
import beans.PollListBean;
import databases.PollManager;

@WebServlet("/poll-insert")
public class PollInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PollManager pollManager;
	public PollInsert() {
		pollManager = new PollManager();
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PollListBean pollListBean;
		PollBean pollBean;
		try {
			String question = request.getParameter("question");
			String startDate = request.getParameter("start_date"); 
			String endDate = request.getParameter("end_date"); 
			boolean isCheckbox = Boolean.getBoolean(request.getParameter("is_checkbox"));
			
			System.out.println(question);
			System.out.println(startDate);
			System.out.println("checkbox: " + isCheckbox);
			
			pollListBean = new PollListBean();
			pollListBean.setQuestion(question);
			pollListBean.setStartDate(startDate);
			pollListBean.setEndDate(endDate);
			pollListBean.setCheckbox(isCheckbox);
			pollListBean.setActive(pollListBean.checkIsActive());
			System.out.println("active: " + pollListBean.isActive());
			
			pollBean = new PollBean();
			String[] items = request.getParameterValues("items");
			System.out.println(Arrays.toString(items));
			int idx = 1;
			for(String item: items) {
				if(item.length() > 0) {
					PollItem pollItem = new PollItem();
					pollItem.setId(idx);
					pollItem.setName(item);
					idx++;
				}
			}
			if(pollManager.createPoll(pollListBean, pollBean)) {
				response.sendRedirect("poll-list-view.jsp");
				return;
			};
			
		}catch (Exception e) {
			System.out.println("Failed to upload survey.");
		}
		response.sendRedirect("poll-write.html");
	}

}
