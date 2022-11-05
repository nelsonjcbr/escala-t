class CreateUnidades < ActiveRecord::Migration[7.0]
  def change
    create_table :unidades do |t|
      t.string :nome
      t.references :estabelecimento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
