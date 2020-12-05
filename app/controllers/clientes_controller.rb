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

        if @cliente.valid?
            @cliente.save
            redirect_to @cliente
        else
            flash.now[:notice] = "É necessário preencher todos os campos."
            render :new
        end
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
            flash[:notice] = "Não é possível excluir o cliente #{@cliente.nome}. Há dependências."
            redirect_to clientes_path
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
