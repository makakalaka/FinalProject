class CreateGroup < ActiveRecord::Migration[6.0]
  def change
    create_table :group do |t|
      t.string :pavadinimas

      t.timestamps
    end
  end
end
