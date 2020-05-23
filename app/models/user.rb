class User < ActiveRecord::Base
    has_many :customers
    has_many :devices, through: :customers
    has_many :parts, through: :devices
    has_secure_password
end