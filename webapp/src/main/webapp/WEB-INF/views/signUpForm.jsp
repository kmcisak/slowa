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


</head>

<body>


	<div class="container">
		<div id="box_signup" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Rejestracja</div>
					<div style="float: right; font-size: 120%; position: relative; top: -20px">
						<a href="home"><i class="glyphicon glyphicon-remove"></i></a>
					</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- show any messages that come back with authentication -->
					<div id="div_alert" style="display: none"></div>

					<form:form class="form-horizontal" commandName="userForm" action="signup" method="POST">
						<form:errors path="*" cssClass="errorblock" element="div" />

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<form:input type="text" class="form-control" value="" placeholder="nazwa użytkownika" path="login" />
						</div>


						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
							<form:input type="text" class="form-control" value="" placeholder="email" path="email" />
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							<form:input type="password" class="form-control" placeholder="hasło" path="password" />
						</div>

						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							<form:input type="password" class="form-control" placeholder="potwierdzenie hasła" path="passwordConf" />
						</div>


						<div style="margin-top: 10px" class="form-group">
							<div class="col-sm-12 controls">
								<button id="btn_login" type="submit" class="btn btn-success btn-lg btn-block">Zarejestruj</button>
							</div>
						</div>


						<div class="form-group">
							<div class="col-md-12 control">
								<div style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
									Masz już konto? <a href="login"> Zaloguj się </a>
								</div>
							</div>
						</div>
					</form:form>

				</div>

			</div>

		</div>

	</div>



	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>
</html>

