package daos;

import classes.Veiculo;
import conecta.Conecta;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VeiculoDAO {
    
    private Conecta conecta;
    
    public VeiculoDAO(){
        conecta = new Conecta();
    }
    
    public void incluirVeiculo(Veiculo veiculo){
        
    }
    
    public void alterarVeiculo(Veiculo veiculo){
        
    }
    
    public List<Veiculo> obterTodos(){
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
            
}
