package conecta;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Bruno
 */
public class Conecta {

    private String DRIVER = "org.apache.derby.jdbc.ClientDriver";
    private String BD = "sample";
    private String URL = "jdbc:derby://localhost:1527/" + BD;
    private String USERNAME = "app";
    private String PASSWORD = "app";
    private Connection conexao;
    private Statement stm;
    private String msg;

    public Conecta() {
        this.msg = this.iniciaConexao();
    }

    public Conecta(String bd, String user, String senha) {
        this.BD = bd;
        this.USERNAME = user;
        this.PASSWORD = senha;
        this.msg = this.iniciaConexao();
    }


    public String iniciaConexao() {
        try {
            Class.forName(this.DRIVER);
            this.conexao = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            // Definimos o objeto responsável por executar os comandos
            this.stm = this.getConexao().createStatement();
            return "sucesso";
        } catch (ClassNotFoundException e) {
            this.conexao = null;
            return "N�o foi possivel encontrar o driver de banco: " + e.getMessage();
        } catch (SQLException e) {
            this.conexao = null;
            return "SQLException Erro!" + e.getMessage();
        }
    }

    public String fechaConexao() {
        try {
            if (this.getConexao() != null) {
                this.getConexao().close();
                this.conexao = null;
            }
            if (this.getStm() != null) {
                this.stm = null;
            }
            return "Conex�o Encerrada";
        } catch (SQLException ex) {
            return "Houve erro no fechamento da conex�o! " + ex.getMessage();
        }
    }

    public Connection getConexao() {
        return conexao;
    }

    public Statement getStm() {
        return stm;
    }

    public String getMsg() {
        return msg;
    }
}
