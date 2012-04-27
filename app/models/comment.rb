class Comment < ActiveRecord::Base
  belongs_to :section

  attr_accessible :comment, :email, :section_id, :username

end
