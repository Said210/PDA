class Professor < ActiveRecord::Base
    has_many :Ua, :through => :imparts
    validates :name, presence: true
    validates :lname, presence: true
  
    
    def get_uas
       imparts = Impart.where("professor_id = ?", self.id);
       return imparts
    end
    
    def impart ua, title
        i = Impart.new
        i.title = title
        i.professor = self
        i.ua = ua
        i.save
        return i
    end
end
