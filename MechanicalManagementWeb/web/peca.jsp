<%-- 
    Document   : peca
    Created on : 15/06/2013, 17:38:58
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Peça</title>
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Cliente</legend>
                <% if (request.getParameter("codPeca") == null) {
                %>
                <form name="formCadPeca" action="CadastrarPecaServlet" method="POST">
                    <label for="descricao">Descrição</label>
                    <input type="text" name="descricao" id="descricao" value="" size="100" />
                    <br />
                    <label for="precoCompra">Preço de Compra</label>
                    <input type="text" name="precoCompra" id="precoCompra" value="" size="15" />
                    
                    <label for="precoVenda">Preço de Venda</label>
                    <input type="text" name="precoVenda" id="precoVenda" value="" size="13" />
                    <br />
                    <input type="submit" value="Gravar" name="btGravar" />
                </form>
                <% // Se for alteração 
                } else {%>
                <form name="formAltPeca" action="AlterarPecaServlet" method="POST">


                </form>
                <%}%>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
