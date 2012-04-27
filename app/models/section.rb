class Section < ActiveRecord::Base
  belongs_to :bill
  attr_accessible :parent_id, :title, :parent

  def initialize
  	@parent = Section.find :parent_id
  end

  def subsections
  	Section.find :conditions => [ "parent_id = ?", :parent_id ], :order => "title ASC"
  end
end
