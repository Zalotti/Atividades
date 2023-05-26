<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <td><img src="logo.png" width="300" height="300"></td>
            </div>
            <td><div style="text-align:right" style="font-family:'Courier New'">
                <div class="vertical-menu">
                  </div>
            </div>
            </td>
            </tr>
            </table>
            </header>
        <div style="text-align:center">
            <td><img src="register.png"></td>
            </div>
      <form action="<%= request.getContextPath() %>/create" method="post">
       <table style="width: 80%" style="text-align: center;">
        <tr>
         <td>Título</td>
         <td><input type="text" name="title" /></td>
        </tr>
        <tr>
         <td>Descrição</td>
         <td><input type="text" name="description" /></td>
        </tr>
        <tr>
       </table>
       <br>
       <input type="submit" value="Cadastrar Atividade" />
       <br>
       <br>
      </form>
    
    </body>
    </html>