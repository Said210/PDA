class CreateImparts < ActiveRecord::Migration
  def change
    create_table :imparts do |t|
      t.references :professor#, index: true, foreign_key: true
      t.references :ua#, index: true, foreign_key: true
      t.integer:title

      t.timestamps null: false
    end
  end
end
