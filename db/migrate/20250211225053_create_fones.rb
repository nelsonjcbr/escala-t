class CreateFones < ActiveRecord::Migration[7.0]
  def change
    create_table :fones do |t|
      t.references :user, null: false, foreign_key: true
      t.string :numero_ddd
      t.string :numero_telefone
      t.string :obs
      t.timestamps
    end
  end
end
