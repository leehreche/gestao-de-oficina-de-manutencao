class PedidoOrcamentosController < ApplicationController
    def index
        @pedido_orcamentos = PedidoOrcamento.all
        @clientes = Cliente.all
        @tipo_aparelhos = TipoAparelho.all
        @status_autorizacoes = State.where(tipo_status: 'Autorização')
        @funcionarios = Funcionario.all
    end

    def show
        @pedido_orcamento = PedidoOrcamento.find(params[:id])
        @cliente = Cliente.find(@pedido_orcamento.id_cliente)
        @tipo_aparelho = TipoAparelho.find(@pedido_orcamento.id_aparelho)
        @status_autorizacao = State.find(@pedido_orcamento.status_autorizacao)
        @funcionario = Funcionario.find(@pedido_orcamento.id_funcionario)
    end

    def new
        @pedido_orcamento = PedidoOrcamento.new
        @clientes = Cliente.all
        @tipo_aparelhos = TipoAparelho.all
        @status_autorizacoes = State.where(tipo_status: 'Autorização')
        @funcionarios = Funcionario.all
    end

    def create
        @pedido_orcamento = PedidoOrcamento.new(pedido_params)
        @pedido_orcamento.save
        redirect_to @pedido_orcamento
    end

    def edit
        @pedido_orcamento = PedidoOrcamento.find(params[:id])
        @clientes = Cliente.all
        @tipo_aparelhos = TipoAparelho.all
        @status_autorizacoes = State.where(tipo_status: 'Autorização')
        @funcionarios = Funcionario.all
    end

    def update
        @aprovado = 0

        @status_autorizado = State.where(descricao_status: 'Autorizado pelo Cliente')
        @pedido_orcamento = PedidoOrcamento.find(params[:id])
        @pedido_orcamento.update(pedido_params)

        if Integer(@pedido_orcamento.status_autorizacao) == Integer(@status_autorizado.ids[0])
            puts "********Chamar controler de servico#new"
            redirect_to new_servico_path
        else
            puts "********Falso"
            redirect_to @pedido_orcamento
        end
    end

    def destroy
        @pedido_orcamento = PedidoOrcamento.find(params[:id])
        @pedido_orcamento.destroy
        redirect_to pedido_orcamentos_path
    end

    private
    def pedido_params
        params.require(:pedido_orcamento).permit(:id_cliente, :id_aparelho, :valor_mao_de_obra, :status_autorizacao, :data, :id_funcionario)
    end
end
