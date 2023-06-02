<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.util.List"%>
    <%@ page import="javax.servlet.http.HttpSession" %> 
    <%@ page import= "model.Users"%>
    <% session = request.getSession(); %> 
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
            <title>Call it Done (Tarefa Registrada)</title>
            <style>
                header{
                    background-color: hsl(286, 100%, 33%);
                }
                body{
                background-color: #f9f9f9;
                }
                footer{
                    position: fixed;
                    left: 0;
                    bottom: 0;
                    width: 100%;
                    background-color: hsl(286, 100%, 33%);
                    color: white;
                    text-align: center;
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
            <header>
              <header>
<table>
<tr>
<div style="text-align:center">
<td><img src="logo.png" style="width: 300px;" style="height: 300px;"></td>
</div>
<td><div style="text-align:right" style="font-family:'Courier New'">
    <div class="vertical-menu">
        <a href="create">Criar Atividade</a>
      </div>
</div>
</td>
</tr>
</table>
</header>
                </header>
                <body>
                <br>
                <div style="text-align:center" style="font-family:'Courier New'">
                Tarefa de 
                <% String username = (String) session.getAttribute("username"); %>
                 registrada com sucesso!
                </div>
                </body>
            </html>