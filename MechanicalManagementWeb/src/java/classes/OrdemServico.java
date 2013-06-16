package classes;

import java.util.Date;

public class OrdemServico {

    private int codOrdemServico;
    private Date data;
    private String descricao;
    private double valorMaoObra;
    private int codVeiculo;
    private int codMecanico;
    
    public OrdemServico(){
        
    }

    public OrdemServico(Date data, String descricao, double valorMaoObra, int codVeiculo, int codMecanico) {
        this.data = data;
        this.descricao = descricao;
        this.valorMaoObra = valorMaoObra;
        this.codVeiculo = codVeiculo;
        this.codMecanico = codMecanico;
    }

    public OrdemServico(int codOrdemServico, Date data, String descricao, double valorMaoObra, int codVeiculo, int codMecanico) {
        this.codOrdemServico = codOrdemServico;
        this.data = data;
        this.descricao = descricao;
        this.valorMaoObra = valorMaoObra;
        this.codVeiculo = codVeiculo;
        this.codMecanico = codMecanico;
    }

    public int getCodOrdemServico() {
        return codOrdemServico;
    }

    public void setCodOrdemServico(int codOrdemServico) {
        this.codOrdemServico = codOrdemServico;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getValorMaoObra() {
        return valorMaoObra;
    }

    public void setValorMaoObra(double valorMaoObra) {
        this.valorMaoObra = valorMaoObra;
    }

    public int getCodVeiculo() {
        return codVeiculo;
    }

    public void setCodVeiculo(int codVeiculo) {
        this.codVeiculo = codVeiculo;
    }

    public int getCodMecanico() {
        return codMecanico;
    }

    public void setCodMecanico(int codMecanico) {
        this.codMecanico = codMecanico;
    }
     
}
