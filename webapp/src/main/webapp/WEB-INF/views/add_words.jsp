<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

<!-- Custom styles for this template -->
<link href="resources/sticky-footer-navbar.css" rel="stylesheet">
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
						<li><a href="user">Moje zestawy</a></li>
						<li><a href="about">Kontakt</a></li>
						
						
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:choose>

							<c:when test="${empty pageContext.request.userPrincipal.name}">
								<li><a href="/webapp/signup"><span class="glyphicon glyphicon-user"></span> Zarejestruj</a></li>
								<li><a href="/webapp/login"><span class="glyphicon glyphicon-log-in"></span> Zaloguj</a></li>
							</c:when>

							<c:otherwise>
								<li><a href="#">Witaj ${pageContext.request.userPrincipal.name}!</a></li>
								<li><a href="javascript:formSubmit()"><span class="glyphicon glyphicon-log-out"></span> Wyloguj</a></li>

							</c:otherwise>

						</c:choose>

					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</nav>

		<!-- Main page content ----------------------------- -->


		<div class="container-tab">
			<form:form method="post" action="save" modelAttribute="wordsDtoForm">
			
			Nazwa zestawu <input name="wordsSet"></input>
				<input style="visibility: hidden" name="owner" value="${pageContext.request.userPrincipal.name}">

				<table class="table table-striped table-condensed">
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody id="myTable">
						<%-- <c:forEach items="${wordsDtoForm.words}" var="words" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><input name="words[${status.index}].stringA" value="${words.stringA}" /></td>
								<td><input name="words[${status.index}].stringB" value="${words.stringB}" /></td>

							</tr>
						</c:forEach> --%>

					</tbody>
				</table>
				<br />

				<input type="submit" value="Zapisz zestaw" />
				<input type="button" onclick="AddRows()" value="Dodaj wiersze" />

			</form:form>


		</div>
	</div>
	<!-- Main page content ----------------------------- -->


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
	<script type="text/javascript">
		var tbl = document.getElementById("myTable");
		for (var i = 0; i < tbl.rows.length; i++) {
			tbl.rows[i].cells[2].addEventListener("click", RemoveRow, false);
		}

		function AddRows() {
			var status;
			var row;
			for (i = 1; i < 6; i++) {
				row = tbl.insertRow(tbl.rows.length);
				row.insertCell(0).innerHTML = "";
				row.insertCell(1).innerHTML = "<input>";
				row.insertCell(2).innerHTML = "<input>";
			}
			ApplyNumeration();
		}

		function RemoveRow(e) {
			var rowID = parseInt(this.parentNode.cells[0].innerHTML);
			tbl.deleteRow(rowID);
			ApplyNumeration();
		}

		function ApplyNumeration() {
			for (var i = 0; i < tbl.rows.length; i++) {
				tbl.rows[i].cells[0].innerHTML = i + 1;
				tbl.rows[i].cells[1].firstElementChild.setAttribute("name",
						"words[" + i + "].stringA");
				tbl.rows[i].cells[2].firstElementChild.setAttribute("name",
						"words[" + i + "].stringB");

			}
		}
	</script>

	<script type="text/javascript">
		window.onload = AddRows();
	</script>



</body>
</html>
