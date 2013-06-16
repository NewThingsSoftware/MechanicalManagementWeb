package daos;
import classes.PecaUsada;
import conecta.Conecta;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class PecaUsadaDAO {
    private Conecta conecta;
    
    public PecaUsadaDAO(){
        conecta = new Conecta();
    }
    
    public void incluir(PecaUsada pecaUsada){
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                if ("sucesso".equals(conecta.getMsg())) {
                    String sql = "INSERT INTO APP.PECA_USADA (COD_ORDEM_SERVICO_FK, COD_PECA_FK, QUANTIDADE)"
                            + " VALUES (" + pecaUsada.getCodOrdemServico() + "," + pecaUsada.getCodPeca()
                            + ", " + pecaUsada.getQuantidade() + " )";
                    conecta.getStm().execute(sql);
                } else {
                    System.out.println("erro:" + conecta.getMsg());
                }
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
    }
    
    public List<PecaUsada> obterPorOrdemServico(int codOrdemServico){
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT * FROM APP.PECA_USADA WHERE COD_ORDEM_SERVICO_FK = " + codOrdemServico;
                ResultSet rs = conecta.getStm().executeQuery(sql);
                List<PecaUsada> pecaUsadas = new ArrayList<PecaUsada>();
                while (rs.next()) {
                    pecaUsadas.add(new PecaUsada(
                            rs.getInt("COD_PECA_USADA"), 
                            rs.getInt("COD_ORDEM_SERVICO_FK"), 
                            rs.getInt("COD_PECA_FK"), 
                            rs.getInt("QUANTIDADE")));
                }
                return pecaUsadas;
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return null;
    }
    
    public double totalPagar(int codOrdemServico){
        if ("sucesso".equals(conecta.getMsg())) {
            try {
                String sql = "SELECT SUM(PU.QUANTIDADE*P.PRECO_VENDA) AS TOTAL FROM APP.PECA_USADA PU, APP.PECA P"
                        + " WHERE PU.COD_PECA_FK = P.COD_PECA AND"
                        + " COD_ORDEM_SERVICO_FK = " + codOrdemServico;
                ResultSet rs = conecta.getStm().executeQuery(sql);
                rs.next();
                return rs.getDouble("TOTAL");
            } catch (SQLException sql) {
                System.out.println(sql);
            }
        }
        return 0;
    }
}
