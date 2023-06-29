<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <% session = request.getSession(); 
    String username = (String)session.getAttribute("username");
     if(username != null){
    	 response.sendRedirect("mainpage");
     }
       %> 
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>Call it Done (Cadastro)</title>
            <style>
                header{
                    background-color: hsl(286, 100%, 33%);
                }
                body{
                background-color: #f9f9f9;
                margin: 0;
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
                .register {
  background-color: hsl(286, 100%, 33%);
  border: 2px solid grey;
  color: white;
  padding: 7px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 12px;
  border-radius: 12px;
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
                  </div>
            </div>
            </td>
            </tr>
            </table>
            </header>
        <div style="text-align:center">
            <td><img src="https://i.imgur.com/hwA2tL6.png"></td>
            <hr>
            </div>
      <form action="<%= request.getContextPath() %>/register" method="post">
       <table style="width: 80%" style="text-align: center;">
        <tr>
         <td><strong>Nome:</strong></td>
         <td><input type="text" name="name" required/></td>
        </tr>
        <tr>
         <td><strong>Usuário:</strong></td>
         <td><input type="text" name="username" required/></td>
        </tr>
        <tr>
        <td><strong>E-mail:</strong></td>
         <td><input type="email" name="email" required/></td>
        </tr>
        <tr>
         <td><strong>Senha:</strong></td>
         <td><input type="password" name="password" required/></td>
        </tr>
        <tr>
       </table>
       <br>
       <input type="submit" value="Cadastrar" class="register"/>
       <br>
       <br>
       <a href="login">Já possui cadastro?</a>
       <br>
      </form>
    
    </body>
    </html>
    