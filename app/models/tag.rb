class Tag < ApplicationRecord
    # has_many :posts, through: :taglinks
    has_and_belongs_to_many :posts
end
