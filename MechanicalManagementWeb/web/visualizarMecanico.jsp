<%-- 
    Document   : visualizarMecanico
    Created on : 15/06/2013, 18:04:05
    Author     : Bruno
--%>

<%@page import="java.util.List"%>
<%@page import="daos.MecanicoDAO"%>
<%@page import="classes.Mecanico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar Mecânicos</title>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
            <center><h1>Mecânicos</h1></center>
            <br /><br />
            
            <form name="meuForm" action="visualizarMecanico.jsp" method="POST">
                <label>Nome: </label>
                <input type="text" name="filtro" id="filtro" value="" size="45"/>
                <input type="submit" value="Filtrar" name="btFiltro" />
                <br />
                <br><br>
            </form>
            <%
                out.println("<table border=2px cellpadding=5px cellspacing=0>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Mecanico</th>");
                out.println("<th>CPF</th>");
                out.println("<th>RG</th>");
                out.println("<th>Alterar</th>");

                out.println("</tr>");
                out.println("</thead>");
                List<Mecanico> mecanicos = new MecanicoDAO().obterTodos();
                if (request.getParameter("filtro") != null) {
                        mecanicos = new MecanicoDAO().obterPorNome(request.getParameter("filtro"));
                }
                for (Mecanico mecanico : mecanicos) {
                    out.println("<tr onmouseover=\"this.style.background='#CDC673'\" onmouseout=\"this.style.background=''\">");
                    out.println("<td>" + mecanico.getNome() + "</td>");
                    out.println("<td>" + mecanico.getCpf() + "</td>");
                    out.println("<td>" + mecanico.getRg() + "</td>");
                    out.println("<td><form name=\"alterar\" action=\"mecanico.jsp\" method=\"POST\">");
                    out.println("<input type=\"hidden\" name=\"codMecanico\" id=\"codMecanico\" value=\"" + mecanico.getCodMecanico() + "\"/>");
                    out.println("<input type=\"submit\" value=\"Alterar\" name=\"btAlterar\" id=\"btAlterar\" />");
                    out.println("</form></td>");
                    out.println("</tr>");
                }

                out.println("</table>");
            %>
            <br><br>
            <fieldset style="width: 40%"><legend>Links</legend>
                <a href="index.jsp">Pagina Inicial</a>
            </fieldset>
        </div>

    </body>
</html>
