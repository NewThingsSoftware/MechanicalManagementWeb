<%-- 
    Document   : visualizarPeca
    Created on : 15/06/2013, 18:04:24
    Author     : Bruno
--%>

<%@page import="daos.PecaDAO"%>
<%@page import="classes.Peca"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Peças</title>
    </head>
    <body>
        <div align="center">
            <center><h1>Peças</h1></center>
            <br /><br />
            <form name="meuForm" action="visualizarPeca.jsp" method="POST">
                <input type="text" name="filtro" id="filtro" value="" size="100"/>
                <input type="submit" value="Filtrar" name="btFiltro" />
                <br />
                <input type="radio" name="rFiltro" value="porDescricao" checked="checked" /> Por Descricao

                <br><br>
            </form>
            <%
                out.println("<table border=2px cellpadding=5px cellspacing=0>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Descrição</th>");
                out.println("<th>Preço de Compra</th>");
                out.println("<th>Preço de Venda</th>");
                out.println("<th></th>");

                out.println("<tr>");
                out.println("</thead>");
                List<Peca> pecas = new PecaDAO().obterTodos();
                if (request.getParameter("rFiltro") != null) {
                    if (request.getParameter("rFiltro").equals("porDescricao")) {
                        pecas = new PecaDAO().obterPorNome(request.getParameter("filtro"));
                    }
                }
                for (Peca peca : pecas) {
                    out.println("<tr onmouseover=\"this.style.background='pink'\" onmouseout=\"this.style.background=''\">");
                    out.println("<td>" + peca.getDescricao() + "</td>");
                    out.println("<td>" + peca.getPrecoCompra() + "</td>");
                    out.println("<td>" + peca.getPrecoVenda() + "</td>");
                    out.println("<td><form name=\"alterar\" action=\"peca.jsp\" method=\"POST\">");
                    out.println("<input type=\"text\" name=\"codPeca\" id=\"codPeca\" value=\"" + peca.getCodPeca()+ "\"/>");
                    out.println("<input type=\"submit\" value=\"Alterar\" name=\"btAlterar\" id=\"btAlterar\" />");
                    out.println("</form></td>");
                }
                out.println("</tr>");
                out.println("</table>");
            %>
        </div>



    </body>
</html>
