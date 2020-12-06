class CreatePedidoOrcamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :pedido_orcamentos do |t|
      t.integer :id_cliente
      t.integer :id_aparelho
      t.float :valor_mao_de_obra
      t.integer :status_autorizacao
      t.date :data
      t.integer :id_funcionario

      t.timestamps
    end
  end
end
