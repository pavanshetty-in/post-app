class Post < ApplicationRecord
    belongs_to :topic
    has_many :comments
    # has_many :tags, through: :taglinks
    has_and_belongs_to_many :tags

    accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :all_blank
end
