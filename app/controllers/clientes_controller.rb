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
        @cliente.destroy
        redirect_to clientes_path
    end

    private
    def cliente_params
        params.require(:cliente).permit(:cpf, :nome, :endereco, :cidade, :estado, :telefone)
    end 
end
