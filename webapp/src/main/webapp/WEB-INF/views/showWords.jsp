<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link href="resources/sticky-footer-navbar.css" rel="stylesheet">

<script type='text/javascript' src='http://code.jquery.com/jquery-2.0.2.js'></script>
<link rel="stylesheet" type="text/css" href="http://getbootstrap.com/dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="http://www.bootstrap-switch.org/dist/css/bootstrap3/bootstrap-switch.css">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.0/css/bootstrap-toggle.min.css" rel="stylesheet">

<script type='text/javascript' src="http://www.bootstrap-switch.org/dist/js/bootstrap-switch.js"></script>

<style>
.toggle.android {
	border-radius: 0px;
}

.toggle.android .toggle-handle {
	border-radius: 0px;
}

.toggle-group {
	transition: none;
	-webkit-transition: none;
}

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

word {
	font-size: 200%;
}
</style>



<script>
	var stringsA = new Array();
	var stringsB = new Array();
	var remained;
	var errors = 0;
	var index = 1;
	remained = stringsB.length;
	var toTranslate;
	var translateBox;

	function fillTables(i, strA, strB) {
		stringsA[i] = strA;
		stringsB[i] = strB;

	}

	function fill(direction) {

		switch (direction) {

		case "ang":

			<c:forEach items="${set.words}" var="words" varStatus="status">
			fillTables("${status.count}", "${words.stringB}",
					"${words.stringA}");
			/* console.log("StringA[" + "${status.count}" + "]" + stringsA["${status.count}"]);
			console.log("StringB[" + "${status.count}" + "]" + stringsB["${status.count}"]); */
			</c:forEach>
			break;

		case "pol":
			<c:forEach items="${set.words}" var="words" varStatus="status">
			fillTables("${status.count}", "${words.stringA}",
					"${words.stringB}");
			/* console.log("StringA[" + "${status.count}" + "]" + stringsA["${status.count}"]);
			console.log("StringB[" + "${status.count}" + "]" + stringsB["${status.count}"]); */
			</c:forEach>

			break;

		}

	}

	function hideCol(col_no) {
		var tbl = document.getElementById('id_of_table');
		var rows = tbl.getElementsByTagName('tr');

		for (var row = 0; row < rows.length; row++) {
			var cels = rows[row].getElementsByTagName('td')

			if (row % 2 == 0)
				cels[col_no].style.color = '#f9f9f9';
			else
				cels[col_no].style.color = '#ffffff';

		}

	}

	function showCol(col_no) {
		var tbl = document.getElementById('id_of_table');
		var rows = tbl.getElementsByTagName('tr');

		for (var row = 0; row < rows.length; row++) {
			var cels = rows[row].getElementsByTagName('td')

			cels[col_no].style.color = "#333";

		}

	}

	function myOverFunction() {
		document.getElementById("test").style.color = "#333";
		console.log("mouse IN");
	}

	function outFunction() {
		document.getElementById("test").style.color = "#f9f9f9";
		console.log("mouse OUT");
	}

	function sw(col) {

		switch (col) {

		case 0:
			if (document.getElementById('onoff-left').checked) {
				showCol(0);
			} else {
				hideCol(0);
			}
			break;

		case 1:
			if (document.getElementById('onoff-right').checked) {
				showCol(1);
			} else {
				hideCol(1);
			}
			break;

		}

	}

	function runScript(e) {
		if (e.which == 13 || e.keyCode == 13) {

			play();
			return false;
		}
	}
