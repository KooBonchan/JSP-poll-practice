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
	<form action="poll-submit" method="post" id="poll-form">
		<table>
			<tr>
				<td id="question" colspan="2">super super long question with
					length up to 200 characters.</td>
			</tr>
			<tr>
				<td class="date" colspan="2">Survey date: 2024-02-24 ~
					2025-02-25</td>
			</tr>
			<tr>
				<td class="date" colspan="2">Last changed: 2020-02-02</td>
			</tr>
			<tr>
				<td id="content" colspan="2">
					<ul>
						<li>Sample Item</li>
						<li>Sample Item</li>
						<li>Sample Item</li>
						<li>Sample Item</li>
						<li>Sample Item</li>
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
</body>
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
</html>