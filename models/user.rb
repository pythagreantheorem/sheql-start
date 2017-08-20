class User < ActiveRecord::Base
    has_many :works
    
     validates :username, presence: true, uniqueness: true, allow_blank: false
     validates :password, length: { in: 6..20 }
     validates :age, numericality: { only_integer: true }
     validates :age, numericality: { greater_than: 12 }
end
