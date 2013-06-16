package classes;
public class Mecanico {
    
    private int codMecanico;
    private String nome, cpf, rg;

    public Mecanico() {
    }

    public Mecanico(String nome, String cpf, String rg) {
        this.nome = nome;
        this.cpf = cpf;
        this.rg = rg;
    }

    public Mecanico(int codMecanico, String nome, String cpf, String rg) {
        this.codMecanico = codMecanico;
        this.nome = nome;
        this.cpf = cpf;
        this.rg = rg;
    }

    public int getCodMecanico() {
        return codMecanico;
    }

    public void setCodMecanico(int codMecanico) {
        this.codMecanico = codMecanico;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }
    
}
