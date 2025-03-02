class CreateUserIndisps < ActiveRecord::Migration[7.0]
  def change
    create_table :user_indisps do |t|
      t.references :user, null: false, foreign_key: true
      t.date :data_inicio
      t.date :data_fim
      t.string :dia_semana
      t.time :hora_inicio
      t.time :hora_fim
      t.string :obs
      t.timestamps
    end
  end
end
