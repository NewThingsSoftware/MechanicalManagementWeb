<%-- 
    Document   : finalizarOrdemServico
    Created on : 15/06/2013, 22:25:02
    Author     : Bruno
--%>

<%@page import="daos.PecaUsadaDAO"%>
<%@page import="classes.PecaUsada"%>
<%@page import="daos.MecanicoDAO"%>
<%@page import="daos.VeiculoDAO"%>
<%@page import="daos.OrdemServicoDAO"%>
<%@page import="classes.OrdemServico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finalizar Ordem de Serviço</title>
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Finalizar Ordem de Serviço</legend>
                <form name="formAltOrdemServico" action="AlterarOrdemServicoServlet" method="POST">
                    <%OrdemServico ordemServico = new OrdemServicoDAO().obterPorCodigo(Integer.parseInt(request.getParameter("codOrdemServico")));%>
                    <input type="hidden" name="codOrdemServico" value="<%out.print(ordemServico.getCodOrdemServico());%>" />
                    <label for="data">Data</label>
                    <input type="text" name="data" id="data" value="<%out.print(ordemServico.getData());%>" size="10" readonly="readonly" />
                    <br />
                    <label for="descricao">Descrição do Problema</label>
                    <br />
                    <textarea name="descricao" id="descricao" rows="5" cols="30" readonly="readonly"><%out.print(ordemServico.getDescricao());%></textarea>
                    <br />
                    <label for="veiculo">Veiculo (Placa)</label>
                    <input type="text" name="veiculo" id="veiculo" value="<%out.print(new VeiculoDAO().obterPorCodigo(ordemServico.getCodVeiculo()).getPlaca());%>" readonly="readonly" size="8" />
                    <br />
                    <label for="mecanico">Mecânico</label>
                    <input type="text" name="mecanico" id="mecanico" value="<%out.print(new MecanicoDAO().obterPorCodigo(ordemServico.getCodMecanico()).getNome());%>" readonly="readonly" size="8" />
                    <br />
                    <label for="valorServico">Valor do Serviço</label>
                    <input type="text" name="valorServico" id="valorServico" value="" size="10" />
                    <br />
                    <%
                        out.println("<table border=2px cellpadding=5px cellspacing=0>");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th>Peça</th>");
                        out.println("<th>Quantidade</th>");
                        out.println("<th>Valor Unitário</th>");
                        out.println("<th>Valor Total</th>");
                        out.println("<tr>");
                        out.println("</thead>");
                        //for(PecaUsada pecaUsada: new PecaUsadaDAO()){
                            
                       // }
                        out.println("</table>");

                    %>
                    <br />
                    <input type="button" value="Incluir Peca" name="btIncluirPeca" onclick="incluirPeca.jsp"/>
                    <br />
                    <label for="valor">Valor Total</label>
                    <input type="text" name="valor" id="valor" value="" size="10" readonly="readonly" />
                </form>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
