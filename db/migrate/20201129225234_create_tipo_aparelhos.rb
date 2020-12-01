class CreateTipoAparelhos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_aparelhos do |t|
      t.string :nome
      t.integer :prazo_manutencao

      t.timestamps
    end
  end
end
