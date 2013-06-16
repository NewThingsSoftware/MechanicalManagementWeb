package daos;

import classes.OrdemServico;
import conecta.Conecta;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrdemServicoDAO {

    private Conecta conecta;

    public OrdemServicoDAO() {
        conecta = new Conecta();
    }

    public void incluirOrdemServico(OrdemServico ordemServico) {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                if ("sucesso".equals(conecta.getMsg())) {
                    String sql = "INSERT INTO APP.ORDEM_SERVICO (DATA, DESCRICAO, COD_VEICULO_FK, COD_MECANICO_FK)"
                            + " VALUES ('" + ordemServico.getData() + "','" + ordemServico.getDescricao()
                            + "', " + ordemServico.getCodVeiculo() + " , " + ordemServico.getCodMecanico() + " )";
                    conecta.getStm().execute(sql);
                } else {
                    System.out.println("erro:" + conecta.getMsg());
                }
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
    }

    public void alterarOrdemServico(OrdemServico ordemServico) {
        try {
            if ("sucesso".equals(conecta.getMsg())) {
                String sql = "UPDATE APP.ORDEM_SERVICO SET DATA = '" + ordemServico.getData() + "', "
                        + " DESCRICAO = '" + ordemServico.getDescricao() + "', VALOR_MAO_OBRA = " + ordemServico.getValorMaoObra()
                        + " , COD_VEICULO_FK = " + ordemServico.getCodVeiculo() + " , COD_MECANICO_FK = " + ordemServico.getCodMecanico()
                        + " WHERE COD_ORDEM_SERVICO = " + ordemServico.getCodOrdemServico();
                conecta.getStm().execute(sql);
            } else {
                System.out.println("erro:" + conecta.getMsg());
            }
        } catch (SQLException sql) {
            System.out.println(sql);
        }
    }

    public List<OrdemServico> obterTodos() {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.ORDEM_SERVICO";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                List<OrdemServico> ordemServicos = new ArrayList<OrdemServico>();
                while (rs.next()) {
                    ordemServicos.add(new OrdemServico(
                            rs.getInt("COD_ORDEM_SERVICO"),
                            rs.getDate("DATA"),
                            rs.getString("DESCRICAO"),
                            rs.getDouble("VALOR_MAO_OBRA"),
                            rs.getInt("COD_VEICULO_FK"),
                            rs.getInt("COD_MECANICO_FK")));
                }
                return ordemServicos;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }

    public OrdemServico obterPorCodigo(int codOrdemServico) {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.ORDEM_SERVICO WHERE COD_ORDEM_SERVICO = " + codOrdemServico;
                ResultSet rs = conecta.getStm().executeQuery(sql);
                rs.next();
                OrdemServico ordemServico = new OrdemServico(
                        rs.getInt("COD_ORDEM_SERVICO"),
                        rs.getDate("DATA"),
                        rs.getString("DESCRICAO"),
                        rs.getDouble("VALOR_MAO_OBRA"),
                        rs.getInt("COD_VEICULO_FK"),
                        rs.getInt("COD_MECANICO_FK"));
                return ordemServico;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }

    public List<OrdemServico> obterPorCliente(String nome) {
        if (nome.equals("")) {
            return obterTodos();
        }
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.ORDEM_SERVICO OS, APP.MECANICO M, APP.CLIENTES C, APP.VEICULO V"
                        + " WHERE OS.COD_VEICULO_FK = V.COD_VEICULO AND "
                        + " V.COD_CLIENTE_FK = C.COD_CLIENTE AND "
                        + " OS.COD_MECANICO_FK = M.COD_MECANICO AND "
                        + " UPPER(C.NOME) LIKE '%" + nome.toUpperCase() + "%'";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                System.out.println(sql);
                List<OrdemServico> ordemServicos = new ArrayList<OrdemServico>();
                while (rs.next()) {
                    ordemServicos.add(new OrdemServico(
                            rs.getInt("COD_ORDEM_SERVICO"),
                            rs.getDate("DATA"),
                            rs.getString("DESCRICAO"),
                            rs.getDouble("VALOR_MAO_OBRA"),
                            rs.getInt("COD_VEICULO_FK"),
                            rs.getInt("COD_MECANICO_FK")));
                }
                return ordemServicos;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }

    public List<OrdemServico> obterPorPlaca(String placa) {
        if (placa.equals("")) {
            return obterTodos();
        }
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.ORDEM_SERVICO OS, APP.MECANICO M, APP.CLIENTES C, APP.VEICULO V"
                        + " WHERE OS.COD_VEICULO_FK = V.COD_VEICULO AND "
                        + " V.COD_CLIENTE_FK = C.COD_CLIENTE AND "
                        + " OS.COD_MECANICO_FK = M.COD_MECANICO AND "
                        + " UPPER(V.PLACA) LIKE '%" + placa.toUpperCase() + "%'";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                System.out.println(sql);
                List<OrdemServico> ordemServicos = new ArrayList<OrdemServico>();
                while (rs.next()) {
                    ordemServicos.add(new OrdemServico(
                            rs.getInt("COD_ORDEM_SERVICO"),
                            rs.getDate("DATA"),
                            rs.getString("DESCRICAO"),
                            rs.getDouble("VALOR_MAO_OBRA"),
                            rs.getInt("COD_VEICULO_FK"),
                            rs.getInt("COD_MECANICO_FK")));
                }
                return ordemServicos;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }

    public List<OrdemServico> obterPorMecanico(String mecanico) {
        if (mecanico.equals("")) {
            return obterTodos();
        }
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.ORDEM_SERVICO OS, APP.MECANICO M, APP.CLIENTES C, APP.VEICULO V"
                        + " WHERE OS.COD_VEICULO_FK = V.COD_VEICULO AND "
                        + " V.COD_CLIENTE_FK = C.COD_CLIENTE AND "
                        + " OS.COD_MECANICO_FK = M.COD_MECANICO AND "
                        + " UPPER(M.NOME) LIKE '%" + mecanico.toUpperCase() + "%'";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                System.out.println(sql);
                List<OrdemServico> ordemServicos = new ArrayList<OrdemServico>();
                while (rs.next()) {
                    ordemServicos.add(new OrdemServico(
                            rs.getInt("COD_ORDEM_SERVICO"),
                            rs.getDate("DATA"),
                            rs.getString("DESCRICAO"),
                            rs.getDouble("VALOR_MAO_OBRA"),
                            rs.getInt("COD_VEICULO_FK"),
                            rs.getInt("COD_MECANICO_FK")));
                }
                return ordemServicos;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }

        return null;
    }

    public List<OrdemServico> obterPorDescricao(String descricao) {
        if (descricao.equals("")) {
            return obterTodos();
        }
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.ORDEM_SERVICO OS, APP.MECANICO M, APP.CLIENTES C, APP.VEICULO V"
                        + " WHERE OS.COD_VEICULO_FK = V.COD_VEICULO AND "
                        + " V.COD_CLIENTE_FK = C.COD_CLIENTE AND "
                        + " OS.COD_MECANICO_FK = M.COD_MECANICO AND "
                        + " UPPER(OS.DESCRICAO) LIKE '%" + descricao.toUpperCase() + "%'";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                System.out.println(sql);
                List<OrdemServico> ordemServicos = new ArrayList<OrdemServico>();
                while (rs.next()) {
                    ordemServicos.add(new OrdemServico(
                            rs.getInt("COD_ORDEM_SERVICO"),
                            rs.getDate("DATA"),
                            rs.getString("DESCRICAO"),
                            rs.getDouble("VALOR_MAO_OBRA"),
                            rs.getInt("COD_VEICULO_FK"),
                            rs.getInt("COD_MECANICO_FK")));
                }
                return ordemServicos;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }
}
