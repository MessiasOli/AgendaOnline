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

	
	<div class="container mt-3 h-75" style="background: rgba(255, 255, 255, 0.95); border-radius: 10px;">
		<div style="padding-top: 10px;">
			<h3>Cadastro de Contatos</h3>
		</div>
		<form method=post action=registeringContact>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="name">Nome*</label> 
					<input type="text" name="name" class="form-control" id="name">
				</div>
				<div class="form-group col-md-6">
					<label for="surname">Sobrenome</label> 
					<input type="text" name="surname" class="form-control" id="surname">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="email">E-mail*</label> 
					<input type="email" name="email" class="form-control" id="email">
				</div>
				<div class="form-group col-md-6">
					<label for="phone">Telefone*</label> 
					<input type="text" name="phone" class="form-control" id="phone" placeholder="(xx) x xxxx-xxxx">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col">
					<label for="inputAddress2">Endereço</label> 
					<input type="text" class="form-control" name="address" id="inputAddress" placeholder="Avenida América, ap 108">
				</div>
				<div class="form-group col-md-2">
					<label for="number">Número</label> 
					<input type="text" name="number" class="form-control" id="number">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">Cidade</label> 
					<input type="text" name="city" class="form-control" id="inputCity">
				</div>
				<div class="form-group col-md-4">
					<label for="inputState">Estado</label> 
					<select id="inputState" name="state" class="form-control">
						<option value="">Selecione</option>
						<option value="AC">Acre</option>
						<option value="AL">Alagoas</option>
						<option value="AP">Amapá</option>
						<option value="AM">Amazonas</option>
						<option value="BA">Bahia</option>
						<option value="CE">Ceará¡</option>
						<option value="DF">Distrito Federal</option>
						<option value="ES">Espírito Santo</option>
						<option value="GO">Goias</option>
						<option value="MA">MaranhÃ£o</option>
						<option value="MT">Mato Grosso</option>
						<option value="MS">Mato Grosso do Sul</option>
						<option value="MG">Minas Gerais</option>
						<option value="PA">Pará</option>
						<option value="PB">Paraíba</option>
						<option value="PR">Paraná</option>
						<option value="PE">Pernambuco</option>
						<option value="PI">Piaí­</option>
						<option value="RJ">Rio de Janeiro</option>
						<option value="RN">Rio Grande do Norte</option>
						<option value="RS">Rio Grande do Sul</option>
						<option value="RO">Rondônia</option>
						<option value="RR">Roraima</option>
						<option value="SC">Santa Catarina</option>
						<option value="SP">São Paulo</option>
						<option value="SE">Sergipe</option>
						<option value="TO">Tocantins</option>
					</select>
				</div>
				<div class="form-group col-md-2">
					<label for="zip">Cep</label> 
					<input id="zip" type="text" name="zip" class="form-control">
				</div>
			</div>
			<div class="form-group"></div>
			<button type="submit" class="btn btn-dark">Cadastrar</button>
		</form>
	</div>


</body>

</html>