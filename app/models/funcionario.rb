class Funcionario < ApplicationRecord
    validates :cpf, numericality: {only_integer: true}, presence: {message: 'Esse campo é requerido.'}
    validates :nome, presence: {message: 'Esse campo é requerido.'}
    validates :cargo, presence: {message: 'Esse campo é requerido.'}
end
