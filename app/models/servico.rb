class Servico < ApplicationRecord
    validates :funcionario_cadastro_id, presence: {message: 'Esse campo é requerido.'}
    validates :pedido_orcamento_id, presence: {message: 'Esse campo é requerido.'}
    validates :tipo_aparelho_id, presence: {message: 'Esse campo é requerido.'}
    validates :descricao_servico, presence: {message: 'Esse campo é requerido.'}
    validates :state_id, presence: {message: 'Esse campo é requerido.'}
    validates :data, presence: {message: 'Esse campo é requerido.'}
end
