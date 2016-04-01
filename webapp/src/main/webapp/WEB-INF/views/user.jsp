<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="pl">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>1000 słów</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/sticky-footer-navbar.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->



<style>
.container-tab {
	margin-right: auto;
	margin-left: auto;
	max-width: 500px; /* or 950px */
}

.container {
	margin-right: auto;
	margin-left: auto;
	max-width: 910px; /* or 950px */
}
</style>
</head>

<body>

	<c:url value="/j_spring_security_logout" var="logoutUrl" />

	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>

	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

	<div class="container" style="margin-top: 15px;">

		<!-- Static navbar -->
		<nav class="navbar navbar-default" style="border-radius: 0px;">
			<div class="container-fluid">
				<div class="navbar-header">

					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
						aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

					<a class="navbar-brand" href="#">1000 słów</a>
				</div>

				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="home">Główna</a></li>
						<li class="active"><a href="#">Moje zestawy</a></li>
						<li><a href="about">Kontakt</a></li>
						

					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Witaj ${pageContext.request.userPrincipal.name}!</a></li>
						<li><a href="javascript:formSubmit()"><span class="glyphicon glyphicon-log-out"></span> Wyloguj</a></li>

					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</nav>

		<!-- Main component for a primary marketing message or call to action -->

		<div class="container-fluid">
			<div>
				<a href="user/get" class="btn btn-default btn-sm" role="button">utwórz nowy zestaw</a>
			</div>
			<div style="border-bottom: 1px solid #888; padding-top: 15px; font-size: 90%">Moje zestawy</div>
			<div style="font-size: 90%">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Lp.</th>
							<th>Nazwa</th>
							<th>Ilość słów</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="id_of_table">
						<c:forEach items="${allSets}" var="sets" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="show/${sets.id}">${sets.setsName}</a></td>
								<td>${fn:length(sets.words)}</td>
								<td><a href="user/delete/${sets.id}">usuń</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

		</div>

	</div>
	<!-- /container -->




	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
