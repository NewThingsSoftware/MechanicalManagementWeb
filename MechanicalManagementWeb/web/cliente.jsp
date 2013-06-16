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
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 70%"><legend>Cliente</legend>
                <% if (request.getParameter("codCliente") == null) {
                %>
                <form name="formCadCliente" action="CadastrarClienteServlet" method="POST">
                    <label for="nome">Nome</label>
                    <input type="text" name="nome" id="nome" value="" size="150" />
                    <br />
                    <label for="cpf">CPF</label>
                    <input type="text" name="cpf" id="cpf" value="" size="15" />
                    <br />
                    <label for="rg">RG</label>
                    <input type="text" name="rg" id="rg" value="" size="13" />
                    <br />
                    <input type="submit" value="Gravar" name="btGravar" />
                </form>
                <% // Se for alteração 
                    }%>
                <form name="formAltCliente" action="AlterarClienteServlet" method="POST">
                    <%Cliente cliente = new ClienteDAO().obterPorCodigo(Integer.parseInt(request.getParameter("codCliente")));%>
                    <input type="hidden" name="codCliente" value="<%out.print(cliente.getCodCliente());%>150" />
                    <br />
                    <label for="nomeA">Nome</label>
                    <input type="text" name="nome" id="nomeA" value="<%out.print(cliente.getNome());%>" size="150" />
                    <br />
                    <label for="cpfA">CPF</label>
                    <input type="text" name="cpf" id="cpfA" value="<%out.print(cliente.getNome());%>" size="15" />
                    <br />
                    <label for="rgA">RG</label>
                    <input type="text" name="rg" id="rgA" value="<%out.print(cliente.getRg());%>" size="13" />
                    <br />
                    <input type="submit" value="Alterar" name="btAlterar" />

                </form>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
