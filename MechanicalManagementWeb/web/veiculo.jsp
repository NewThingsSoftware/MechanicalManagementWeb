<%-- 
    Document   : veiculo
    Created on : 15/06/2013, 17:38:12
    Author     : Bruno
--%>

<%@page import="classes.Cliente"%>
<%@page import="daos.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Veiculo</title>
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 60%"><legend>Veiculo</legend>
                <% if (request.getParameter("codVeiculo") == null) {
                %>
                <form name="formCadVeiculo" action="CadastrarVeiculoServlet" method="POST">

                    <label for="placa">Placa</label>
                    <input type="text" name="placa" id="placa" value="" size="40" />
                    <br />
                    <label for="marca">Marca</label>
                    <input type="text" name="marca" id="marca" value="" size="40" />

                    <label for="modelo">Modelo</label>
                    <input type="text" name="modelo" id="modelo" value="" size="40" />
                    <br />
                    
                     <label for="dono">Dono</label>
                       <select name="escolherCliente">
                    <%for (Cliente cliente : new ClienteDAO().obterTodos()) {%>
                    <option value="<%out.print(cliente.getCodCliente());%>"> <%out.print(cliente.getNome());%> 
                    </option>
                    <% }%>
                </select>
                    
                    <input type="submit" value="Gravar" name="btGravar" />

                </form>
                <% // Se for alteração 
                } else {%>
                <form name="formAltVeiculo" action="AlterarVeiculoServlet" method="POST">


                </form>
                <%}%>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
