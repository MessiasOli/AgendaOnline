<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Agenda Online</title>
<link rel="icon" href="<c:url value=" resources/img/iconfinder_Apple_Reminders_2697653.ico" />">

<script src="<c:url value=" resources/jquery/jquery.min.js" />"
	charset="UTF-8"></script>
<script src="<c:url value=" resources/js/bootstrap.min.js" />"
	charset="UTF-8"></script>
<link href="<c:url value=" resources/css/bootstrap.min.css" />"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css"
	href="<c:url value=" resources/css/main.css" />" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<c:url value=" resources/css/calendar.css" />" media="screen" />
<script src="<c:url value=" resources/js/main.js" />" charset="UTF-8"></script>
<meta name="appointments" content="$<appontiments>">
<script src="<c:url value=" resources/js/start.js" />" charset="UTF-8"></script>
</head>

<body style="background-image: url(resources/img/natural.jpg)">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="col">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"></li>
					<a class="navbar-brand" href="main">Agenda Online</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" role="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						href="#"> <img
							src="<c:url value=" resources/img/icons8_notification_20px.png" />">
							Compromissos
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="appointment">Adicionar</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="listingAppointments">Listar</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" role="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						href="#"> <img
							src="<c:url value=" resources/img/icons8_contacts_20px_2.png" />">
							Contatos
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href=contacts >Adicionar</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href=listingContacts >Listar</a>
						</div></li>
				</ul>
			</div>
		</div>
		<div class="col-md-auto">
			<form class="form-inline" action="shearch" method="post">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Procurar" name="str" aria-label="Search">
				<button class="btn btn-outline-light" type="submit">
					<img
						src="<c:url value=" resources/img/icons8_search_20px_1.png" />">
				</button>
			</form>
		</div>
		<div class="col col-lg-2" style="padding-right: 0; padding-left: 0;">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Olá ${user.name}</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Editar</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="logout">Sair</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--/Navigation -->
	
	<div id='wrap'>
		<div id='calendar'></div>
		<div style='clear: both'></div>
	</div>
</body>

</html>