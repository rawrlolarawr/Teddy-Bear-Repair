class Customer < ActiveRecord::Base
    belongs_to :user
    has_many :devices
    has_many :parts, through: :devices
end