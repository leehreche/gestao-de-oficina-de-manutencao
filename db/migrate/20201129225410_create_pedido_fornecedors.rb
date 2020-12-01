class CreatePedidoFornecedors < ActiveRecord::Migration[6.0]
  def change
    create_table :pedido_fornecedors do |t|
      t.integer :id_fornecedor

      t.timestamps
    end
  end
end
