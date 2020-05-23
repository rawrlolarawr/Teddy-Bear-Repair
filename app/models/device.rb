class Device < ActiveRecord::Base
    belongs_to :customer
    has_many :parts
end