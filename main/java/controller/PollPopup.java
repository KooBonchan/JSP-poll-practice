package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.PollBean;
import beans.PollListBean;
import databases.PollManager;

@WebServlet("/poll-popup")
public class PollPopup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PollManager pollManager;
	public PollPopup() {
		pollManager = new PollManager();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int pollId;
		try {
			pollId = Integer.parseInt(request.getParameter("poll_id"));
		}catch (RuntimeException e){
			response.sendRedirect("poll-list-view.jsp");
			return;
		}
		
		PollListBean pollListBean = pollManager.readPoll(pollId);
		PollBean pollBean = pollManager.readPollContents(pollListBean);
		if(pollListBean == null || pollBean == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("close.html");
			dispatcher.forward(request, response);
			return;
		}
		
		request.setAttribute("pollListBean", pollListBean);
		request.setAttribute("pollBean", pollBean);
		
		String targetUrl = "poll-popup.jsp";
		if( ! pollListBean.isActive()) {
			targetUrl = "poll-result.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(targetUrl);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
