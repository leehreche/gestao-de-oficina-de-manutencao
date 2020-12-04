class ProdutosController < ApplicationController
    def index
        @produtos = Produto.all
    end

    def show
        @produto = Produto.find(params[:id])
    end

    def new
        @produto = Produto.new
    end

    def create
        @produto = Produto.new(produto_params)
        @produto.save
        flash.now[:notice] = "Produto Cadastrado com sucesso!"
        redirect_to @produto
    end

    def edit
        @produto = Produto.find(params[:id])
    end

    def update
        @produto = Produto.find(params[:id])
        @produto.update(produto_params)
        redirect_to @produto
    end

    def destroy
        @produto = Produto.find(params[:id])
        @produto.destroy
        redirect_to produtos_path
    end

    private
    def produto_params
        params.require(:produto).permit(:descricao, :quantidade, :preco)
    end
end
