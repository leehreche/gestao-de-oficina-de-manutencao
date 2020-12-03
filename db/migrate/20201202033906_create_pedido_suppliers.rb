class CreatePedidoSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :pedido_suppliers do |t|
      t.integer :id_fornecedor
      t.date :data
      t.integer :id_funcionario

      t.timestamps
    end
  end
end
