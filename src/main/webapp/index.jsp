<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Início</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
</head>
<body>
    <div class="tabs is-centered">
        <ul>
            <li class="is-active"><a>Início</a></li>
            <li><a class="navbar-item" href="user?action=new">Cadastrar Novo Usuário</a></li>
            <li><a class="navbar-item" href="user?action=list">Listar Usuários</a></li>
        </ul>
    </div>
    <section class="create-user-section section is-flex is-flex-direction-column is-align-items-center is-justify-content-center">
        <div class="container">
            <h1 class="title is-4 has-text-centered mt-4">
                Bem-vindo ao Gerenciamento de Usuários
            </h1>
            <p class="subtitle is-6 has-text-centered mt-3 mb-5">
                Escolha uma das opções no menu acima.
            </p>
        </div>
    </section>
</body>
</html>