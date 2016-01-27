<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pl">
<head>
<script src="${pageContext.request.contextPath}/webjars/jquery/2.1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/jquery/2.1.4/jquery.js"></script>
	<script>
		$(document).ready(function(){
				$( "#add" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/rest/playerr/add',
						    context: document.body,
						    type: 'POST',
						    data:
							{
						    	firstName: 		document.getElementById('firstName').value,
							pin: 			document.getElementById('pin').value,
							registrationDate: 	document.getElementById('registrationDate').value
								
							},
						   	 success: function() { document.location.replace("${pageContext.request.contextPath}/showPersons.jsf"); },
 						   	 error: function() { alert("Coś jest źle"); }
						}
						).done(function() {
							  $( this ).addClass( "done" );
						});
					}
				);
			}
		);
	</script>
	<link href="${pageContext.request.contextPath}/webjars/bootstrap/3.2.0/css/bootstrap.min.css"  rel="stylesheet">
</head>

<body>
<jsp:include page="../elements/menu.jsp" />
<div class="container">
    <div class="row">
        <h1 class="text-center">Dodaj klienta</h1>

        	<form action="${pageContext.request.contextPath}/rest/playerr/add" data-toggle="validator" method="post" class="form-horizontal">
        	
		        <div class="form-group">
		            <label for="firstName" class="col-sm-2 control-label">Imie: </label>

		            <div class="col-sm-10">
		                <input type="text" name="firstName" id="firstName" class="form-control" data-minlength="2" value="${editedPerson.getFirstName()}" required >
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="pin" class="col-sm-2 control-label">Pesel: </label>

		            <div class="col-sm-10">
		                <input type="text" name="pin" id="pin" class="form-control"  required>
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="registrationDate" class="col-sm-2 control-label">Data rejestracji: </label>

		            <div class="col-sm-10">
		                <input type="text" name="registrationDate" id="registrationDate" class="form-control" placeholder="0" required>
		            </div>
		        </div>
		        <div class="form-group text-center">
		                <button id="add" type="submit" class="btn btn-success">Dodaj</button>
				<a href="${pageContext.request.contextPath}/player/showPlayers.jsp" class="btn btn-default" role="button">Cofnij</a>
		 	    </div>
		        </div>
		        
          </form>
</div>

</body>
</html>
