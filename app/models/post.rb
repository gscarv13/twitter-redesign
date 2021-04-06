class Post < ApplicationRecord
  validates :text, presence: true, length: { minimum: 10, maximum: 200 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
