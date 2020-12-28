class CreateSemester < ActiveRecord::Migration[6.0]
  def change
    create_table :semester do |t|
      t.integer :group_id
      t.string :semestras
      t.string :tvarkarastis

      t.timestamps
    end
  end
end
