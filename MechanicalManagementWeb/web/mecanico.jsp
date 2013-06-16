<%-- 
    Document   : mecanico
    Created on : 15/06/2013, 17:38:32
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mecânico</title>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 50%"><legend>Mecanico</legend>
                <% if (request.getParameter("codMecanico") == null) {
                %>
                <form name="formCadMecanico" action="CadastrarMecanicoServlet" method="POST">

                    <label for="nome">Nome</label>
                    <input type="text" name="nome" id="nome" value="" size="80" />
                    <br />
                    <label for="cpf">CPF</label>
                    <input type="text" name="cpf" id="cpf" value="" size="15" />
                 
                    <label for="rg">RG</label>
                    <input type="text" name="rg" id="rg" value="" size="13" />
                    <br />

                    <input type="submit" value="Gravar" name="btGravar" />


                </form>
                <% // Se for alteração 
                } else {%>
                <form name="formAltMecanico" action="AlterarMecanicoServlet" method="POST">


                </form>
                <%}%>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
