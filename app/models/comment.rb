class Comment < ApplicationRecord
    belongs_to :post

    validates :comment, :post_id, presence: true
end
