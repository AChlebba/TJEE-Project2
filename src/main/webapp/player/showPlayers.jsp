<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet'
	href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Sklep</title>
<script>
	
	$(document)
			.ready(
					function() {
						$
								.ajax({
									url : '${pageContext.request.contextPath}/rest/playerr/getAll',
									type : 'GET',
									success : function(data) {
										var people = [];
										var d = data.length;
										for (var i = 0; i < d; i++) {
											var tblRow = "<tr>" + "<td>"
													+ data[i].firstName + "</td>"
													+ "<td>" + data[i].pin
													+ "</td>" + "<td>"
													+ data[i].registrationDate + "</td>"
													+ "<td>" +
														"<a href='${pageContext.request.contextPath}/updatePlayer/"+data[i].id+"' class='btn btn-xs btn-primary' role='button'>Edit</a> "+
														"<button id="+data[i].id+" onClick='deletePlayer("+data[i].id+")' type='submit' class='btn btn-xs btn-danger'>Delete</button>"
													+ "</td>"
													+ "</tr>"
											$(tblRow).appendTo(
													"#userdata tbody");
										}
									}
								});
					});
</script>
	<script>
		function deletePlayer(id)
				{	
					$.ajax
					(
						{
							url: '${pageContext.request.contextPath}/rest/playerr/delete/'+id,
							type: 'DELETE',
							success: function() { document.location.reload(true);}
						}	
					);
				}
	</script>

<link rel='stylesheet'
	href='webjars/bootstrap/3.2.0/css/bootstrap.min.css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
<jsp:include page="../elements/menu.jsp" />

	<div class="container">
		<div class="row">
			<h1 class="text-center">Klienci</h1>
			<br />

			<table id="userdata" class="table table-striped">
				<thead>
						<th>Imie</th>
						<th>Pesel</th>
						<th>Data rejestracji</th>
						<th>Akcja</th>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
