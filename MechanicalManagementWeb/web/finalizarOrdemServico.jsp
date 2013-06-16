<%-- 
    Document   : finalizarOrdemServico
    Created on : 15/06/2013, 22:25:02
    Author     : Bruno
--%>

<%@page import="daos.OrdemServicoDAO"%>
<%@page import="classes.OrdemServico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Finalizar Ordem de Serviço</legend>
                <form name="formAltOrdemServico" action="AlterarOrdemServicoServlet" method="POST">
                    <%OrdemServico ordemServico = new OrdemServicoDAO().obterPorCodigo(Integer.parseInt(request.getParameter("codOrdemServico"))); %>
                    <input type="hidden" name="codOrdemServico" value="<%out.print(ordemServico.getCodOrdemServico());%>" />
                    <label for="data">Data</label>
                    <input type="text" name="data" id="data" value="<%out.print(ordemServico.getData());%>" size="10" readonly="readonly" />
                    <br />
                    <label for="descricao">Descrição do Problema</label>
                    <br />
                    <textarea name="descricao" id="descricao" rows="5" cols="30" readonly="readonly">
                        <%out.print(ordemServico.getDescricao());%>
                    </textarea>
                    <br />
                    <label for="veiculo">Veiculo (Placa)</label>
                    <input type="text" name="veiculo" id="veiculo" value="" readonly="readonly" size="8" />
                
                
                </form>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
