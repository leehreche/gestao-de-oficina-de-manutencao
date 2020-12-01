class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :descricao
      t.integer :quantidade
      t.float :preco

      t.timestamps
    end
  end
end
