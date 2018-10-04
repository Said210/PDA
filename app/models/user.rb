class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         
  enum role: [:presidente, :profesor]
  
  def get_roles 
    return ["presidente", "profesor"]
  end
end
