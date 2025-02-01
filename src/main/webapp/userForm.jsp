<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Usuário</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<div class="tabs is-centered">
    <ul>
        <li><a class="navbar-item" href="./">Início</a></li>
        <li class="is-active"><a class="navbar-item" href="user?action=new">Cadastrar Novo Usuário</a></li>
        <li><a class="navbar-item" href="user?action=list">Listar Usuários</a></li>
    </ul>
</div>
<section class="create-user-section section is-flex is-flex-direction-column is-align-items-center is-justify-content-center">
    <div class="container">
        <h1 class="title is-4 has-text-centered mt-4">
            Criar Usuário
        </h1>
        <p class="subtitle is-6 has-text-centered mt-3 mb-5">
            Informe os dados para criação do usuário
        </p>
    </div>
    <div class="box">
        <div class="error-message">
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <p class="help is-danger mb-3"><%= error %></p>
        <% } else { %>
            <p class="help is-danger mb-3">&nbsp;</p>
        <% } %>
        </div>
		<form id="create_form" action="user" method="post">
			<input type="hidden" name="id" value="${user.id}">
			<input type="hidden" name="action" value="${user == null ? 'insert' : 'update'}">
            <div class="field">
                <div class="is-flex is-justify-content-space-between">
                    <label class="label" for="name_input">
                        Nome:
                    </label>
                    <p id="name_error" class="help is-danger">
                        &nbsp;
                    </p>
                </div>
                <div class="control has-icons-left has-icons-right">
                    <input  id="name_input"
                            class="input is-small"
                            type="text"
                            name="name_input"
                            placeholder="Digite o nome."
                            title="Digite o nome."
							value="${user.name}"
                            oninput="this.value = this.value.replace(/^[\s]+|[^a-zA-Z\sáéíóúàèìòùãõâêîôûäëïöüçÁÉÍÓÚÀÈÌÒÙÃÕÂÊÎÔÛÄËÏÖÜÇ]/g, '')"
                    >
                    <span class="icon is-small is-left">
                        <i class="fa-solid fa-signature"></i>
                    </span>
                    <span class="icon is-small is-right">
                        <i id="name_icon" class="fas fa-exclamation-triangle is-hidden"></i>
                    </span>
                </div>
            </div>
            <div class="field">
                <div class="is-flex is-justify-content-space-between">
                    <label class="label" for="email_input">
                        E-mail:
                    </label>
                    <p id="email_error" class="help is-danger">
                        &nbsp;
                    </p>
                </div>
                <div class="control has-icons-left has-icons-right">
                    <input  id="email_input"
                            class="input is-small"
                            type="text"
                            name="email_input"
                            placeholder="Digite seu e-mail."
                            title="Digite seu e-mail."
							value="${user.email}"
                            oninput="this.value = this.value.replace(/^[\s]+|[^a-zA-Z0-9\s@_.-]/g, '')"
                    >
                    <span class="icon is-small is-left">
                        <i class="fa-solid fa-at"></i>
                    </span>
                    <span class="icon is-small is-right">
                        <i id="email_icon" class="fas fa-exclamation-triangle is-hidden"></i>
                    </span>
                </div>
            </div>
            <div class="field">
                <div class="is-flex is-justify-content-space-between">
                    <label class="label" for="phone_input">
                        Telefone:
                    </label>
                    <p id="phone_error" class="help is-danger">
                        &nbsp;
                    </p>
                </div>
                <div class="control has-icons-left has-icons-right">
                    <input  id="phone_input"
                            class="input is-small"
                            type="tel"
                            name="phone_input"
                            placeholder="Digite o telefone com DDD."
                            title="Digite o telefone com DDD."
                            minlength="10"
                            maxlength="11"
							value="${user.phone}"
                            oninput="this.value = this.value.replace(/\D/g, '')"
                    >
                    <span class="icon is-small is-left">
                        <i class="fa-solid fa-phone"></i>
                    </span>
                    <span class="icon is-small is-right">
                        <i id="phone_icon" class="fas fa-exclamation-triangle is-hidden"></i>
                    </span>
                </div>
            </div>
			<div class="field">
                <div class="is-flex is-justify-content-space-between">
                    <label class="label" for="birthdate_input">
                        Data de Nascimento:
                    </label>
                    <p id="birthdate_error" class="help is-danger">
                        &nbsp;
                    </p>
                </div>
                <div class="control has-icons-left has-icons-right">
                    <input  id="birthdate_input"
                            class="input is-small"
                            type="date"
                            name="birthdate_input"
                            placeholder="Digite a data de nascimento."
                            title="Digite a data de nascimento."
							value="${user.birthDate}"
                    >
                    <span class="icon is-small is-left">
                        <i class="fa-solid fa-cake-candles"></i>
                    </span>
                    <span class="icon is-small is-right">
                        <i id="birthdate_icon" class="fas fa-exclamation-triangle is-hidden"></i>
                    </span>
                </div>
            </div>
			<div class="field">
                <div class="is-flex is-justify-content-space-between">
                    <label class="label" for="address_input">
                        Endereço:
                    </label>
                    <p id="address_error" class="help is-danger">
                        &nbsp;
                    </p>
                </div>
                <div class="control has-icons-left has-icons-right">
                    <input  id="address_input"
                            class="input is-small"
                            type="text"
                            name="address_input"
                            placeholder="Digite o endereço."
                            title="Digite o endereço."
							value="${user.address}"
                    >
                    <span class="icon is-small is-left">
                        <i class="fa-solid fa-address-book"></i>
                    </span>
                    <span class="icon is-small is-right">
                        <i id="address_icon" class="fas fa-exclamation-triangle is-hidden"></i>
                    </span>
                </div>
            </div>
			<div class="field mt-5">
                <div class="buttons is-centered">
                    <div class="control">
                        <button
								id="submit_button"
                                class="button is-small"
                                type="submit"
                        >
                            <span class="icon is-small">
                                <i class="fa-solid fa-user-plus"></i>
                            </span>
                            <span>
                                Criar Usuário
                            </span>
                        </button>
                        <button class="button is-small ml-5"
                                type="reset"
                                title="Limpar Campos"
                        >
                            <span class="icon is-small">
                                <i class="fa-solid fa-arrow-rotate-left"></i>
                            </span>
                            <span>
                                Limpar Campos
                            </span>
                        </button>
                    </div>
                </div>
            </div>
		</form>
    </div>
</section>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>