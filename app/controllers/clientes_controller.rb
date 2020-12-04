class ClientesController < ApplicationController
    def index
        @clientes = Cliente.all
    end

    def show
        @cliente = Cliente.find(params[:id])
    end

    def new
        @cliente = Cliente.new
    end

    def create
        @cliente = Cliente.new(cliente_params)
        @cliente.save
        redirect_to @cliente
    end

    def edit
        @cliente = Cliente.find(params[:id])
    end

    def update
        @cliente = Cliente.find(params[:id])
        @cliente.update(cliente_params)
        redirect_to @cliente
    end

    def destroy
        @cliente = Cliente.find(params[:id])

        if excluir_cliente(@cliente)
            @cliente.destroy
            redirect_to clientes_path
        else
            puts "Não pode"
        end
    end

    private
    def cliente_params
        params.require(:cliente).permit(:cpf, :nome, :endereco, :cidade, :estado, :telefone)
    end 

    private 
    def excluir_cliente(cliente)
        @pedido_orcamentos = PedidoOrcamento.where(id_cliente: cliente.id)
        if @pedido_orcamentos.empty?
            return true
        end
        return false
    end
end
