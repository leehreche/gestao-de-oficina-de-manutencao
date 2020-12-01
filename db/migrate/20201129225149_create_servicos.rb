class CreateServicos < ActiveRecord::Migration[6.0]
  def change
    create_table :servicos do |t|
      t.integer :id_funcionario
      t.integer :id_pedido
      t.integer :id_aparelho
      t.string :descricao_servico
      t.integer :status_andamento

      t.timestamps
    end
  end
end
