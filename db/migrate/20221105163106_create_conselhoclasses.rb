class CreateConselhoclasses < ActiveRecord::Migration[7.0]
  def change
    create_table :conselhoclasses do |t|
      t.string :sigla, null: false
      t.string :nome, null: false

      t.timestamps
    end
  end
end
