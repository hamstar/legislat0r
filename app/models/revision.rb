class Revision < ActiveRecord::Base
  belongs_to :section

  attr_accessible :comment, :markup, :section

  validates :section, :presence => true
end
