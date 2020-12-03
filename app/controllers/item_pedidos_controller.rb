class ItemPedidosController < ApplicationController

    @@id_pedido = 0

    def index
        @pedido_supplier = PedidoSupplier.find(params[:pedido_supplier_id])
        @item_pedidos = ItemPedido.where(id_pedido: params[:pedido_supplier_id])
        @@id_pedido = @pedido_supplier.id
        @produtos = Produto.all
    end

    def show
        @item_pedido = ItemPedido.find(params[:id])
        @produto = Produto.find(@item_pedido.id_produto)
    end

    def new
        @item_pedido = ItemPedido.new
        @produtos = Produto.all
        @id_pedido = @@id_pedido
        puts "Entrei no NEW"
    end

    def create
        puts "Entrei no CREATE1"
        @item_pedido = ItemPedido.new(item_pedido_params, @@id_pedido)
        puts "Entrei no CREATE"
        if @item_pedido.save 
            puts "Entrei no SAVE"      
            @pedido_supplier = PedidoSupplier.find(@@id_pedido)
            redirect_to pedido_supplier_item_pedidos_url(@pedido_supplier)
        else
            puts "Entrei no ELSE"
            render :new
        end
    end

    def edit
        @item_pedido = ItemPedido.find(params[:id])
        @produtos = Produto.all
    end

    def update
        @item_pedido = ItemPedido.find(params[:id])
        @item_pedido.update(item_pedido_params, @@id_pedido)
        redirect_to @item_pedido
    end

    def destroy
        @item_pedido = ItemPedido.find(params[:id])
        @item_pedido.destroy
        redirect_to item_pedidos_path
    end

    private
    def item_pedido_params
        params.require(:item_pedido).permit(:id_produto, :quantidade)
    end
end
