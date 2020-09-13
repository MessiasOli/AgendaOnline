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

	<div class="container" style="margin-top: 40px;">
	
		<!-- Contacts -->
		<c:if test="${contacts.size() > 0}">
			<form action="editOrDeleteContact" method="post">
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
							<th scope="row">
							<a href=editContact?id=${contact.id}><img style="cursor: pointer;" name="edit" src="<c:url value="resources/img/icons8_edit_20px.png" />"></a> 
							<a href=deleteContact?id=${contact.id}> <img style="cursor: pointer;" src="<c:url value="resources/img/icons8_trash_20px.png" />"></a>
							</th>
							<td>${contact.name} ${contact.surname}</td>
							<td>${contact.phone}</td>
							<td>${contact.address} , ${contact.number}</td>
							<td>${contact.zip}</td>
							<td>${contact.city}-${contact.state}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</form>
		</c:if>
		<!-- /Contacts -->
		
		<!-- Appointments -->
		<c:if test="${appointments.size() > 0}">
			<form action="editOrDeleteAppointment" method="post">
				<table class="table table-sm table-dark">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Descrição</th>
							<th scope="col">Local</th>
							<th scope="col">Data</th>
							<th scope="col">Contato</th>
						</tr>
					</thead>
					<c:forEach var="appointment" items="${appointments}">
						<tr>
							<th scope="row">
							<a href=editAppointment?id=${appointment.id}><img style="cursor: pointer;" name="edit" src="<c:url value="resources/img/icons8_edit_20px.png" />"></a> 
							<a href=deleteAppointment?id=${appointment.id}> <img style="cursor: pointer;" src="<c:url value="resources/img/icons8_trash_20px.png" />"></a>
							</th>
							<td>${appointment.description}</td> 
							<td>${appointment.local}</td>
							<td>${appointment.date}</td>
							<td>${appointment.contact.name} ${appointment.contact.surname}</td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</c:if>
		<!-- /Appointments -->
		
		<!-- NotFound -->
		<c:if test="${empty contacts && empty appointments}">
		<div class="p-3 mb-2 bg-white text-dark">
			<p class="text-uppercase text-center">ops não foi encontrado dados para essa pesquisa...</p>
			<p class="text-center">Sua pesquisa: ${stShearch}</p>
			<p class="text-center">Tente realizar outra pesquisa.</p>
		</div>
		</c:if>
		<!-- /NotFound -->
		
	</div>

</body>

</html>