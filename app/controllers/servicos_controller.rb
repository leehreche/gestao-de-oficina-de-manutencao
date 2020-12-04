class ServicosController < ApplicationController
    def index
        @servicos = Servico.all
        @states = State.where(tipo_status: 'Andamento')
    end

    def show
        @servico = Servico.find(params[:id])
        @funcionario_cadastro = Funcionario.find(@servico.funcionario_cadastro_id)        
        @status_andamento = State.find(@servico.state_id)
        @tipo_aparelho = TipoAparelho.find(@servico.tipo_aparelho_id)

        if @servico.funcionario_responsavel_id != NIL
            @funcionario_responsabilidade = Funcionario.find(@servico.funcionario_responsavel_id)
        else
            @funcionario_responsabilidade = 0
        end
    end

    def new
        @servico = Servico.new
        @funcionarios = Funcionario.all
        @state_autorizado = State.where(descricao_status: 'Autorizado pelo Cliente')
        @pedido_orcamentos = PedidoOrcamento.where(status_autorizacao: @state_autorizado)
        @tipo_aparelhos = TipoAparelho.all
        @states = State.where(tipo_status: 'Andamento')
    end

    def create
        @servico = Servico.new(servico_params)
        @servico.save
        redirect_to @servico
    end

    def edit
        @servico = Servico.find(params[:id])
        @funcionarios = Funcionario.all
        @state_autorizado = State.where(descricao_status: 'Autorizado pelo Cliente')
        @pedido_orcamentos = PedidoOrcamento.where(status_autorizacao: @state_autorizado)
        @tipo_aparelhos = TipoAparelho.all
        @states = State.where(tipo_status: 'Andamento')
    end

    def update    
        @servico = Servico.find(params[:id])
        @servico.update(servico_params)
        redirect_to @servico
    end

    def destroy
        @servico = Servico.find(params[:id])
        @servico.destroy
        redirect_to servicos_path
    end

    def assumir
        @servico = Servico.find(params[:id])
        @funcionarios = Funcionario.all
    end

    def assumir_responsabilidade
        @servico = Servico.find(params[:id])
        @servico.update(funcionario_responsavel_id: params[:funcionario_responsabilidade_id])
        redirect_to @servico
    end

    private
    def servico_params
        params.require(:servico).permit(:funcionario_cadastro_id, :pedido_orcamento_id, :tipo_aparelho_id, :descricao_servico, :state_id, :data)
    end

    private
    def responsabilidade_params
        params.permit(:funcionario_responsabilidade_id)
    end
end
