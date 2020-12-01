class CreateStatus < ActiveRecord::Migration[6.0]
  def change
    create_table :status do |t|
      t.string :tipo_status
      t.string :descricao_status

      t.timestamps
    end
  end
end
