<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pl">
<head>
<link rel='stylesheet'
	href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Team</title>
<script>
	$(document)
			.ready(
					function() {
						$("#edit")
								.on(
										'click',
										function(e) {
											e.preventDefault();
											$
													.ajax({
														url : '${pageContext.request.contextPath}/rest/playerr/edit/${editedPerson.getId()}',
														type : 'PUT',
														data : {
															firstName: 		document.getElementById('firstName').value,
															pin: 			document.getElementById('pin').value,
															registrationDate: 	document.getElementById('registrationDate').value
														},
														success : function() {
															document.location.replace("${pageContext.request.contextPath}/player/showPlayers.jsp")
														},
														error : function() {
															alert("Nieprawidłowo wprowadzono dane!");
														}
													});
										});
					});
</script>
</head>

<body>
<jsp:include page="../elements/menu.jsp" />
	<div class="container">
		<div class="row">
			<h1 class="text-center">Edit player</h1>

			<form action="${pageContext.request.contextPath}/rest/playerr/edit/${editedPerson.getId()}"
				data-toggle="validator" method="post" class="form-horizontal">
				
			<div class="form-group">
		            <label for="firstName" class="col-sm-2 control-label">First name: </label>

		            <div class="col-sm-10">
		                <input type="text" name="firstName" id="firstName" class="form-control" data-minlength="2" value="${editedPerson.getFirstName()}" required >
		            </div>
		        </div>

			<div class="form-group">
		            <label for="pin" class="col-sm-2 control-label">Pin: </label>

		            <div class="col-sm-10">
		                <input type="text" name="pin" id="pin" class="form-control" value="${editedPerson.getPin()}" required>
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="registrationDate" class="col-sm-2 control-label">Date: </label>

		            <div class="col-sm-10">
		                <input type="text" name="registrationDate" id="registrationDate" class="form-control" placeholder="0" value="${editedPerson.getRegistrationDate()}" required>
		            </div>
		        </div>
		        <div class="form-group text-center">
		        <button id="edit" type="submit" class="btn btn-success">Update</button>
				<a href="${pageContext.request.contextPath}/player/showPlayers.jsp" class="btn btn-default" role="button">Back</a>
		 	    </div>
		        </div>
		        
		</form>

	</div>
</body>
</html>
