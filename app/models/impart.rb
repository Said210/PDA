class Impart < ActiveRecord::Base
  belongs_to :professor
  belongs_to :ua
  
  enum title: [:profesor, :ayudante_de_laboratorio]
  
   def get_titles
    return ["profesor", "ayudante_de_laboratorio"]
  end
end
