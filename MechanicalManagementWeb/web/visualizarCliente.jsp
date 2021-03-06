<%-- 
    Document   : visualizarCliente
    Created on : 16/06/2013, 18:03:51
    Author     : Marihelly Satnini
--%>

<%@page import="daos.ClienteDAO"%>
<%@page import="classes.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
            <center><h1>Clientes</h1></center>
            <br />
            <form name="meuForm" action="visualizarCliente.jsp" method="POST">
                <label>Nome:</label>
                <input type="text" name="filtro" id="filtro" value="" size="45"/>
                <input type="submit" value="Buscar!" name="btFiltro" />
                <br><br>
            </form>
            <%
                out.println("<table border=2px cellpadding=5px cellspacing=0>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Cliente</th>");
                out.println("<th>CPF</th>");
                out.println("<th>RG</th>");
                out.println("<th>Alterar</th>");

                out.println("<tr>");
                out.println("</thead>");
                List<Cliente> clientes = new ClienteDAO().obterTodos();
                if (request.getParameter("filtro") != null) {
                    clientes = new ClienteDAO().obterPorNome(request.getParameter("filtro"));
                }
                for (Cliente cliente : clientes) {
                    out.println("<tr onmouseover=\"this.style.background='#CDC673'\" onmouseout=\"this.style.background=''\">");
                    out.println("<td>" + cliente.getNome() + "</td>");
                    out.println("<td>" + cliente.getCpf() + "</td>");
                    out.println("<td>" + cliente.getRg() + "</td>");
                    out.println("<td><form name=\"alterar\" action=\"cliente.jsp\" method=\"POST\">");
                    out.println("<input type=\"hidden\" name=\"codCliente\" id=\"codCliente\" value=\"" + cliente.getCodCliente() + "\"/>");
                    out.println("<input type=\"submit\" value=\"Alterar\" name=\"btAlterar\" id=\"btAlterar\" />");
                    out.println("</form></td>");
                }
                out.println("</tr>");
                out.println("</table>");
            %>
             <br><br>
            <fieldset style="width: 40%"><legend>Links</legend>
                <a href="index.jsp">Pagina Inicial</a>
            </fieldset>
        </div>
    </body>
</html>
