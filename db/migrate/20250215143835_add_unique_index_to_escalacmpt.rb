class AddUniqueIndexToEscalacmpt < ActiveRecord::Migration[7.0]
  def change
    add_index :escalacmpts, %i[equipe_id cmpt], unique: true, name: 'index_escalacmpts_equipe_cmpt'
  end
end
