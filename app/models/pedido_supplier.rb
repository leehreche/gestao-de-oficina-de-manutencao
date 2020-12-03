class PedidoSupplier < ApplicationRecord
    has_many :item_pedidos
    has_many :produtos, :through => :item_pedidos
end

