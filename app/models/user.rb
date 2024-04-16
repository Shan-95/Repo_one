class User < ApplicationRecord
	validates :email, :name, :phone, presence: true
	has_many :notifications
end
