class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :tipo_status
      t.string :descricao_status

      t.timestamps
    end
  end
end
