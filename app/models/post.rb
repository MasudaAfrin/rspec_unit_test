class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, allow_blank: false
  validates :view, numericality: { only_integer: true,
                                   greater_than_or_equal_to: 0 }
end
