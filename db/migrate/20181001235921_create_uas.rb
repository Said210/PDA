class CreateUas < ActiveRecord::Migration
  def change
    create_table :uas do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
