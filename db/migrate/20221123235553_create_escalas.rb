class CreateEscalas < ActiveRecord::Migration[7.0]
  def change
    create_table :escalacmpts do |t|
      t.references :equipe, null: false, foreign_key: true
      t.integer :cmpt
      t.timestamps
    end
    create_table :escaladays do |t|
      t.references :escalacmpt, null: false, foreign_key: true
      t.date       :data, null: false
    end
    create_table :escalas do |t|
      t.references :escaladay, null: false, foreign_key: true
      t.references :turno, null: false, foreign_key: true
    end
    create_table :escalamembros do |t|
      t.references :escala, null: false, foreign_key: true
      t.references :membro, null: false, foreign_key: true
    end
  end
end
