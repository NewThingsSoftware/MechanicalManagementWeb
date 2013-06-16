package daos;

import conecta.Conecta;

public class PecaDAO {
    
    private Conecta conecta;

    public PecaDAO() {
        conecta = new Conecta();
    }

    public void incluirPeca(Peca cliente) {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                if ("sucesso".equals(conecta.getMsg())) {
                    String sql = "INSERT INTO APP.CLIENTES (NOME, CPF, RG)"
                            + " VALUES ('" + cliente.getNome() + "','" + cliente.getCpf()
                            + "', '" + cliente.getRg() + "' )";
                    conecta.getStm().execute(sql);
                } else {
                    System.out.println("erro:" + conecta.getMsg());
                }
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
    }

    public void alterarCliente(Cliente cliente) {
        try {
            if ("sucesso".equals(conecta.getMsg())) {
                String sql = "UPDATE APP.CLIENTES SET NOME = '" + cliente.getNome() + "', "
                        + " CPF = '" + cliente.getCpf() + "', RG = '" + cliente.getRg()
                        + "' WHERE COD_CLIENTE = " + cliente.getCodCliente();
                conecta.getStm().execute(sql);
            } else {
                System.out.println("erro:" + conecta.getMsg());
            }
        } catch (SQLException sql) {
            System.out.println(sql);
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
    
}
