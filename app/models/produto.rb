class Produto < ApplicationRecord
    validates :descricao, presence: {message: 'Esse campo é requerido.'}
    validates :quantidade, numericality: {only_integer: true}, presence: {message: 'Esse campo é requerido.'}
    validates :preco, numericality: true, presence: {message: 'Esse campo é requerido.'}

    has_many :item_pedidos
    has_many :pedido_suppliers, :through => :item_pedidos

    has_many :item_orcamentos
    has_many :pedido_orcamentos, :through => :item_orcamentos
end
