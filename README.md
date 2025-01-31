# Projeto Crud Simples JavaEE

Este é um projeto básico de uma aplicação web CRUD (Create, Read, Update, Delete) para gerenciamento de usuários. A aplicação permite cadastrar, listar, editar e excluir usuários armazenados em um banco de dados PostgreSQL. Ela utiliza tecnologias Java EE, como JSP e Servlets, para a interface web e conexão com o banco de dados.

## ⚙️ Funcionalidades
- **Listar Usuários:** Exibe uma lista com todos os usuários cadastrados no sistema.
- **Cadastrar Novo Usuário:** Formulário para adicionar um novo usuário.
- **Editar Usuário:** Formulário para editar as informações de um usuário existente.
- **Excluir Usuário:** Permite a exclusão de um usuário específico.

## 📋 Pré-requisitos
- Java EE 8
- JSP (JavaServer Pages)
- Servlets
- JDBC (Java Database Connectivity)
- PostgreSQL
- Apache Tomcat

## 📂 Estrutura do Projeto
```
|-- src
|   |-- main
|      |-- java
|         |-- br
|            |-- com
|               |-- crud
|                  |-- controller
|                     |-- UserServlet.java
|                  |-- dao
|                     |-- UserDAO.java
|                  |-- model
|                     |-- User.java
|      |-- webapp
|         |-- WEB-INF
|            |-- web.xml
|         |-- index.jsp
|         |-- listUsers.jsp
|         |-- userForm.jsp
|-- data
|   |-- query.sql
|-- .gitignore
|-- pom.xml
|-- README.md
```

## 🔧 Configuração do Banco de Dados
Certifique-se de configurar a conexão com o banco de dados no arquivo `UserDAO.java`:
```java
jdbcURL = "jdbc:postgresql://localhost:5432/cadastrocsv";
jdbcUsername = "root";
jdbcPassword = "Sua Senha Aqui";
```

## 🤝 Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

