package classes;

public class Veiculo {

    private int codVeiculo;
    private String placa;
    private String marca;
    private String modelo;
    private int codCliente;

    public Veiculo() {
    }

    public Veiculo(String placa, String marca, String modelo, int codCliente) {
        this.placa = placa;
        this.marca = marca;
        this.modelo = modelo;
        this.codCliente = codCliente;
    }

    public Veiculo(int codVeiculo, String placa, String marca, String modelo, int codCliente) {
        this.codVeiculo = codVeiculo;
        this.placa = placa;
        this.marca = marca;
        this.modelo = modelo;
        this.codCliente = codCliente;
    }

    public int getCodVeiculo() {
        return codVeiculo;
    }

    public void setCodVeiculo(int codVeiculo) {
        this.codVeiculo = codVeiculo;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(int codCliente) {
        this.codCliente = codCliente;
    }
    
    
}
