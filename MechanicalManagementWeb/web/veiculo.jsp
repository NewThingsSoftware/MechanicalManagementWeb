<%-- 
    Document   : veiculo
    Created on : 16/06/2013, 17:38:12
    Author     : Marihelly Santini
--%>

<%@page import="classes.Veiculo"%>
<%@page import="daos.VeiculoDAO"%>
<%@page import="classes.Cliente"%>
<%@page import="daos.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Veiculo</title>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 60%"><legend>Veiculo</legend>
                <% if (request.getParameter("codVeiculo") == null) {
                %>
                <form name="formCadVeiculo" action="CadastrarVeiculoServlet" method="POST"
                      onsubmit="return validaForm(this)">
                    <br>
                    <label for="escolherCliente">Dono</label>
                    <select name="escolherCliente" id="escolherCliente">
                        <%for (Cliente cliente : new ClienteDAO().obterTodos()) {%>
                        <option value="<%out.print(cliente.getCodCliente());%>"> <%out.print(cliente.getNome());%> 
                        </option>
                        <% }%>
                    </select>
                    &nbsp&nbsp
                    <label for="placa">Placa: </label>
                    <input type="text" name="placa" id="placa" value="" size="10" maxlength="8"/>
                    <br><br>
                    <label for="marca">Marca</label>
                    <input type="text" name="marca" id="marca" value="" size="20" maxlength="150" />
                    &nbsp&nbsp
                    <label for="modelo">Modelo</label>
                    <input type="text" name="modelo" id="modelo" value="" size="20" maxlength="150" />
                    <br />
                    <br>
                    <input type="submit" value="Gravar" name="btGravar" />

                </form>
                <% 
                } else {%>
                <form name="formAltVeiculo" action="AlterarVeiculoServlet" method="POST"
                      onsubmit="return validaForm(this)">

                    <%Veiculo veiculo = new VeiculoDAO().obterPorCodigo(Integer.parseInt(request.getParameter("codVeiculo")));%>
                    <input type="hidden" name="codVeiculo" value="<%out.print(veiculo.getCodVeiculo());%>" />
                    <br />

                    <label for="placaA">Placa</label>
                    <input type="text" name="placa" id="placaA" value="<%out.print(veiculo.getPlaca());%>" size="10" maxlength="8" />
                    <br />
                    <label for="marcaA">Marca</label>
                    <input type="text" name="marca" id="marcaA" value="<%out.print(veiculo.getMarca());%>" size="20" maxlength="150" />

                    <label for="modelo">Modelo</label>
                    <input type="text" name="modelo" id="modeloA" value="<% out.print(veiculo.getModelo());%>" size="20" maxlength="150" />
                    <br />

                    <label for="escolherCliente">Dono/Cliente</label>
                    <select name="escolherCliente" id="escolherCliente">
                        <%for (Cliente cliente : new ClienteDAO().obterTodos()) {%>
                        <option value="<%out.print(cliente.getCodCliente());%>" 
                                <% if (cliente.getCodCliente() == veiculo.getCodCliente()) {
                                %>selected="selected"
                                <%}%>
                                >
                            <%out.print(cliente.getNome());%></option>
                            <% }%>
                    </select>

                    <input type="submit" value="Alterar!" name="btAlterar" />

                </form>
                <%}%>
            </fieldset>
            <fieldset style="width: 40%"><legend>Links</legend>
                <a href="index.jsp">Pagina Inicial</a>
            </fieldset>
        </div>
    </body>
</html>
