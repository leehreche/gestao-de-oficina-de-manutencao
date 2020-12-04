class EstoqueController < ApplicationController
    def estoque
    end

    def saida_estoque
        @item_orcamentos = ItemOrcamento.all 
        @pedido_orcamentos = PedidoOrcamento.all
        @produtos = Produto.all
    end

    def entrada_estoque
        @item_pedidos = ItemPedido.all 
        @pedido_suppliers = PedidoSupplier.all
        @produtos = Produto.all 
    end
end
