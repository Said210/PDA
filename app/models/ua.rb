class Ua < ActiveRecord::Base
    has_many :professors, :through => :imparts
    validates :nombre, presence: true
    
    def get_professors
       imparts = Impart.where("ua_id = ?", self.id);
       return imparts
    end
end
