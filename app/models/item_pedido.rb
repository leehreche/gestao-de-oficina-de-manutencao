class ItemPedido < ApplicationRecord
    belongs_to :pedido_orcamento
    belongs_to :pedido_supplier
end
