<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <% session = request.getSession(); 
    String username = (String)session.getAttribute("username");
     if(username != null){
    	 response.sendRedirect("mainpage");
     }
       %> 
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
            <title>Call it Done (Login)</title>
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
                 .login {
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
            <body>
                <div style="text-align:center">
                <td><img src="https://i.imgur.com/4q14wcD.png"></td>
                </div>
             <form action="<%= request.getContextPath() %>/login" method="post">
                <div style="text-align:center">
                <label for="username"><strong>Usuário:</strong></label><br>
                <input type="text" name="username" id="username" required><br>
                <label for="pass"><strong>Senha:</strong></label><br>
                <input type="password" name="password" id="password" required pattern="[a-Za-Z\s]+$"><br>
                <br>
                <input type="submit" value="Login" class="login"/>
                <br>
                <br>
                <a href="register">Não possui login?</a>
    
        </div>
            </form>
            </body>
            </html>