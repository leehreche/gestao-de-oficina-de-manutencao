class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.integer :cpf
      t.string :nome
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :telefone

      t.timestamps
    end
  end
end
