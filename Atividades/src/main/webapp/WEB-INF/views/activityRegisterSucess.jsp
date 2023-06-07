<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.util.List"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %> 
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
               .success{
               background-color: lightgrey;
               position: absolute;
               top: 70%;
               left: 50%;
               border: 15px solid hsl(286, 100%, 33%);
               transform: translate(-50%, -50%);
               padding: 50px;
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
<td><img src="https://i.imgur.com/7haRea7.png" style="width: 300px;" style="height: 300px;"></td>
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
                </header>
                <body>
                <br>
                <div class="success">
                <div style="text-align:center" style="font-family:'Courier New'">
                <h1>
                Tarefa de 
                <strong>
                <%=session.getAttribute("username")%>
                 </strong>
                 registrada com sucesso!
                 </h1>
                </div>
                </div>
                </body>
            </html>