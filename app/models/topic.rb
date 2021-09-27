class Topic < ApplicationRecord
    has_many :posts, dependent: :destroy


    validates :name, length: { minimum: 3 }
    validates :subtopic, presence: true
    
end
