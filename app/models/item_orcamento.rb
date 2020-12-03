class ItemOrcamento < ApplicationRecord
    belongs_to :pedido_orcamento
    belongs_to :produto
end
