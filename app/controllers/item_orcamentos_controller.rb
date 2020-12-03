class ItemOrcamentosController < ApplicationController
    def index
        @pedido_orcamento = PedidoOrcamento.find(params[:pedido_orcamento_id])
        @item_orcamentos = ItemOrcamento.where(pedido_orcamento_id: params[:pedido_orcamento_id])
        @id_pedido = @pedido_orcamento.id
        @produtos = Produto.all
    end

    def show
        @item_orcamento = ItemOrcamento.find(params[:id])
        @produto = Produto.find(@item_orcamento.produto_id)
    end

    def new
        @item_orcamento = ItemOrcamento.new
        @produtos = Produto.all
        @pedido_orcamento = PedidoOrcamento.find(params[:pedido_orcamento_id])
        puts "Entrei no NEW"
    end

    def create
        puts "Entrei no CREATE1"
        @item_orcamento = ItemOrcamento.new(item_orcamento_params)
        @pedido_orcamento = PedidoOrcamento.find(@item_orcamento.pedido_orcamento_id)
        
        if @item_orcamento.save 
            @pedido_orcamento = PedidoOrcamento.find(@item_orcamento.pedido_orcamento_id)
            redirect_to pedido_orcamento_item_orcamento_path(@pedido_orcamento, @item_orcamento)
            puts @item_orcamento
        else
            puts "Deu ruim"
        end
    end

    def edit
        @item_orcamento = ItemOrcamento.find(params[:id])
        @pedido_orcamento = PedidoOrcamento.find(params[:pedido_orcamento_id])
        @produtos = Produto.all
    end

    def update
        @item_orcamento = ItemOrcamento.find(params[:id])        
        if @item_orcamento.update(item_orcamento_params)
            @pedido_orcamento = PedidoOrcamento.find(@item_orcamento.pedido_orcamento_id)
            redirect_to pedido_orcamento_item_orcamento_path(@pedido_orcamento, @item_orcamento)
            puts @item_orcamento
        else
            puts "Deu ruim"
        end
    end

    def destroy
        @item_orcamento = ItemOrcamento.find(params[:id])
        @pedido_orcamento = PedidoOrcamento.find(@item_orcamento.pedido_orcamento_id)
        if @item_orcamento.destroy
            redirect_to pedido_orcamento_item_orcamentos_path(@pedido_orcamento)
        else
            puts "Deu ruim"
        end
    end

    private
    def item_orcamento_params
        params.require(:item_orcamento).permit(:produto_id, :pedido_orcamento_id, :quantidade)
    end
end
