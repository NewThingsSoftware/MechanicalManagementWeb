<%-- 
    Document   : visualizarOrdemServico
    Created on : 15/06/2013, 18:04:16
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar Ordens de Serviço</title>
    </head>
    <body>
        <div align="center">
            <center><h1>Emprestimos</h1></center>
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
        </div>
    </body>
</html>
