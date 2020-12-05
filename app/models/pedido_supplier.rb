class PedidoSupplier < ApplicationRecord
    validates :id_fornecedor, presence: {message: 'Esse campo é requerido.'}
    validates :data, presence: {message: 'Esse campo é requerido.'}
    validates :id_funcionario, presence: {message: 'Esse campo é requerido.'}
    
    has_many :item_pedidos
    has_many :produtos, :through => :item_pedidos
end

