<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
</head>
<body>

<h1>Cadastro de Novo Usuário</h1>
  <form action="<%= request.getContextPath() %>/register" method="post">
   <table style="with: 80%">
    <tr>
     <td>Nome</td>
     <td><input type="text" name="name" /></td>
    </tr>
    <tr>
     <td>Usuário</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
    <td>E-mail</td>
     <td><input type="text" name="email" /></td>
    </tr>
    <tr>
     <td>Senha</td>
     <td><input type="password" name="password" /></td>
    </tr>
    <tr>
   </table>
   <input type="submit" value="Submit" />
   <a href="login">Já possui cadastro?</a>
  </form>

</body>
</html>