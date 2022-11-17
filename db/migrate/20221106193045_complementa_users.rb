class ComplementaUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cpf, :string, null: false
    add_column :users, :nome_chamado, :string
    add_column :users, :sexo, :string
    add_column :users, :profissao, :string
    add_reference :users, :conselhoclass, foreign_key: true
    add_column :users, :numero_conselho, :string
    add_reference :users, :uf_conselho, foreign_key: { to_table: :ufs}
    add_index :users, :cpf, unique: true 
  end
end
