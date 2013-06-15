<%-- 
    Document   : ordemServico
    Created on : 15/06/2013, 17:38:46
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordem de Serviço</title>
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Cliente</legend>
                <% if (request.getParameter("codOrdemServico") == null) {
                %>
                <form name="formCadOrdemServico" action="CadastrarOrdemServicoServlet" method="POST">


                </form>
                <% // Se for alteração 
                    }%>
                <form name="formAltOrdemServico" action="AlterarOrdemServicoServlet" method="POST">


                </form>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
