class CreateServicos < ActiveRecord::Migration[6.0]
  def change
    create_table :servicos do |t|
      t.integer :funcionario_cadastro_id
      t.integer :pedido_orcamento_id
      t.integer :tipo_aparelho_id
      t.string :descricao_servico
      t.integer :state_id
      t.date :data

      t.timestamps
    end
  end
end