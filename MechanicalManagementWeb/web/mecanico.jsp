<%-- 
    Document   : mecanico
    Created on : 15/06/2013, 17:38:32
    Author     : Bruno
--%>

<%@page import="daos.MecanicoDAO"%>
<%@page import="classes.Mecanico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mecânico</title>
        <script type="text/javascript" src="Script/script.js"></script>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Mecanico</legend>
                <% if (request.getParameter("codMecanico") == null) {
                %>
                <form name="formCadMecanico" action="CadastrarMecanicoServlet" method="POST"
                      onsubmit="return validaForm(this)">
                    <br>
                    <label for="nome">Nome Completo: </label>
                    <input type="text" name="nome" id="nome" value="" size="60"  maxlength="150"/>
                    <br><br>
                    <label for="cpf">CPF:</label>
                    <input type="text" name="cpf" id="cpf" value="" size="15" maxlength="14" />
                    &nbsp&nbsp
                    <label for="rg">RG:</label>
                    <input type="text" name="rg" id="rg" value="" size="13" maxlength="13" />
                    <br><br>

                    <input type="submit" value="Gravar!" name="btGravar" />
                </form>
                <% 
                } else {%>
                <form name="formAltMecanico" action="AlterarMecanicoServlet" method="POST"
                      onsubmit="return validaForm(this)">
                    <%Mecanico mecanico = new MecanicoDAO().obterPorCodigo(Integer.parseInt(request.getParameter("codMecanico")));%>
                    <input type="hidden" name="codMecanico" value="<%out.print(mecanico.getCodMecanico());%>" />
                    <br />
                    <label for="nomeA">Nome Completo: </label>
                    <input type="text" name="nome" id="nomeA" value="<%out.print(mecanico.getNome());%>" size="60" maxlength="150" />
                    <br><br>
                    <label for="cpfA">CPF:</label>
                    <input type="text" name="cpf" id="cpfA" value="<%out.print(mecanico.getCpf());%>" size="15" maxlength="14" />
                    &nbsp&nbsp
                    <label for="rgA">RG:</label>
                    <input type="text" name="rg" id="rgA" value="<%out.print(mecanico.getRg());%>" size="13" maxlength="13" />
                    <br /><br />
                    <input type="submit" value="Alterar!" name="btAlterar" />
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
