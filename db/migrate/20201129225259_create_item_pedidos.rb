class CreateItemPedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :item_pedidos do |t|
      t.integer :produto_id
      t.integer :pedido_supplier_id
      t.integer :quantidade

      t.timestamps
    end
  end
end
