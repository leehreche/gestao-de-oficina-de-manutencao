class TipoAparelhosController < ApplicationController
    def index
        @tipo_aparelhos = TipoAparelho.all
    end

    def show
        @tipo_aparelho = TipoAparelho.find(params[:id])
    end

    def new
        @tipo_aparelho = TipoAparelho.new
    end

    def create
        @tipo_aparelho = TipoAparelho.new(tipo_aparelho_params)
        @tipo_aparelho.save
        redirect_to @tipo_aparelho
    end

    def edit
        @tipo_aparelho = TipoAparelho.find(params[:id])
    end

    def update
        @tipo_aparelho = TipoAparelho.find(params[:id])
        @tipo_aparelho.update(tipo_aparelho_params)
        redirect_to @tipo_aparelho
    end

    def destroy
        @tipo_aparelho = TipoAparelho.find(params[:id])
        if excluir_tipo_aparelho(@tipo_aparelho)
            @tipo_aparelho.destroy
            redirect_to tipo_aparelhos_path
        else
            puts "Não pode"
        end
    end

    private
    def tipo_aparelho_params
        params.require(:tipo_aparelho).permit(:nome, :prazo_manutencao)
    end

    private 
    def excluir_tipo_aparelho(tipo_aparelho)
        @contagem = 0
        @pedido_orcamentos = PedidoOrcamento.where(id_aparelho: tipo_aparelho.id)
        if @pedido_orcamentos.empty?
            @contagem += 1
        end

        @servicos = Servico.where(tipo_aparelho_id: tipo_aparelho.id)
        if @servicos.empty?
            @contagem += 1
        end

        if @contagem == 2
            return true
        else
            return false
        end
    end
end
