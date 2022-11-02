class CreateEstabelecimentos < ActiveRecord::Migration[7.0]
  def change
    create_table :estabelecimentos do |t|
      t.string :nome
      t.string :cnpj
      t.string :cnes
      t.string :endereco
      t.string :end_numero
      t.string :complemento
      t.string :bairro
      t.references :uf, null: false, foreign_key: true
      t.references :cidade, null: false, foreign_key: true
      t.string :cep
      t.string :api_url
      t.string :api_usuario
      t.string :api_senha

      t.timestamps
    end
  end
end
