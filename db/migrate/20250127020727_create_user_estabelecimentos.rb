class CreateUserEstabelecimentos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_estabelecimentos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :estabelecimento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
