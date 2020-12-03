class Produto < ApplicationRecord
    has_many :item_pedidos
    has_many :pedido_suppliers, :through => :item_pedidos

    has_many :item_orcamentos
    has_many :pedido_orcamentos, :through => :item_orcamentos
end
