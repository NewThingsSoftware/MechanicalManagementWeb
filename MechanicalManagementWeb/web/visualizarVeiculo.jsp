<%-- 
    Document   : visualizarVeiculo
    Created on : 15/06/2013, 18:04:35
    Author     : Bruno/Marihelly
--%>

<%@page import="classes.Cliente"%>
<%@page import="daos.ClienteDAO"%>
<%@page import="classes.Veiculo"%>
<%@page import="java.util.List"%>
<%@page import="daos.VeiculoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Veiculos</title>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
            <center><h1>Veículos</h1></center>
            <br />
            <form name="meuForm" action="visualizarVeiculo.jsp" method="POST">


                <input type="radio" name="rFiltro" value="porCliente" checked="checked" /> <label>Por Cliente</label>
                &nbsp&nbsp
                <input type="radio" name="rFiltro" value="porPlaca"/> <label>Por Placa</label>
                <br><br>
                <input type="text" name="filtro" id="filtro" value="" size="55"/>
                <input type="submit" value="Buscar!" name="btFiltro" />
                <br />
                <br><br>
            </form>
            <%
                out.println("<table border=2px cellpadding=5px cellspacing=0>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Placa</th>");
                out.println("<th>Modelo</th>");
                out.println("<th>Marca</th>");
                out.println("<th>Cliente/Dono</th>");
                out.println("<th>Alterar</th>");
                out.println("<tr>");
                out.println("</thead>");
                List<Veiculo> veiculos = new VeiculoDAO().obterTodos();
                if (request.getParameter("rFiltro") != null) {
                    if (request.getParameter("rFiltro").equals("porCliente")) {
                        veiculos = new VeiculoDAO().obterPorCliente(request.getParameter("filtro"));
                    }
                    if (request.getParameter("rFiltro").equals("porPlaca")) {
                        veiculos = new VeiculoDAO().obterPorPlaca(request.getParameter("filtro"));
                    }
                }
                for (Veiculo veiculo : veiculos) {
                    Cliente cliente = new ClienteDAO().obterPorCodigo(veiculo.getCodCliente());
                    out.println("<tr onmouseover=\"this.style.background='#CDC673'\" onmouseout=\"this.style.background=''\">");
                    out.println("<td>" + veiculo.getPlaca() + "</td>");
                    out.println("<td>" + veiculo.getModelo() + "</td>");
                    out.println("<td>" + veiculo.getMarca() + "</td>");
                    out.println("<td>" + cliente.getNome() + "</td>");
                    out.println("<td><form name=\"Alterar\" action=\"veiculo.jsp\" method=\"POST\">");
                    out.println("<input type=\"hidden\" name=\"codVeiculo\" id=\"codVeiculo\" value=\"" + veiculo.getCodVeiculo() + "\"/>");
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
