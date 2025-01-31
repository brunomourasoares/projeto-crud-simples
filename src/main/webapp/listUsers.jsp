<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuários</title>
</head>
<body>
<h1>Lista de Usuários</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>E-mail</th>
        <th>Telefone</th>
        <th>Data de Nascimento</th>
        <th>Endereço</th>
        <th>Ações</th>
    </tr>
    <c:forEach var="user" items="${listUser}">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.phone}</td>
            <td>${user.birthDate}</td>
            <td>${user.address}</td>
            <td>
                <a href="user?action=edit&id=${user.id}">Editar</a>
                <a href="user?action=delete&id=${user.id}" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="index.jsp">Voltar ao Início</a>
</body>
</html>