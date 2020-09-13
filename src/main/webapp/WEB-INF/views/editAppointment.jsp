<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br"></html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Agenda Compromissos</title>

<link rel="icon" href="<c:url value=" resources/iconfinder_Apple_Reminders_2697653.ico" />"/>
<script src="<c:url value=" resources/jquery/jquery.min.js" />" charset="UTF-8"></script>
<script	src="<c:url value=" https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js" />"></script>
<script src="<c:url value=" resources/js/bootstrap.min.js" />" charset="UTF-8"></script>
<link href="<c:url value=" resources/css/bootstrap.min.css" />" rel="stylesheet" id="bootstrap-css" />
<link rel="stylesheet" type="text/css" href="<c:url value=" resources/css/main.css" />" media="screen" />
<link rel="stylesheet" type="text/css"	href="<c:url value=" resources/css/calendar.css" />" media="screen" />
<script src="<c:url value=" resources/js/main.js" />" charset="UTF-8"></script>
<script src="<c:url value=" resources/js/custom.js" />" charset="UTF-8"></script>

</head>
<body>
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

	<div class="container mt-3"	style="background: rgba(255, 255, 255, 0.95); border-radius: 10px;">
		<div style="padding-top: 10px;">
			<h3>Cadastro de Compromisso</h3>
		</div>
		<form method="post" action="updateAppointment" >
			<div class="form-group">
				<div class="form-row">
					<div class="form-group col">
						<label for="name">Descrição*</label> 
						<input type="hidden" class="form-control" name="id" value="${appointment.id}">
						<input type="text" class="form-control" name="description" value="${appointment.description}">
					</div>
					<div class="form-group col-md-3">
						<label for="inputState">Contato*</label> 
						<select name="contactId" class="form-control">
							<option value="${appointment.contact.id}" >${appointment.contact.name} ${appointment.contact.surname}</option>
	 						
			 	 			<c:forEach var="contact" items="${contacts}">
			 	 				<c:if test="${contact.id != appointment.contact.id}" >
			 	 					<option value="${contact.id}" >${contact.name} ${contact.surname}</option>
			 	 				</c:if>
							</c:forEach>
		 							
						</select>
					</div>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-7">
					<label for="local">Local*</label> 
					<input type="text" class="form-control" name="local" id="local" value="${appointment.local}">
				</div>
	 			<div class="form-group col-md-3">
					<label for="date">Data*</label> 
					<input type="date" class="form-control" name="formatDate" id="date" value="${date}">
				</div>
				<div class="form-group col-md-2">
					<label for="hour">Hora*</label> 
					<input type="time" class="form-control" name="formatHour" id="hour"  value="${time}">
				</div>
			</div>
			<button type="submit" class="btn btn-dark" style="margin-bottom: 10px;">Salvar</button>
		</form>
	</div>
</body>

</html>