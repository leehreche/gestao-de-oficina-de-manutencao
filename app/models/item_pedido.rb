class ItemPedido < ApplicationRecord
    belongs_to :pedido_supplier
    belongs_to :produto
end
