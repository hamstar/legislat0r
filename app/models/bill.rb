class Bill < ActiveRecord::Base
  has_many :sections
  attr_accessible :name
end
