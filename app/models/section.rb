class Section < ActiveRecord::Base

  belongs_to :bill

  has_many :revisions
  has_many :comments
  belongs_to :revision

  attr_accessible :parent_id, :title, :parent, :bill_id, :bill, :revision

  validates :title, :presence => true
  validates :bill, :presence => true
  validates :revision, :presence => true

  def subsections
  	#Section.find :conditions => [ "parent_id = ?", self.id ], :order => "title ASC"
  	Array.new
  end

  def get_current_revision
  	revisions.order("created_at DESC").first
  end

  def last_edited
  	get_current_revision.created_at
  end

  def get_markup

  	if get_current_revision.blank?
      return ""
    end
    
    get_current_revision.markup
  end

  def current_revision(revision)
    self.current_revision_id = revision.id
  end

  def parent
    if parent_id.blank?
      return nil
    end

    Section.find parent_id
  end
end
