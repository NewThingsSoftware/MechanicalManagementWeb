<%-- 
    Document   : cliente
    Created on : 15/06/2013, 17:27:07
    Author     : Bruno
--%>

<%@page import="daos.ClienteDAO"%>
<%@page import="classes.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
        <script type="text/javascript" src="Script/script.js"></script>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Dados do Cliente</legend>
                <% if (request.getParameter("codCliente") == null) {
                %>
                <form name="formCadCliente" action="CadastrarClienteServlet" method="POST"
                      onsubmit="return validaForm(this)">
                    <br>
                    <label for="nome">Nome Completo:</label>
                    <input type="text" name="nome" id="nome" value="" size="60"  />
                    <br><br>
                    <label for="cpf">CPF:</label>
                    <input type="text" name="cpf" id="cpf" value="" size="20" />
                    &nbsp&nbsp
                    <label for="rg">RG:</label>
                    <input type="text" name="rg" id="rg" value="" size="20" />
                    <br><br><br>
                    <input type="submit" value="Gravar!" name="btGravar" />
                </form>
                <%} else {%>
                <form name="formAltCliente" action="AlterarClienteServlet" method="POST"
                      onsubmit="return validaForm(this)">
                    <%Cliente cliente = new ClienteDAO().obterPorCodigo(Integer.parseInt(request.getParameter("codCliente")));%>
                    <input type="hidden" name="codCliente" value="<%out.print(cliente.getCodCliente());%>" />
                    <br />
                    <label for="nomeA">Nome Completo: </label>
                    <input type="text" name="nome" id="nomeA" value="<%out.print(cliente.getNome());%>" size="60" />
                    <br /><br>
                    <label for="cpfA">CPF:</label>
                    <input type="text" name="cpf" id="cpfA" value="<%out.print(cliente.getCpf());%>" size="20" />
                    &nbsp&nbsp
                    <label for="rgA">RG:</label>
                    <input type="text" name="rg" id="rgA" value="<%out.print(cliente.getRg());%>" size="20" />
                    <br><br>
                    <input type="submit" value="Alterar" name="btAlterar" />
                </form>
                <%}%>
            </fieldset>
            <br><br>
            <fieldset style="width: 40%"><legend>Links</legend>
                <a href="index.jsp">Pagina Inicial</a>
            </fieldset>
        </div>

    </body>
</html>
