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
        <title>Incluir Peça</title>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Incluir Peça</legend>
                <form name="formIncluirPeca" action="IncluirPecaServlet" method="POST">
                    <input type="hidden" name="codOrdemServico" value="<%out.print(request.getParameter("cod"));%>" />
                    <label for="peca">Peça</label>
                    <select name="peca" id="peca">
                        <%for (Peca peca : new PecaDAO().obterTodos()) {%>
                        <option value="<%out.print(peca.getCodPeca());%>">
                            <%out.print(peca.getDescricao());%></option>
                            <%}%>
                    </select>
                    <br />
                    <label for="quantidade">Quantidade</label>
                    <input type="text" name="quantidade" id="quantidade" value="" size="6" />
                    <input type="submit" value="Incluir" name="btIncluirPeca" />
                </form>
            </fieldset>
        </div>
    </body>
</html>
