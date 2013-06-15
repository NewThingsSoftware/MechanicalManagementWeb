package daos;

import conecta.Conecta;
import classes.Cliente;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    private Conecta conecta;

    public ClienteDAO() {
        conecta = new Conecta();
    }
    
    public void incluirCliente(Cliente cliente)
    {
        
    }
    
    public void alterarCliente(Cliente cliente){
        
    }

    public List<Cliente> obterTodos() {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.A1_CLIENTE ORDER BY NOME";
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
                String sql = "SELECT * FROM APP.A1_CLIENTE WHERE COD_CLIENTE = " + codCliente;
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
}
