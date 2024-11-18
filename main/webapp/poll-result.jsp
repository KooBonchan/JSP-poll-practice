<%@page import="java.util.Random"%>
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

    <link rel="stylesheet" href="./style/popup.css">
    <link rel="stylesheet" href="./style/result.css">
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
							<div class="progress" style="width: <%=percent%>px;" ></div>
						</div>
						<div class="count"><%=count%></div>
					</li>
					<%
						
				}
				%>
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
<script>
function getRandomColor() {
  var letters = '23456789ABCD';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 12)];
  }
  return color;
}
document.querySelectorAll(".progress").forEach(progress => {
	const randomColor = getRandomColor();
	progress.style.backgroundColor = randomColor;
});
document.getElementById("close").addEventListener("click", e=>window.close());

</script>
</html>