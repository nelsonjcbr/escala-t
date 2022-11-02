class CreateCidades < ActiveRecord::Migration[7.0]
  def change
    create_table :cidades do |t|
      t.string :nome
      t.references :uf, null: false, foreign_key: true
      t.integer :ibge

      t.timestamps
    end
  end
end
