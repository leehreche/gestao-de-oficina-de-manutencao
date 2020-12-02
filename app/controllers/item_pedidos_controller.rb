class ItemPedidosController < ApplicationController
    def index
        @item_pedidos = ItemPedido.all
        @produtos = Produto.all
    end

    def show
        @item_pedido = ItemPedido.find(params[:id])
        @produto = Produto.find(@item_pedido.id_produto)
    end

    def new
        @item_pedido = ItemPedido.new
        @produtos = Produto.all
    end

    def create
        @item_pedido = ItemPedido.new(item_pedido_params)
        @item_pedido.save
        redirect_to @item_pedido
    end

    def edit
        @item_pedido = ItemPedido.find(params[:id])
        @produtos = Produto.all
    end

    def update
        @item_pedido = ItemPedido.find(params[:id])
        @item_pedido.update(item_pedido_params)
        redirect_to @item_pedido
    end

    def destroy
        @item_pedido = ItemPedido.find(params[:id])
        @item_pedido.destroy
        redirect_to item_pedidos_path
    end

    private
    def item_pedido_params
        params.require(:item_pedido).permit(:id_produto, :id_pedido, :quantidade)
    end

    private
    def pedido_params
        params_pedido.require(:pedido_orcamento).permit(:id)
    end
end
