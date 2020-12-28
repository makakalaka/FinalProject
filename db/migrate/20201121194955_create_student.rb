class CreateStudent < ActiveRecord::Migration[6.0]
  def change
    create_table :student do |t|
      t.string :vardas
      t.integer :group_id
      t.string :pavarde
      t.string :slaptazodis
      t.string :elpastas
      t.string :gimimodata
      t.timestamps
    end
  end
end
