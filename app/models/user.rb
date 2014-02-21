class User < ActiveRecord::Base

    has_many :endorsements
    has_many :recipes
    has_one :cookbook

end