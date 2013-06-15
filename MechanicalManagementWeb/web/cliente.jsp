<%-- 
    Document   : cliente
    Created on : 15/06/2013, 17:27:07
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Cliente</legend>
                <% if (request.getParameter("codCliente") == null) {
                %>
                <form name="formCadCliente" action="CadastrarClienteServlet" method="POST">


                </form>
                <% // Se for alteração 
                    }%>
                <form name="formAltCliente" action="AlterarClienteServlet" method="POST">


                </form>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
