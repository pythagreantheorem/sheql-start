class User < ActiveRecord::Base
    has_many :works
    
     validates :email, presence: true
     validates :email, uniqueness: true
     validates :username, presence: true
     validates :username, uniqueness: true
     validates :password, length: { in: 6..20 }
     validates :age, numericality: { only_integer: true }
     validates :age, numericality: { greater_than: 12 }
end
