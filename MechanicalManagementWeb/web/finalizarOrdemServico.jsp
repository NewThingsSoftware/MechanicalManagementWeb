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

                </form>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
