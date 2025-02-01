<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuários</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<div class="tabs is-centered">
    <ul>
        <li><a class="navbar-item" href="./">Início</a></li>
        <li><a class="navbar-item" href="user?action=new">Cadastrar Novo Usuário</a></li>
        <li class="is-active"><a class="navbar-item" href="user?action=list">Listar Usuários</a></li>
    </ul>
</div>
<section class="create-user-section section is-flex is-flex-direction-column is-align-items-center is-justify-content-center">
    <div class="container">
        <h1 class="title is-4 has-text-centered mt-4">
            Lista de Usuários
        </h1>
        <p class="subtitle is-6 has-text-centered mt-3 mb-5">
            Você pode editar ou excluir os usuários cadastrados.
        </p>
    </div>
    <div class="table-container">
        <table class="table is-striped is-bordered is-hoverable is-fullwidth">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Telefone</th>
                    <th>Data de Nascimento</th>
                    <th>Endereço</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${listUser}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td>${user.birthDate}</td>
                        <td>${user.address}</td>
                        <td>
                            <a class="button" href="user?action=edit&id=${user.id}">Editar</a>
                            <a class="button is-danger" href="user?action=delete&id=${user.id}" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</section>
</body>
</html>