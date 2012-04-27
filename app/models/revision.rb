class Revision < ActiveRecord::Base
  belongs_to :section

  before_save :sanitize_markup

  attr_accessible :comment, :markup, :section

  private

  def sanitize_markup
    # TODO: Sanitize the markup
  end
end
