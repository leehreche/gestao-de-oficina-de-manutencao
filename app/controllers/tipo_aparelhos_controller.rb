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
        if @tipo_aparelho.valid?
            @tipo_aparelho.save
            redirect_to @tipo_aparelho
        else
            flash.now[:notice] = "É necessário preencher todos os campos."
            render :new
        end
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
            flash[:notice] = "Não é possível excluir o tipo de aparelho #{@tipo_aparelho.nome}. Há dependências."
            redirect_to tipo_aparelhos_path
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
