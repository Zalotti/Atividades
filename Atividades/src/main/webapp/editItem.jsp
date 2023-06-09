 <%@ page import= "dao.ActivitiesDAO"%>
 <jsp:useBean id="activity" class="model.Activities"></jsp:useBean>
 <jsp:setProperty property="*" name="activity"/>
 <%@ page import="jakarta.servlet.http.HttpSession" %> 
     <%@ page import= "java.util.List"%>
      <%@ page import= "model.Activities"%>
    <%@ page import= "model.Users"%>
    <% session = request.getSession(); 
    String username = (String)session.getAttribute("username");
     if(username == null){
    	 response.sendRedirect("login");
     }
       %> 
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
            <title>Call it Done (Editar Tarefa)</title>
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
.edit {
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
              <header>
<table>
<tr>
<div style="text-align:center">
<td><img src="https://i.imgur.com/7haRea7.png" style="width: 300px;" style="height: 300px;"></td>
</div>
<td><div style="text-align:right" style="font-family:'Courier New'">
    <div class="vertical-menu">
        <a href="mainpage"><img src='https://i.imgur.com/W4Z4QyO.png' style="width: 30px;" style="height: 10px;"/> P�gina Inicial</a>
        <a href="create"><img src='https://i.imgur.com/RvO8OWb.png' style="width: 30px;" style="height: 10px;"/> Criar Atividade</a>
        <a href="editactivity"><img src='https://i.imgur.com/K1FpuJf.png' style="width: 30px;" style="height: 10px;"/> Editar Atividade</a>
        <a href="deleteactivity"><img src='https://i.imgur.com/FVmXCLt.png' style="width: 30px;" style="height: 10px;"/> Excluir Atividade</a>
      </div>
</div>
</td>
<div class = "userInterface">
  <button type="button" class="collapsible"><img src="https://i.imgur.com/8ayPVTa.png" style="width: 30px;" style="height: 10px;"> <%=session.getAttribute("username")%> </button>  
 <div class="content"><a href="logout.jsp"><img src="https://i.imgur.com/wn0HLy4.png" style="width: 15px;" style="height: 5px;"> Sair</a></div>   
  </div>
</tr>
</table>
</header>
                </header>
                <body>
                <div style="text-align:center">
                <img src="https://i.imgur.com/s8enifz.png">
                </div>
                <hr>
                <br>
                   <form action="<%= request.getContextPath() %>/edit" method="post">
       <table style="width: 80%" style="text-align: center;">
        <%
        List <Activities> atividades = ActivitiesDAO.pegarAtividade(activity);
        session.setAttribute("itemId", String.valueOf(activity.getId()));
        %>
        <%
                 for (Activities a : atividades){ 
         %>
        <tr>
         <td><strong>T�tulo:</strong></td>
         <td><input type="text" name="title"  value="<%=a.getTitle()%>" required/></td>
        </tr>
        <tr>
         <td><strong>Descri��o:</strong></td>
         <td><input type="text" name="description" value="<%=a.getDescription()%>" required/></td>
        </tr>
         <tr>
         <td><strong>Status:</strong></td>
         <td><input type="text" name="status" value="<%=a.getStatus()%>" required/></td>
        </tr>
        <tr>
        <td><strong>Data de In�cio:</strong></td>
         <td><input type="date" id="creation_date" name="creation_date"
       value="<%=a.getCreation_date()%>"
       min="2023-01-01" max="2023-12-31"></td>
        </tr>
        <tr>
        <td><strong>Data de Fim:</strong></td>
         <td><input type="date" id="finished_date" name="finished_date"
       value="<%=a.getFinished_date()%>"
       min="2023-01-01" max="2023-12-31"></td>
        </tr>
         <%} %>
       </table>
       <br>
       <input type="submit" value="Editar Atividade" class="edit"/>
       <br>
       <br>
      </form> 
                </body>
                 <script>
    var coll = document.getElementsByClassName("collapsible");
    var i;

    for (i = 0; i < coll.length; i++) {
      coll[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var content = this.nextElementSibling;
        if (content.style.display === "block") {
          content.style.display = "none";
        } else {
          content.style.display = "block";
        }
      });
    }
    </script>
            </html>
