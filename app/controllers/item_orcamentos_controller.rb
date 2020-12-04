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
    end

    def create
        @item_orcamento = ItemOrcamento.new(item_orcamento_params)
        @pedido_orcamento = PedidoOrcamento.find(@item_orcamento.pedido_orcamento_id)
        
        if remover_produto(@item_orcamento.produto_id, @item_orcamento.quantidade)
            if @item_orcamento.save 
                @pedido_orcamento = PedidoOrcamento.find(@item_orcamento.pedido_orcamento_id)
                redirect_to pedido_orcamento_item_orcamento_path(@pedido_orcamento, @item_orcamento)
                puts @item_orcamento
            else
                puts "Deu ruim"
            end
        else
            puts "OPS"
        end
        
    end

    def edit
        @item_orcamento = ItemOrcamento.find(params[:id])
        @pedido_orcamento = PedidoOrcamento.find(params[:pedido_orcamento_id])
        @produtos = Produto.all
    end

    def update
        @item_orcamento = ItemOrcamento.find(params[:id])  
        @quantidade_anterior = @item_orcamento.quantidade
        @quantidade_atual = params[:item_orcamento][:quantidade]
        
        if adicionar_produto(@item_orcamento.produto_id, @quantidade_anterior) && remover_produto(@item_orcamento.produto_id, @quantidade_atual.to_i)
            if @item_orcamento.update(item_orcamento_params)
                @pedido_orcamento = PedidoOrcamento.find(@item_orcamento.pedido_orcamento_id)
                redirect_to pedido_orcamento_item_orcamento_path(@pedido_orcamento, @item_orcamento)
                puts @item_orcamento
            else
                puts "Deu ruim"
            end
        else
            puts "OPS"
        end 
    end

    def destroy
        @item_orcamento = ItemOrcamento.find(params[:id])
        @pedido_orcamento = PedidoOrcamento.find(@item_orcamento.pedido_orcamento_id)
        
        if adicionar_produto(@item_orcamento.produto_id, @item_orcamento.quantidade)
            if @item_orcamento.destroy
                redirect_to pedido_orcamento_item_orcamentos_path(@pedido_orcamento)
            else
                puts "Deu ruim"
            end
        else
            puts "OPS"
        end       
    end

    private
    def item_orcamento_params
        params.require(:item_orcamento).permit(:produto_id, :pedido_orcamento_id, :quantidade)
    end

    private
    def adicionar_produto(produto_id, quantidade)
        @produto = Produto.find(produto_id)
        if @produto.update(quantidade: @produto.quantidade + quantidade)
            return true
        end
        false
    end

    private
    def remover_produto(produto_id, quantidade)
        @produto = Produto.find(produto_id)
        if @produto.update(quantidade: @produto.quantidade - quantidade)
            return true
        end
        false
    end
end
