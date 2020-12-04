class State < ApplicationRecord
    validates :descricao_status, presence: {message: 'Esse campo é requerido.'}
    validates :tipo_status, presence: {message: 'Esse campo é requerido.'}
end
