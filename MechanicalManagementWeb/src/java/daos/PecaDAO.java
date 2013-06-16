package daos;

import classes.Peca;
import conecta.Conecta;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PecaDAO {

    private Conecta conecta;

    public PecaDAO() {
        conecta = new Conecta();
    }

    public void incluirPeca(Peca peca) {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                if ("sucesso".equals(conecta.getMsg())) {
                    String sql = "INSERT INTO APP.PECA (DESCRICAO, PRECO_COMPRA, PRECO_VENDA)"
                            + " VALUES ('" + peca.getDescricao() + "'," + peca.getPrecoCompra()
                            + ", " + peca.getPrecoVenda() + " )";
                    conecta.getStm().execute(sql);
                } else {
                    System.out.println("erro:" + conecta.getMsg());
                }
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
    }

    public void alterarPeca(Peca peca) {
        try {
            if ("sucesso".equals(conecta.getMsg())) {
                String sql = "UPDATE APP.PECA SET DESCRICAO = '" + peca.getDescricao() + "', "
                        + " PRECO_COMPRA = " + peca.getPrecoCompra() + "', PRECO_VENDA = " + peca.getPrecoVenda()
                        + " WHERE COD_PECA = " + peca.getCodPeca();
                conecta.getStm().execute(sql);
            } else {
                System.out.println("erro:" + conecta.getMsg());
            }
        } catch (SQLException sql) {
            System.out.println(sql);
        }
    }

    public List<Peca> obterTodos() {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.PECA ORDER BY NOME";
                ResultSet rs = conecta.getStm().executeQuery(sql);
                List<Peca> peca = new ArrayList<Peca>();
                while (rs.next()) {
                    peca.add(new Peca(rs.getInt("COD_PECA"),
                            rs.getString("PRECO_COMPRA"),
                            rs.getDouble("PRECO_COMPRA"),
                            rs.getDouble("PECO_VENDA")));
                }
                return peca;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }

    public Peca obterPorCodigo(int codPeca) {
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.PECA WHERE COD_PECA = " + codPeca;
                ResultSet rs = conecta.getStm().executeQuery(sql);
                rs.next();
                Peca peca = new Peca(rs.getInt("COD_PECA"),
                        rs.getString("DESCRICAO"),
                        rs.getDouble("PRECO_COMPRA"),
                        rs.getDouble("PRECO_VENDA"));
                return peca;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }
}