</script>

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


		<!-- Main component for a primary marketing message or call to action -->

		<div class="container-fluid">

			<div>
				<a href="user/get" class="btn btn-default btn-sm" role="button">utwórz nowy zestaw</a>
			</div>

			<div style="border-bottom: 1px solid #888; padding-top: 15px; font-size: 90%">
				Zestaw: ${set.setsName} <a href="user/edit/${set.id}"> (edytuj zestaw)</a>
			</div>
			<br> <br>
			<button style="display: none;" id="stopEduButton" class="btn btn-default btn-sm" onclick="stopEdu()">przerwij
				naukę</button>

			<button id="startEduButton" class="btn btn-default btn-sm" onclick="startEdu()">NAUKA</button>

		</div>
		<div class="container-tab">





			<br>

			<table class="table table-striped table-condensed" id="wordsTable">
				<thead>
					<tr>
						<th style="text-align: right;"><input type="checkbox" id="onoff-left" checked data-toggle="toggle"
							data-on="ukryj" data-off="pokaż" data-style="android" data-onstyle="info" data-size="mini" onChange='sw(0);'></th>
						<th><input type="checkbox" id="onoff-right" checked data-toggle="toggle" data-on="ukryj" data-off="pokaż"
							data-style="android" data-onstyle="info" data-size="mini" onChange='sw(1);'></th>
					</tr>
				</thead>
				<tbody id="id_of_table">


					<c:forEach items="${set.words}" var="words" varStatus="status">
						<tr>
							<td>${words.stringA}</td>
							<td>${words.stringB}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<div hidden="hidden" id="eduForm">
				<div>
					wszystkich:<b> ${fn:length(set.words)}</b> pozostało: <b id="remainedLabel"></b> <font color="red">
						<p style="text-align: right;">
							błędów: <b id="errorsLabel"> </b>
						</p>
					</font>
				</div>


				<div style="font-size: 175%; text-align: center;">


					<span id="toTranslate">${set.words[0].stringB }</span>
				</div>
				<br> <input id="translateBox" style='width: 100%' onkeypress="return runScript(event)" /> <br>
				<button id="checkButton" style="margin-top: 15px" class="btn btn-default btn-sm" onclick="play()">sprawdź</button>
				<input type="button" id="directionButton" style="margin-top: 15px" class="btn btn-default btn-sm"
					onclick="changeDirection()" value="angielskie" />

			</div>


		</div>
	</div>


	<!-- 
		<input type='button' onClick='hideCol(1);' value='Hide'> 
		<input type='button' onClick='showCol(1);'value='Show'>
		
-->


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




	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.0/js/bootstrap-toggle.min.js"></script>



	<script>
		function startEdu() {
			document.getElementById('wordsTable').style.display = 'none';
			document.getElementById('startEduButton').style.display = 'none';
			document.getElementById('stopEduButton').style.display = 'block';
			document.getElementById('eduForm').style.display = 'block';
			document.getElementById('checkButton').disabled = false;
			document.getElementById('translateBox').disabled = false;

			fill("ang");
			document.getElementById('toTranslate').innerHTML = stringsB[1];
			remained = stringsB.length - 1;
			document.getElementById('remainedLabel').innerHTML = remained;
			document.getElementById('errorsLabel').innerHTML = "0";

		}

		function stopEdu() {
			document.getElementById('wordsTable').style.display = 'block';
			document.getElementById('stopEduButton').style.display = 'none';
			document.getElementById('startEduButton').style.display = 'block';
			document.getElementById('eduForm').style.display = 'none';

		}

		function check(stringA, stringB) {
			if (stringA == stringB) {
				return true;
			} else
				return false;
		}

		function play() {
			translateBox = document.getElementById('translateBox').value
					.toLowerCase().trim();
			console.log(translateBox);
			console.log(stringsA[index]);

			if (stringsA[index] == translateBox) {
				deleteRow(index);
				newWord();

			} else {
				errors++;
				document.getElementById('errorsLabel').innerHTML = errors;

				console.log("zleeeeeeeeeeeee!");
			}
		}

		function randomIndex(quan) {
			return 1 + Math.floor(Math.random() * quan);
		}

		function deleteRow(i) {
			remained--;
			document.getElementById('remainedLabel').innerHTML = remained;
			stringsA.splice(i, 1);
			stringsB.splice(i, 1);
		}

		function newWord() {

			index = randomIndex(remained);
			document.getElementById('translateBox').value = "";

			if (remained > 0) {
				document.getElementById('toTranslate').innerHTML = stringsB[index];

				//console.log(remained);

			} else {
				document.getElementById('toTranslate').innerHTML = "koniec nauki";
				document.getElementById('checkButton').disabled = true;
				document.getElementById('translateBox').disabled = true;
			}

		}

		function changeDirection() {

			var currentDirection;
			currentDirection = document.getElementById('directionButton').value;

			switch (currentDirection) {

			case "angielskie":

				fill("pol");
				document.getElementById('directionButton').value = "polskie";
				break;

			case "polskie":
				fill("ang");
				document.getElementById('directionButton').value = "angielskie";
				break;

			}

			errors = 0;
			remained = stringsB.length - 1;
			document.getElementById('remainedLabel').innerHTML = remained;
			document.getElementById('toTranslate').innerHTML = stringsB[index];
			document.getElementById('errorsLabel').innerHTML = "0";

		}
	</script>

</body>
</html>





