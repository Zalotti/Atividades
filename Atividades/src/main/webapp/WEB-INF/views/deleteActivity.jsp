<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.util.List"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %>
    <%@ page import= "model.Users"%>
    <%@ page import= "model.Activities"%>
    <%@ page import= "dao.ActivitiesDAO"%>
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
            <title>Call it Done (Excluir Atividade)</title>
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
                th {
                  font-family: Arial;
                  font-size: 12;
               background-color: hsl(286, 100%, 33%);
               color: white;
                 }
                 tr:nth-child(even){
                 background-color: #f2f2f2
                 }
                #myInput {
                 background-image: url('https://i.imgur.com/SaHXWvj.png'); /* Add a search icon to input */
                 background-position: 10px 04px; /* Position the search icon */
                 background-repeat: no-repeat; /* Do not repeat the icon image */
                 background-color: #f2f2f2;
                 width: 30%; /* Full-width */
                 height: 10px;
                 font-size: 16px; /* Increase font-size */
                 padding: 12px 20px 12px 40px; /* Add some padding */
                 border: 1px solid black; /* Add a grey border */
                 margin-bottom: 12px; /* Add some space below the input */
                 }
                 .alert {
                 padding: 20px;
                 background-color: #f44336;
                 color: white;
                 opacity: 1;
                 transition: opacity 0.6s;
                 margin-bottom: 15px;
                 }

                 .alert.success {background-color: #04AA6D;}
                 .closebtn {
                 margin-left: 15px;
                 color: white;
                 font-weight: bold;
                 float: right;
                 font-size: 22px;
                 line-height: 20px;
                 cursor: pointer;
                 transition: 0.3s;
                 }

                 .closebtn:hover {
                  color: black;
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
<td><div style="text-align:right" style="font-family:'Courier New'">
    <div class="vertical-menu">
            <a href="mainpage"><img src='https://i.imgur.com/W4Z4QyO.png' style="width: 30px;" style="height: 10px;"/> Página Inicial</a>
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
                <img src="https://i.imgur.com/S7lhCX1.png">
                </div>
                <br>
                <hr>
                <input type="text" id="myInput" onkeyup="search()" placeholder="Pesquisar tarefa por título...">
                <div style="text-align:center" style="font-family:'Courier New'">
                <% 
                List <Activities> atividades = (List) request.getAttribute("atividades");
                %>
                <table id="allActivities" aling="center" border="1px" width="100%">
               
                <tr>
                <th>#</th>
                <th>Título</th>
                <th>Descrição</th>
                <th>Status</th>
                <th>Data de Criação</th>
                <th>Data de Conclusão</th>
                <th>Exclusão</th>
                </tr>
                
                  <%
                 for (Activities a : atividades){ 
                  %>

            <tr>
                <td><%=a.getId()%></td>
                <td><%=a.getTitle()%></td>
                <td><%=a.getDescription()%></td>
                <td><%=a.getStatus()%></td>
                <td><%=a.getCreation_date()%></td>
                <td><%=a.getFinished_date()%></td>
                <td><a id="delete" href="deleteItem.jsp?id=<%=a.getId()%>"><img src="https://i.imgur.com/7pGWOig.png" style="width: 30px;" style="height: 10px;" onclick="deleteRow(this)")></a></td>
            </tr>
            <%} %>
            </table>
                </div>
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
                
function search() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("allActivities");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
function deleteRow(r) {
	var table, tr, td;
    var title, id;
    table = document.getElementById("allActivities");
    tr = table.getElementsByTagName("tr");
    var i = r.parentNode.parentNode.rowIndex;  
	var div = document.createElement('div');
	div.innerHTML = '<span class="closebtn">&times;</span> <strong>Sucesso!</strong> A atividade foi deletada com sucesso.'  
    div.setAttribute('class', 'alert success');
    var i = r.parentNode.parentNode.rowIndex;
    document.body.appendChild(div);
    var close = document.getElementsByClassName("closebtn");
    var i;

    for (i = 0; i < close.length; i++) {
      close[i].onclick = function(){
        var div = this.parentElement;
        div.style.opacity = "0";
        setTimeout(function(){ div.style.display = "none"; }, 600);
      }
    }
}


</script>
                </body>
            </html>