class Todo < ApplicationRecord
	validates_presence_of  :description, :message => " is required."
	belongs_to :user
end
