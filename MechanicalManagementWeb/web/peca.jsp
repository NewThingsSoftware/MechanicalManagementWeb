<%-- 
    Document   : peca
    Created on : 15/06/2013, 17:38:58
    Author     : Bruno
--%>

<%@page import="classes.Peca"%>
<%@page import="daos.PecaDAO"%>
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
            <fieldset style="width: 40%"><legend>Peças</legend>
                <% if (request.getParameter("codPeca") == null) {
                %>
                <form name="formCadPeca" action="CadastrarPecaServlet" method="POST"
                      onsubmit="return validaForm(this)">
                    <label for="descricao">Descrição</label>
                    <input type="text" name="descricao" id="descricao" value="" size="70" />
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
                <form name="formAltPeca" action="AlterarPecaServlet" method="POST"
                      onsubmit="return validaForm(this)">
                    <%Peca peca = new PecaDAO().obterPorCodigo(Integer.parseInt(request.getParameter("codPeca")));%>
                    <input type="hidden" name="codPeca" value="<%out.print(peca.getCodPeca());%>" />
                    <br />
                    <label for="descricaoA">Descrição da Peça</label>
                    <input type="text" name="descricao" id="descricaoA" value="<%out.print(peca.getDescricao());%>" size="70" />
                    <br />
                    <label for="precoCompraA">Preço de Compra</label>
                    <input type="text" name="precoCompra" id="precoCompraA" value="<%out.print(peca.getPrecoCompra());%>" size="15" />
                    <br />
                    <label for="precoVendaA">Preço de Venda</label>
                    <input type="text" name="precoVenda" id="precoVendaA" value="<%out.print(peca.getPrecoVenda());%>" size="15" />
                    <br />
                    <input type="submit" value="Alterar" name="btAlterar" />
                </form>
                <%}%>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
