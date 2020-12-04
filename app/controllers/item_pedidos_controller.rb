class ItemPedidosController < ApplicationController

    def index
        @pedido_supplier = PedidoSupplier.find(params[:pedido_supplier_id])
        @item_pedidos = ItemPedido.where(pedido_supplier_id: params[:pedido_supplier_id])
        @id_pedido = @pedido_supplier.id
        @produtos = Produto.all
    end

    def show
        @item_pedido = ItemPedido.find(params[:id])
        @produto = Produto.find(@item_pedido.produto_id)
    end

    def new
        @item_pedido = ItemPedido.new
        @produtos = Produto.all
        @pedido_supplier = PedidoSupplier.find(params[:pedido_supplier_id])
    end

    def create
        @item_pedido = ItemPedido.new(item_pedido_params)
        @pedido_supplier = PedidoSupplier.find(@item_pedido.pedido_supplier_id)
        
        if @item_pedido.save 
            @pedido_supplier = PedidoSupplier.find(@item_pedido.pedido_supplier_id)
            redirect_to pedido_supplier_item_pedido_path(@pedido_supplier, @item_pedido)
            puts @item_pedido
        else
            puts "Deu ruim"
        end
    end

    def edit
        @item_pedido = ItemPedido.find(params[:id])
        @pedido_supplier = PedidoSupplier.find(params[:pedido_supplier_id])
        @produtos = Produto.all
    end

    def update
        @item_pedido = ItemPedido.find(params[:id])        
        if @item_pedido.update(item_pedido_params)
            @pedido_supplier = PedidoSupplier.find(@item_pedido.pedido_supplier_id)
            redirect_to pedido_supplier_item_pedido_path(@pedido_supplier, @item_pedido)
            puts @item_pedido
        else
            puts "Deu ruim"
        end
    end

    def destroy
        @item_pedido = ItemPedido.find(params[:id])
        @pedido_supplier = PedidoSupplier.find(@item_pedido.pedido_supplier_id)
        if @item_pedido.destroy
            redirect_to pedido_supplier_item_pedidos_path(@pedido_supplier)
        else
            puts "Deu ruim"
        end
    end

    private
    def item_pedido_params
        params.require(:item_pedido).permit(:produto_id, :pedido_supplier_id, :quantidade)
    end
end
