class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :cnpj
      t.string :razao_social
      t.string :nome_fantasia
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :telefone

      t.timestamps
    end
  end
end
