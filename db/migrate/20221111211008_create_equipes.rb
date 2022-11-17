class CreateEquipes < ActiveRecord::Migration[7.0]
  def change
    create_table :equipes do |t|
      t.string :nome
      t.string :tipo_escala
      t.references :unidade, null: false, foreign_key: true
      t.timestamps
    end
    create_table :turnos do |t|
      t.references :equipe, null: false, foreign_key: true
      t.integer :ordem, null: false
      t.time :hora_inicio, null: false
      t.time :hora_fim, null: false

      t.timestamps
    end        
  end
end
