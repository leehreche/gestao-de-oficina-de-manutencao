class CreateItemOrcamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :item_orcamentos do |t|
      t.integer :produto_id
      t.integer :pedido_orcamento_id
      t.integer :quantidade

      t.timestamps
    end
  end
end
