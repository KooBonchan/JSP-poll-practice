<%@page import="java.util.ArrayList"%>
<%@page import="beans.PollListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pollManager" class="databases.PollManager" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./style/list-view.css">
</head>
<body>
    <header>
        <h1>Poll</h1>
    </header>
    <ul>
<%
	List<PollListBean> polls = pollManager.readAllPoll();
	if(polls == null) polls = new ArrayList<PollListBean>(1);
	int count = polls.size();
	for(var poll : polls){
		String isActive = poll.isActive()?"":"inactive";
		%>
		<li class="list-container  <%= isActive %>">
		<div class="question">
			<a href="javascript:void(0);" 
				onclick="openPollPopup(<%=poll.getPollId()%>)">
		    <%=poll.getQuestion() %>
			</a>
		</div>
		<div class="date"><%=poll.getStartDate() %></div>
		<div class="date"><%=poll.getEndDate() %></div>
		</li>
		<%		
	}
%>
    </ul>
    <a href="poll-write.html" id="poll-write">Create new Poll</a>
</body>
<script>
function openPollPopup(pollId){
	var popup = window.open('poll-popup?poll_id=' + pollId, 'PollPopup', 'width=350,height=500, scrollbars=yes');
	popup.document.body.addEventListener('contextmenu', e=>{e.preventDefault();});
}
</script>
</html>