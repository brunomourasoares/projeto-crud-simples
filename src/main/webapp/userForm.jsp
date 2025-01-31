<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulário de Usuário</title>
</head>
<body>
<h1>Formulário de Usuário</h1>
<form action="user" method="post">
    <input type="hidden" name="id" value="${user.id}">
    <input type="hidden" name="action" value="${user == null ? 'insert' : 'update'}">
    <table>
        <tr>
            <td>Nome:</td>
            <td><input type="text" name="name" value="${user.name}"></td>
        </tr>
        <tr>
            <td>E-mail:</td>
            <td><input type="email" name="email" value="${user.email}"></td>
        </tr>
        <tr>
            <td>Telefone:</td>
            <td><input type="tel" name="phone" value="${user.phone}"></td>
        </tr>
        <tr>
            <td>Data de Nascimento:</td>
            <td><input type="date" name="birthDate" value="${user.birthDate}"></td>
        </tr>
        <tr>
            <td>Endereço:</td>
            <td><input type="text" name="address" value="${user.address}"></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Salvar">
            </td>
        </tr>
    </table>
</form>
<a href="user?action=list">Voltar para a Lista</a>
</body>
</html>