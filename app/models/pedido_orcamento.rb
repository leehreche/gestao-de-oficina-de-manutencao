class PedidoOrcamento < ApplicationRecord
    has_many :item_orcamentos
    has_many :produtos, :through => :item_orcamentos

    def pedido_com_id
        "Pedido - #{id}"
    end
end
