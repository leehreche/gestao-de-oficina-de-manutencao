class PedidoOrcamento < ApplicationRecord
    validates :id_cliente, presence: {message: 'Esse campo é requerido.'}
    validates :id_aparelho, presence: {message: 'Esse campo é requerido.'}
    validates :valor_mao_de_obra, numericality: true, presence: {message: 'Esse campo é requerido.'}
    validates :status_autorizacao, presence: {message: 'Esse campo é requerido.'}
    validates :data, presence: {message: 'Esse campo é requerido.'}
    validates :id_funcionario, presence: {message: 'Esse campo é requerido.'}

    has_many :item_orcamentos
    has_many :produtos, :through => :item_orcamentos

    def pedido_com_id
        "Pedido - #{id}"
    end
end
