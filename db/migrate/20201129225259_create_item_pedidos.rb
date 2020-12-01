class CreateItemPedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :item_pedidos do |t|
      t.integer :id_produto
      t.integer :id_pedido
      t.integer :quantidade

      t.timestamps
    end
  end
end
