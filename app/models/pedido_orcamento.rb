class PedidoOrcamento < ApplicationRecord
    has_many :item_orcamentos
    has_many :produtos, :through => :item_orcamentos
end
