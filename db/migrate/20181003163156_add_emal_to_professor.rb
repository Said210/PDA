class AddEmalToProfessor < ActiveRecord::Migration
  def change
    add_column :professors, :email, :string
    add_column :professors, :phone, :string
  end
end
