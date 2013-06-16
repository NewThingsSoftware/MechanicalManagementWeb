package classes;

public class PecaUsada {

    private int codPecaUsada, codOrdemServico, codPeca, quantidade;

    public PecaUsada() {
    }

    public PecaUsada(int codOrdemServico, int codPeca, int quantidade) {
        this.codOrdemServico = codOrdemServico;
        this.codPeca = codPeca;
        this.quantidade = quantidade;
    }

    public PecaUsada(int codPecaUsada, int codOrdemServico, int codPeca, int quantidade) {
        this.codPecaUsada = codPecaUsada;
        this.codOrdemServico = codOrdemServico;
        this.codPeca = codPeca;
        this.quantidade = quantidade;
    }

    public int getCodPecaUsada() {
        return codPecaUsada;
    }

    public void setCodPecaUsada(int codPecaUsada) {
        this.codPecaUsada = codPecaUsada;
    }

    public int getCodOrdemServico() {
        return codOrdemServico;
    }

    public void setCodOrdemServico(int codOrdemServico) {
        this.codOrdemServico = codOrdemServico;
    }

    public int getCodPeca() {
        return codPeca;
    }

    public void setCodPeca(int codPeca) {
        this.codPeca = codPeca;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
}
