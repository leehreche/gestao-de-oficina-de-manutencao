class Funcionario < ApplicationRecord
    validates :cpf, length: {is:11}, presence: {message: 'Esse campo é requerido.'}
    validates :nome, presence: {message: 'Esse campo é requerido.'}
    validates :cargo, presence: {message: 'Esse campo é requerido.'}
end
