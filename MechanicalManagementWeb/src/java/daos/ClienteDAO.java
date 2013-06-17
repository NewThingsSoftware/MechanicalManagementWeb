package daos;

import classes.Cliente;
import conecta.Conecta;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    private Conecta conecta;

    public ClienteDAO() {
        conecta = new Conecta();
    }

    public void incluirCliente(Cliente cliente) throws SQLException {
        if ("sucesso".equals(conecta.getMsg())) {
            if ("sucesso".equals(conecta.getMsg())) {
                String sql = "INSERT INTO APP.CLIENTES (NOME, CPF, RG)"
                        + " VALUES ('" + cliente.getNome() + "','" + cliente.getCpf()
                        + "', '" + cliente.getRg() + "' )";
                conecta.getStm().execute(sql);
            } else {
                System.out.println("erro:" + conecta.getMsg());
            }
        }
    }

    public void alterarCliente(Cliente cliente) throws SQLException {
        if ("sucesso".equals(conecta.getMsg())) {
            String sql = "UPDATE APP.CLIENTES SET NOME = '" + cliente.getNome() + "', "
                    + " CPF = '" + cliente.getCpf() + "', RG = '" + cliente.getRg()
                    + "' WHERE COD_CLIENTE = " + cliente.getCodCliente();

            conecta.getStm().execute(sql);
        } else {
            System.out.println("erro:" + conecta.getMsg());
        }
    }

    public List<Cliente> obterTodos() {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.CLIENTES ORDER BY NOME";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                List<Cliente> clientes = new ArrayList<Cliente>();
                while (rs.next()) {
                    clientes.add(new Cliente(rs.getInt("COD_CLIENTE"),
                            rs.getString("NOME"),
                            rs.getString("CPF"),
                            rs.getString("RG")));
                }
                return clientes;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }

    public Cliente obterPorCodigo(int codCliente) {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.CLIENTES WHERE COD_CLIENTE = " + codCliente;
                ResultSet rs = conecta.getStm().executeQuery(sql);
                rs.next();
                Cliente cliente = new Cliente(rs.getInt("COD_CLIENTE"),
                        rs.getString("NOME"),
                        rs.getString("CPF"),
                        rs.getString("RG"));
                return cliente;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }

    public List<Cliente> obterPorNome(String nome) {
        if (nome.equals("")) {
            return obterTodos();
        }
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.CLIENTES WHERE UPPER(NOME) LIKE '%" + nome.toUpperCase() + "%' ORDER BY NOME";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                System.out.println(sql);
                List<Cliente> clientes = new ArrayList<Cliente>();
                while (rs.next()) {
                    clientes.add(new Cliente(
                            rs.getInt("COD_CLIENTE"),
                            rs.getString("NOME"),
                            rs.getString("CPF"),
                            rs.getString("RG")));
                }
                return clientes;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }
}
