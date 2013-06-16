<%-- 
    Document   : ordemServico
    Created on : 15/06/2013, 17:38:46
    Author     : Bruno
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordem de Serviço</title>
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
                    <textarea name="descricao" id="descricao"  maxlength="150" rows="5" cols="30">
                    </textarea>
                    <br />
                    <select name="veiculo">
                        <option value=""></option>
                    </select>
                    <select name="mecanico">
                        <option value=""></option>
                    </select>
                    <input type="submit" value="Criar OS" name="btCriarOS" />
                </form>
            </fieldset>
        </div>
        <a href="index.jsp">Pagina Inicial</a>
    </body>
</html>
