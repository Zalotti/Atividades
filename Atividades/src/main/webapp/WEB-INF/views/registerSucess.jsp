<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
            <title>Call it Done (Erro no Cadastro)</title>
            <style>
                header{
                    background-color: hsl(286, 100%, 33%);
                }
                body{
                background-color: #f9f9f9;
                margin: 0;
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
               background-color: green;
               position: absolute;
               top: 70%;
               left: 50%;
               border: green;
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
                
                .success a{
                color: white; /* Black text color */
                font-family: 'Courier New', Courier, monospace;
                font-size: h1;
                font-weight: bold;
                display: block; /* Make the links appear below each other */
                text-decoration: none; /* Remove underline from links */
                }
                .h1{
                font-family: 'Courier New', Courier, monospace;
                }
                 .userInterface{
                position: absolute;
                right: 0;
                top: 0;
                 font-family: Courier New;
                color: white;
                }
                 .userInterface a{
                color: white; /* Black text color */
                font-family: 'Courier New', Courier, monospace;
                font-size: medium;
                font-weight: bold;
                display: block; /* Make the links appear below each other */
                text-decoration: none; /* Remove underline from links */
                }
                .collapsible {
                    background-color: hsl(286, 100%, 33%);
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: hsl(286, 100%, 33%);
}

.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
 background-color: hsl(286, 100%, 33%);
}
.exit{
background-color: hsl(286, 100%, 33%);
 color: white;
padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
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
</tr>
</table>
</header>
                </header>
                <body>
                <br>
                <div class="success">
                <div style="text-align:center" style="font-family:'Courier New'">
                <h1>
                Cadastro concluído com sucesso!
                Clique <a href="login">aqui</a> para continuar.
                 </h1>
                </div>
                </div>
                </body>
            </html>