class StatesController < ApplicationController
    def index
        @states = State.all
    end

    def show
        @state = State.find(params[:id])
    end

    def new
        @state = State.new
    end

    def create
        @state = State.new(state_params)

        if @state.valid?
            @state.save
            redirect_to @state
        else
            flash[:notice] = "É necessário preencher todos os campos."
            render :new
        end
    end

    def edit
        @state = State.find(params[:id])
    end

    def update
        @state = State.find(params[:id])
        @state.update(state_params)
        redirect_to @state
    end

    def destroy
        @state = State.find(params[:id])
        if excluir_state(@state)
            @state.destroy
            redirect_to states_path
        else
            puts "Não pode"
        end
    end

    private
    def state_params
        params.require(:state).permit(:tipo_status, :descricao_status)
    end

    private 
    def excluir_state(state)
        @contagem = 0
        @pedido_orcamentos = PedidoOrcamento.where(status_autorizacao: state.id)
        if @pedido_orcamentos.empty?
            @contagem += 1
        end

        @servicos = Servico.where(state_id: state.id)
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
