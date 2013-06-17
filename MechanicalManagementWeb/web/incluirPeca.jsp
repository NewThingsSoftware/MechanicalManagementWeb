<%-- 
    Document   : incluirPeca
    Created on : 16/06/2013, 16:02:30
    Author     : Bruno
--%>

<%@page import="daos.PecaDAO"%>
<%@page import="classes.Peca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Peça</title>
        <script type="text/javascript" src="Script/script.js"></script>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Incluir Peça</legend>
                <form name="formIncluirPeca" action="IncluirPecaServlet" method="POST"
                      onsubmit="return validaForm(this)">
                    <input type="hidden" name="codOrdemServico" value="<%out.print(request.getParameter("cod"));%>" />
                    <label for="peca">Peça: </label>
                    <select name="peca" id="peca">
                        <%for (Peca peca : new PecaDAO().obterTodos()) {%>
                        <option value="<%out.print(peca.getCodPeca());%>">
                            <%out.print(peca.getDescricao());%></option>
                            <%}%>
                    </select>
                    &nbsp&nbsp
                    <label for="quantidade">Quantidade: </label>
                    <input type="text" name="quantidade" id="quantidade" value="" size="6" maxlength="10" />
                    <i>(Un.)</i>
                    <br /><br />
                    <input type="submit" value="Incluir Peça a OS!" name="btIncluirPeca" />
                </form>
            </fieldset>
        </div>
    </body>
</html>
