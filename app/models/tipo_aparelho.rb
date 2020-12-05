class TipoAparelho < ApplicationRecord
    validates :nome, presence: {message: 'Esse campo é requerido.'}
    validates :prazo_manutencao, presence: {message: 'Esse campo é requerido.'}
end
