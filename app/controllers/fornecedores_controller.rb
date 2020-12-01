class FornecedoresController < ApplicationController
    def index
        @fornecedores = Fornecedor.all
    end

    def show
        @fornecedor = Fornecedor.find(params[:id])
    end

    def new
        @fornecedor = Fornecedor.new
    end

    def create
        @fornecedor = Fornecedor.new(fornecedor_params)
        @fornecedor.save
        redirect_to @fornecedor
    end

    def edit
        @fornecedor = Fornecedor.find(params[:id])
    end

    def update
        @fornecedor = Fornecedor.find(params[:id])
        @fornecedor.update(fornecedor_params)
        redirect_to @fornecedor
    end

    def destroy
        @fornecedor = Fornecedor.find(params[:id])
        @fornecedor.destroy
        redirect_to fornecedores_path
    end

    private
    def fornecedor_params
        params.require(:fornecedor).permit(:cnpj, :razao_social, :nome_fantasia, :endereco, :cidade, :estado, :telefone)
    end 
end
