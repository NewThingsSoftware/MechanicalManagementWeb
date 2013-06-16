<%-- 
    Document   : veiculo
    Created on : 15/06/2013, 17:38:12
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Veiculo</title>
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Cliente</legend>
                <% if (request.getParameter("codVeiculo") == null) {
                %>
                <form name="formCadVeiculo" action="CadastrarVeiculoServlet" method="POST">


                </form>
                <% // Se for alteração 
                    }else{%>
                <form name="formAltVeiculo" action="AlterarVeiculoServlet" method="POST">


                </form>
                <%}%>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
