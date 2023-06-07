<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %> 
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>Call it Done (Cadastro de Atividade)</title>
            <style>
                header{
                    background-color: hsl(286, 100%, 33%);
                }
                body{
                background-color: #f9f9f9;
                }
                .vertical-menu {
                width: 150x; /* Set a width if you like */
                }
            
                .vertical-menu a {
                background-color: hsl(286, 100%, 33%); /* Grey background color */
                color: white; /* Black text color */
                font-family: 'Courier New', Courier, monospace;
                font-size: medium;
                font-weight: bold;
                display: block; /* Make the links appear below each other */
                text-decoration: none; /* Remove underline from links */
                }
            
                .vertical-menu a:hover {
                background-color: hsl(286, 100%, 33%); /* Dark grey background on mouse-over */
                }
            
                .vertical-menu a.active {
                background-color: hsl(286, 100%, 33%); /* Add a green color to the "active/current" link */
                color: white;
                }
            </style>
    </head>
    <body>
        <header>
            <table>
            <tr>
            <div style="text-align:center">
            <td><img src="https://i.imgur.com/7haRea7.png" width="300" height="300"></td>
            </div>
            <td><div style="text-align:right" style="font-family:'Courier New'">
                <div class="vertical-menu">
                 <a href="mainpage"><img src='https://i.imgur.com/W4Z4QyO.png' style="width: 30px;" style="height: 10px;"/> Página Inicial</a>
            <a href="create"><img src='https://i.imgur.com/RvO8OWb.png' style="width: 30px;" style="height: 10px;"/> Criar Atividade</a>
            <a href="editactivity"><img src='https://i.imgur.com/K1FpuJf.png' style="width: 30px;" style="height: 10px;"/> Editar Atividade</a>
            <a href="deleteactivity"><img src='https://i.imgur.com/FVmXCLt.png' style="width: 30px;" style="height: 10px;"/> Excluir Atividade</a>
                  </div>
            </div>
            </td>
            </tr>
            </table>
            </header>
        <div style="text-align:center">
            <td><img src="https://i.imgur.com/b1KQ9om.png"></td>
            <br>
            </div>
      <form action="<%= request.getContextPath() %>/create" method="post">
       <table style="width: 80%" style="text-align: center;">
        <tr>
         <td>Título:</td>
         <td><input type="text" name="title" /></td>
        </tr>
        <tr>
         <td>Descrição:</td>
         <td><input type="text" name="description" /></td>
        </tr>
        <tr>
        <td>Data de Início:</td>
         <td><input type="date" id="creation_date" name="creation_date"
       value="2023-01-01"
       min="2023-01-01" max="2023-12-31"></td>
        </tr>
        <tr>
        <td>Data de Fim:</td>
         <td><input type="date" id="finished_date" name="finished_date"
       value="2023-01-01"
       min="2023-01-01" max="2023-12-31"></td>
        </tr>
       </table>
       <br>
       <input type="submit" value="Cadastrar Atividade" />
       <br>
       <br>
      </form>
    
    </body>
    </html>