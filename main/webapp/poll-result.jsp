<%@page import="beans.PollBean"%>
<%@page import="beans.PollListBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="/src/style/popup.css">
    <link rel="stylesheet" href="/src/style/result.css">
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
	int total = pollBean.getTotal();
	%>
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
			<td class="participant" colspan="2">Participant: <span><%=total %></span></td>
		</tr>
		<tr>
			<td id="content" colspan="2">
				<ul>
				<%
				for(var item : pollBean.getItems()) {
					int count = item.getCount();
					int percent = Math.round(count / (float)total * 100);
					
					%>
					<li class="list-container">
						<div class="item" id="sample-item"><%=item.getName() %></div>
						<div class="progress-bar">
							<div class="progress" style="background-color: red; width: <%=percent%>px;" ></div>
						</div>
						<div class="count"><%=count%></div>
					</li>
					<%
						
				}
				%>
					<li class="list-container">
						<div class="item" id="sample-item">
							Test item
							Fightman on fire
							With classic Mozart on the solo battle
						</div>
						<div class="progress-bar">
							<div class="progress" style="background-color: red; width: 50px;">
							</div>
						</div>
						<div class="count">2003</div>
					</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="button" id="close" colspan=2><a href="#">close</a></td>
		</tr>
	</table>
	<%
	
	}%>
</body>
</html>