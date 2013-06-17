<%-- 
    Document   : index
    Created on : 02/06/2013, 17:40:32
    Author     : Bruno/Marihelly
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
        <fieldset style="width: 30%"><legend>Cadastros</legend>
            <a href="cliente.jsp">Cadastro de Clientes</a><br>
            <a href="peca.jsp">Cadastro de Peças</a> <br>
            <a href="mecanico.jsp">Cadastro de Mecanico</a><br>
            <a href="veiculo.jsp">Cadastro de Veículo</a><br>
        </fieldset>
        <br><br><br>
        <fieldset style="width: 30%"><legend>Abertura e Manutenção da Ordem de Serviço</legend>
        <a href="criaOrdemServico.jsp">Criar Ordem de Serviço</a><br>
        </fieldset>
        <br><br><br>
        <fieldset style="width: 30%"><legend>Consultas</legend>
        <a href="visualizarCliente.jsp">Visualizar Clientes</a><br>
        <a href="visualizarPeca.jsp">Visualizar Peças</a><br>
        <a href="visualizarMecanico.jsp">Visualizar Mecanicos</a><br>
        <a href="visualizarVeiculo.jsp">Visualizar Veículos</a><br>
        <a href="visualizarOrdemServico.jsp">Visualizar Ordens de Serviço</a><br>
        </fieldset>
   </div>
</body>
</html>
