<%-- 
    Document   : visualizarVeiculo
    Created on : 15/06/2013, 18:04:35
    Author     : Bruno
--%>

<%@page import="classes.Veiculo"%>
<%@page import="java.util.List"%>
<%@page import="daos.VeiculoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
      <div align="center">
            <center><h1>Veículos</h1></center>
            <br /><br />
            <form name="meuForm" action="visualizarVeiculo.jsp" method="POST">
                <input type="text" name="filtro" id="filtro" value="" size="100"/>
                <input type="submit" value="Filtrar" name="btFiltro" />
                <br />
                <input type="radio" name="rFiltro" value="porCliente" checked="checked" /> Por Cliente
                <br />
                <input type="radio" name="rFiltro" value="porMarca"/> Por Marca
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
                        veiculos = new VeiculoDAO().ob(request.getParameter("filtro"));
                    }
                    if (request.getParameter("rFiltro").equals("placa")) {
                        ordemServicos = new OrdemServicoDAO().obterPorPlaca(request.getParameter("filtro"));
                    }
                    if (request.getParameter("rFiltro").equals("mecanico")) {
                        ordemServicos = new OrdemServicoDAO().obterPorMecanico(request.getParameter("filtro"));
                    }
                    if (request.getParameter("rFiltro").equals("descricao")) {
                        ordemServicos = new OrdemServicoDAO().obterPorDescricao(request.getParameter("filtro"));
                    }
                }
                for (OrdemServico ordemServico : ordemServicos) {
                    Mecanico mecanico = new MecanicoDAO().obterPorCodigo(ordemServico.getCodMecanico());
                    Veiculo veiculo = new VeiculoDAO().obterPorCodigo(ordemServico.getCodVeiculo());
                    Cliente cliente = new ClienteDAO().obterPorCodigo(veiculo.getCodCliente());
                    out.println("<tr onmouseover=\"this.style.background='green'\" onmouseout=\"this.style.background=''\">");
                    out.println("<td>" + ordemServico.getCodOrdemServico() + "</td>");
                    out.println("<td>" + cliente.getNome() + "</td>");
                    out.println("<td>" + veiculo.getPlaca() + "</td>");
                    out.println("<td>" + mecanico.getNome() + "</td>");
                    out.println("<td>" + ordemServico.getData() + "</td>");
                    out.println("<td>" + ordemServico.getDescricao() + "</td>");
                    out.println("<td>" + (new PecaUsadaDAO().totalPagar(ordemServico.getCodOrdemServico())+ordemServico.getValorMaoObra()) + "</td>");
                    if (ordemServico.getValorMaoObra() <= 0) {
                        out.println("<td><form name=\"finalizar\" action=\"finalizarOrdemServico.jsp\" method=\"POST\">");
                        out.println("<input type=\"hidden\" name=\"codOrdemServico\" id=\"codOrdemServico\" value=\"" + ordemServico.getCodOrdemServico() + "\"/>");
                        out.println("<input type=\"submit\" value=\"Finalizar\" name=\"btFinalizar\" id=\"btFinalizar\" />");
                        out.println("</form></td>");
                    } else {
                        out.print("<td>Finalizada</td>");
                    }
                    out.println("</tr>");
                }
                out.println("</table>");
            %>
        </div>
        
        
    </body>
</html>
