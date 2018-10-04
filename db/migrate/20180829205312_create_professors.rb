class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.string :lname
      t.string :lname2
      t.string :worker

      t.timestamps null: false
    end
  end
end
