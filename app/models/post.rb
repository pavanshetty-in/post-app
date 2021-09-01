class Post < ApplicationRecord
    belongs_to :topic
    has_many :comments
    # has_many :tags, through: :taglinks
    has_and_belongs_to_many :tags
end
