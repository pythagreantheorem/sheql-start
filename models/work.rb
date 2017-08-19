class Work < ActiveRecord::Base
    belongs_to :user
    
    validates :user_id, presence: true
    validates :name, presence: true
    validates :post, presence: true
    
end
