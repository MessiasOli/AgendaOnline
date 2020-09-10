<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="pt-br"></html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agenda Contatos</title>
<link rel="icon" href="../../img/iconfinder_Apple_Reminders_2697653.ico">

<script src="<c:url value=" resources/jquery/jquery.min.js" />" charset="UTF-8"></script>
<script	src="<c:url value=" https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js" />"></script>
<script src="<c:url value=" resources/js/bootstrap.min.js" />" charset="UTF-8"></script>
<link href="<c:url value=" resources/css/bootstrap.min.css" />" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="<c:url value=" resources/css/main.css" />" media="screen" />
<link rel="stylesheet" type="text/css"	href="<c:url value=" resources/css/calendar.css" />" media="screen" />
<script src="<c:url value=" resources/js/main.js" />" charset="UTF-8"></script>
<script src="<c:url value=" resources/js/custom.js" />" charset="UTF-8"></script>

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
							<a class="dropdown-item" href="contacts.html">Adicionar</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="listingContacts.html">Listar</a>
						</div></li>
				</ul>
			</div>
		</div>
		<div class="col-md-auto">
			<form class="form-inline">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Procurar" aria-label="Search">
				<button class="btn btn-outline-light" type="submit">
					<img
						src="<c:url value=" resources/img/icons8_search_20px_1.png" />">
				</button>
			</form>
		</div>
		<div class="col col-lg-1" style="padding-right: 0; padding-left: 0;">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Olá ${userName}</a>
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

	<div class="container" style="margin-top: 40px;">
		<table class="table table-sm table-dark">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Nome</th>
					<th scope="col">Telefone</th>
					<th scope="col">Endereço</th>
					<th scope="col">Cep</th>
					<th scope="col">Cidade</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="contact" items="${contacts}">
				<tr>
					<th scope="row">${contact.id}</th>
					<td>${contact.name} ${contact.surname}</td>
					<td>${contact.phone}</td>
					<td>${contact.address} , ${contact.number}</td>
					<td>${contact.zip}</td>
					<td>${contact.city}-${contact.state}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

</body>

</html>