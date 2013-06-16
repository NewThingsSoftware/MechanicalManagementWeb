package daos;

import classes.Veiculo;
import conecta.Conecta;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VeiculoDAO {

    private Conecta conecta;

    public VeiculoDAO() {
        conecta = new Conecta();
    }

    public void incluirVeiculo(Veiculo veiculo) {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                if ("sucesso".equals(conecta.getMsg())) {
                    String sql = "INSERT INTO APP.CLIENTES (PLACA, MARCA, MODELO, COD_CLIENTE_FK)"
                            + " VALUES ('" + veiculo.getPlaca() + "','" + veiculo.getMarca()
                            + "', '" + veiculo.getModelo() + "'"
                            + "', '" + veiculo.getCodCliente() + "' )";
                    conecta.getStm().execute(sql);
                    System.out.println(sql);
                } else {
                    System.out.println("erro:" + conecta.getMsg());
                }
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
    }

    public void alterarVeiculo(Veiculo veiculo) {
        try {
            if ("sucesso".equals(conecta.getMsg())) {
                String sql = "UPDATE APP.VEICULO SET PLACA = '" + veiculo.getPlaca() + "', "
                        + " MARCA = '" + veiculo.getMarca() + "',"
                        + " MODELO = '" + veiculo.getModelo() + "', COD_CLIENTE_FK = '" + veiculo.getCodCliente()
                        + "' WHERE COD_VEICULO = " + veiculo.getCodVeiculo();
                conecta.getStm().execute(sql);
            } else {
                System.out.println("erro:" + conecta.getMsg());
            }
        } catch (SQLException sql) {
            System.out.println(sql);
        }
    }

    public List<Veiculo> obterTodos() {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.VEICULO";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                List<Veiculo> veiculos = new ArrayList<Veiculo>();
                while (rs.next()) {
                    veiculos.add(new Veiculo(
                            rs.getInt("COD_VEICULO"),
                            rs.getString("PLACA"),
                            rs.getString("MARCA"),
                            rs.getString("MODELO"),
                            rs.getInt("COD_CLIENTE_FK")));
                }
                return veiculos;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }

    public Veiculo obterPorCodigo(int codVeiculo) {

        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.VEICULO WHERE COD_VEICULO = " + codVeiculo;
                ResultSet rs = conecta.getStm().executeQuery(sql);
                rs.next();
                Veiculo veiculo = new Veiculo(rs.getInt("COD_VEICULO"),
                        rs.getString("PLACA"),
                        rs.getString("MARCA"),
                        rs.getString("MODELO"),
                        rs.getInt("COD_CLIENTE_FK"));
                return veiculo;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }
}
