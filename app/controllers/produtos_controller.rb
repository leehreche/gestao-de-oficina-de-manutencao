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
        if excluir_produto(@produto)
            @produto.destroy
            redirect_to produtos_path
        else
            puts "Não pode"
        end
    end

    private
    def produto_params
        params.require(:produto).permit(:descricao, :quantidade, :preco)
    end

    private 
    def excluir_produto(produto)
        @contagem = 0
        @item_pedidos = ItemPedido.where(produto_id: produto.id)
        if @item_pedidos.empty?
            @contagem += 1
        end

        @item_orcamentos = ItemOrcamento.where(produto_id: produto.id)
        if @item_orcamentos.empty?
            @contagem += 1
        end

        if @contagem == 2
            return true
        else
            return false
        end
    end
end
