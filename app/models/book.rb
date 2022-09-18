class Book < ApplicationRecord
	validates :title, :author, :price, :published_date, presence: true
end
