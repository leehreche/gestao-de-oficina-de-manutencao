class Supplier < ApplicationRecord
    validates :cnpj, presence: {message: 'Esse campo é requerido.'}
    validates :razao_social, presence: {message: 'Esse campo é requerido.'}
    validates :nome_fantasia, presence: {message: 'Esse campo é requerido.'}
    validates :endereco, presence: {message: 'Esse campo é requerido.'}
    validates :cidade, presence: {message: 'Esse campo é requerido.'}
    validates :estado, presence: {message: 'Esse campo é requerido.'}
    validates :telefone, presence: {message: 'Esse campo é requerido.'}
end
