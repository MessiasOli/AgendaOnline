<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<script src="<c:url value=" resources/jquery/jquery.min.js" />" charset="UTF-8"></script>
<script	src="<c:url value=" https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js" />"></script>
<script src="<c:url value=" resources/js/bootstrap.min.js" />" charset="UTF-8"></script>
<link href="<c:url value=" resources/css/bootstrap.min.css" />" rel="stylesheet"
	id="bootstrap-css" charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value=" resources/css/style.css" />"
	media="screen" charset="UTF-8" />
<script src="<c:url value=" resources/js/login.js" />" charset="UTF-8"></script>

</head>
<body style="background-image: url(resources/img/natural.jpg)">

	<div class="login-reg-panel">
		<div class="login-info-box">
			<h3>Não tenho uma conta?</h3>
			<p>________________</p>
			<label id="label-register" for="log-reg-show">Login</label> <input
				type="radio" name="active-log-panel" id="log-reg-show"
				checked="checked">
		</div>

		<div class="register-info-box">
			<h3>Você ainda não é cadastrado?</h3>
			<p>________________</p>
			<label id="label-login" for="log-login-show">Registre-se</label> <input
				type="radio" name="active-log-panel" id="log-login-show">
		</div>

		<div class="white-panel">
			<div class="login-show">
				<form action=autenticar method=post>
					<h2>LOGIN</h2>
					<input type="text" name="email" placeholder="E-mail" /> 
					<input type="password" name="password" placeholder="Senha" /> 
					<input class="login" type="button" value="Entrar" /> 
					<a href="">Esqueceu a senha ?</a>
				</form>
			</div>
			<div class="register-show">
				<h2>REGISTRE-SE</h2>
				<form id="registerForm" action="register" method="post">
					<input type="text" id="name" name="name" placeholder="Nome" /> 
					<input type="text" id="phone" name="phone" placeholder="Telefone" /> 
					<input type="text" id="email" name="email" placeholder="E-mail" /> 
					<input type="password" id="password" name="password" placeholder="Senha" /> 
					<input type="password" id="confirmPassWord" name="confirmPassWord" placeholder="Confirme a senha" /> 
					<input type="button" id="saveUser" Value="Salvar" />
				</form>
			</div>
		</div>
	</div>


</body>
</html>