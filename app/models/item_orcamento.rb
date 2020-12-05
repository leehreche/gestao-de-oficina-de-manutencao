class ItemOrcamento < ApplicationRecord
    validates :produto_id, presence: {message: 'Esse campo é requerido.'}
    validates :pedido_orcamento_id, presence: {message: 'Esse campo é requerido.'}
    validates :quantidade, numericality: {only_integer: true}, presence: {message: 'Esse campo é requerido.'}
    
    belongs_to :pedido_orcamento
    belongs_to :produto
end
