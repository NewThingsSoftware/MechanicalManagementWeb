<%-- 
    Document   : ordemServico
    Created on : 15/06/2013, 17:38:46
    Author     : Bruno
--%>

<%@page import="daos.MecanicoDAO"%>
<%@page import="classes.Mecanico"%>
<%@page import="daos.VeiculoDAO"%>
<%@page import="classes.Veiculo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordem de Serviço</title>
        <link rel="stylesheet" href="Estilo/estilo.css" type="text/css" media="screen">
    </head>
    <body>
        <div align="center">
            <fieldset style="width: 40%"><legend>Cliente</legend>
                <form name="formCadOrdemServico" action="CadastrarOrdemServicoServlet" method="POST">
                    <label for="data">Data</label>
                    <%String data = new SimpleDateFormat("dd/MM/yyyy").format(new Date(System.currentTimeMillis())).toString();%>
                    <input type="text" name="data" id="data" value="<%out.print(data);%>" size="10" readonly="readonly" />
                    <br />
                    <label for="descricao">Descrição do Problema</label>
                    <br />
                    <textarea name="descricao" id="descricao"  maxlength="150" rows="5" cols="30"></textarea>
                    <br />
                    <label for="veiculo">Veiculo (Placa)</label>
                    <select name="veiculo" id="veiculo">
                        <% int i = 0;
                            for (Veiculo veiculo : new VeiculoDAO().obterTodos()) {
                        %>
                        <option value="<%out.print(veiculo.getCodVeiculo());%>"
                                <%if (i == 0) {%>
                                selected="selected"
                                <%}%>
                                >
                            <%out.print(veiculo.getPlaca());%></option>
                            <%
                                    i++;
                                }%>
                    </select>
                    <br />
                    <label for="mecanico">Mecânico</label>
                    <select name="mecanico" id="mecanico">
                        <% i = 0;
                            for (Mecanico mecanico : new MecanicoDAO().obterTodos()) {
                        %>
                        <option value="<%out.print(mecanico.getCodMecanico());%>"
                                <%if (i == 0) {%>
                                selected="selected"
                                <%}%>
                                >
                            <%out.print(mecanico.getNome());%></option>
                            <%
                                    i++;
                                }%>
                    </select>
                    <br />
                    <input type="submit" value="Criar OS" name="btCriarOS" />
                </form>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
