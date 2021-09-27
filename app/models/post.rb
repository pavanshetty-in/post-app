class Post < ApplicationRecord
    belongs_to :topic
    has_many :comments
    has_and_belongs_to_many :tags

    accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :all_blank

    validates :name, :topic_id, presence: true
end
