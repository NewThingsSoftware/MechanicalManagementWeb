package daos;

import classes.Mecanico;
import conecta.Conecta;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MecanicoDAO {

    private Conecta conecta;

    public MecanicoDAO() {
        conecta = new Conecta();
    }

    public void incluirMecanico(Mecanico mecanico) {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                if ("sucesso".equals(conecta.getMsg())) {
                    String sql = "INSERT INTO APP.MECANICO (NOME, CPF, RG)"
                            + " VALUES ('" + mecanico.getNome() + "','" + mecanico.getCpf()
                            + "', '" + mecanico.getRg() + "' )";
                    conecta.getStm().execute(sql);
                } else {
                    System.out.println("erro:" + conecta.getMsg());
                }
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
    }

    public void alterarMecanico(Mecanico mecanico) {
        try {
            if ("sucesso".equals(conecta.getMsg())) {
                String sql = "UPDATE APP.MECANICO SET NOME = '" + mecanico.getNome() + "', "
                        + " CPF = '" + mecanico.getCpf() + "', RG = '" + mecanico.getRg()
                        + "' WHERE COD_MECANICO = " + mecanico.getCodMecanico();
                System.out.println(sql);
                conecta.getStm().execute(sql);
            } else {
                System.out.println("erro:" + conecta.getMsg());
            }
        } catch (SQLException sql) {
            System.out.println(sql);
        }
    }

    public List<Mecanico> obterTodos() {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.MECANICO ORDER BY NOME";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                List<Mecanico> mecanico = new ArrayList<Mecanico>();
                while (rs.next()) {
                    mecanico.add(new Mecanico(rs.getInt("COD_MECANICO"),
                            rs.getString("NOME"),
                            rs.getString("CPF"),
                            rs.getString("RG")));
                }
                return mecanico;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }

    public Mecanico obterPorCodigo(int codMecanico) {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.MECANICO WHERE COD_MECANICO = " + codMecanico;
                ResultSet rs = conecta.getStm().executeQuery(sql);
                rs.next();
                Mecanico mecanico = new Mecanico(rs.getInt("COD_MECANICO"),
                        rs.getString("NOME"),
                        rs.getString("CPF"),
                        rs.getString("RG"));
                return mecanico;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }
    
    public List<Mecanico> obterPorNome(String nome) {
        if (nome.equals("")) {
            return obterTodos();
        }
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.MECANICO WHERE UPPER(NOME) LIKE '%" + nome.toUpperCase() + "%' ORDER BY NOME";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                System.out.println(sql);
                List<Mecanico> mecanicos = new ArrayList<Mecanico>();
                while (rs.next()) {
                    mecanicos.add(new Mecanico(
                            rs.getInt("COD_MECANICO"),
                            rs.getString("NOME"),
                            rs.getString("CPF"),
                            rs.getString("RG")));
                }
                return mecanicos;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }
}
