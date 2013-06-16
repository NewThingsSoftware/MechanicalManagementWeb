<%-- 
    Document   : visualizarOrdemServico
    Created on : 15/06/2013, 18:04:16
    Author     : Bruno
--%>

<%@page import="org.apache.catalina.connector.OutputBuffer"%>
<%@page import="daos.ClienteDAO"%>
<%@page import="classes.Cliente"%>
<%@page import="daos.VeiculoDAO"%>
<%@page import="classes.Veiculo"%>
<%@page import="daos.MecanicoDAO"%>
<%@page import="classes.Mecanico"%>
<%@page import="daos.OrdemServicoDAO"%>
<%@page import="classes.OrdemServico"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar Ordens de Serviço</title>
    </head>
    <body>
        <div align="center">
            <center><h1>Ordens de Serviço</h1></center>
            <br /><br />
            <form name="meuForm" action="visualizarOrdemServico.jsp" method="POST">
                <input type="text" name="filtro" id="filtro" value="" size="100"/>
                <input type="submit" value="Filtrar" name="btFiltro" />
                <br />
                <input type="radio" name="rFiltro" value="cliente" checked="checked" /> Buscar pelo nome do cliente
                <br />
                <input type="radio" name="rFiltro" value="placa"/> Buscar pela placa do veiculo
                <br />
                <input type="radio" name="rFiltro" value="mecanico"/> Buscar pelo nome do mecânico
                <br />
                <input type="radio" name="rFiltro" value="descricao"/>Buscar pela descrição do problema
                <br><br>
            </form>
            <%
                out.println("<table border=2px cellpadding=5px cellspacing=0>");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Código OS</th>");
                out.println("<th>Cliente</th>");
                out.println("<th>Placa</th>");
                out.println("<th>Mecânico</th>");
                out.println("<th>Data</th>");
                out.println("<th>Descrição</th>");
                out.println("<th>Valor</th>");
                out.println("</thead>");
                List<OrdemServico> ordemServicos = new OrdemServicoDAO().obterTodos();
                if (request.getParameter("rFiltro") != null) {
                    if (request.getParameter("rFiltro").equals("cliente")) {
                        ordemServicos = new OrdemServicoDAO().obterPorCliente(request.getParameter("filtro"));
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
                    out.println("<tr onmouseover=\"this.style.background='white'\" onmouseout=\"this.style.background=''\">");
                    out.println("<td>" + ordemServico.getCodOrdemServico() + "</td>");
                    out.println("<td>" + cliente.getNome() + "</td>");
                    out.println("<td>" + veiculo.getPlaca() + "</td>");
                    out.println("<td>" + mecanico.getNome() + "</td>");
                    out.println("<td>" + ordemServico.getData() + "</td>");
                    out.println("<td>" + ordemServico.getDescricao() + "</td>");
                    out.println("<td>" + ordemServico.getValorMaoObra() + "</td>");
                    out.println("<td><form name=\"finalizar\" action=\"finalizarOrdemServico.jsp\" method=\"POST\">");
                    out.println("<input type=\"hidden\" name=\"codOrdemServico\" id=\"codOrdemServico\" value=\"" + ordemServico.getCodOrdemServico() + "\"/>");
                    out.println("<input type=\"submit\" value=\"Finalizar\" name=\"btFinalizar\" id=\"btFinalizar\" />");
                    out.println("</form></td></tr>");
                }
            %>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
