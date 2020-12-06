class Cliente < ApplicationRecord
    validates :cpf, length: {is:11}, presence: {message: 'Esse campo é requerido.'}
    validates :nome, presence: {message: 'Esse campo é requerido.'}
    validates :endereco, presence: {message: 'Esse campo é requerido.'}
    validates :cidade, presence: {message: 'Esse campo é requerido.'}
    validates :estado, presence: {message: 'Esse campo é requerido.'}
    validates :telefone, presence: {message: 'Esse campo é requerido.'}
end
