<%@page import="beans.PollItem"%>
<%@page import="beans.PollListBean"%>
<%@page import="beans.PollBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Poll</title>
<link rel="stylesheet" href="./style/popup.css">
</head>
<body>
	<%
	PollListBean pollListBean = (PollListBean) request.getAttribute("pollListBean");
	PollBean pollBean = (PollBean) request.getAttribute("pollBean");
	if(pollBean == null || pollListBean == null){
		%>
	    <p>No poll data available.</p>
		<% 
	}
	else { 
	%>
	<form action="poll-submit" method="post" id="poll-form">
		<input type="hidden" name="poll_id" value="<%=pollListBean.getPollId() %>">
		<table>
			<tr>
				<td id="question" colspan="2"><%=pollListBean.getQuestion() %></td>
			</tr>
			<tr>
				<td class="date" colspan="2">
					Survey date:
					<%=pollListBean.getStartDate() %> ~
					<%=pollListBean.getEndDate() %>
				</td>
			</tr>
			<tr>
				<td class="date" colspan="2">Last changed: <%=pollListBean.getWriteDate() %></td>
			</tr>
			<tr>
				<td id="content" colspan="2">
					<ul>
						<%
						String inputType = pollListBean.isCheckbox() ? "checkbox" : "radio";
						String label = pollListBean.isCheckbox() ? "pollItems" : "pollItem";
						for(var item : pollBean.getItems()) {
							
							%>
							<li>
							<input type="<%=inputType %>" name="<%=label%>" value="<%=item.getId()%>">
							<%=item.getName() %>
							</li>
							<%
								
						}
						%>
						<li>Sample Item</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="button" id="submit"><a href="#">submit</a></td>
				<td class="button" id="close"><a href="#">close</a></td>
			</tr>
		</table>
	</form>
	<script>
	document.getElementById('submit')
	.addEventListener('click',e=>{
		e.preventDefault();
		document.getElementById('poll-form').submit();
		window.close();
	});
	
	document.getElementById('close')
	.addEventListener('click',e=>{
		e.preventDefault();
		window.close();
	});
	</script>
	<%
	}%>
</body>
</html>