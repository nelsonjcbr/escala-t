class CreateMembros < ActiveRecord::Migration[7.0]
  def change
    create_table :membros do |t|
      t.references :equipe, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
