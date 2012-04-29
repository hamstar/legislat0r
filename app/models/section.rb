class Section < ActiveRecord::Base
  class HasNoRevision < StandardError
  end

  belongs_to :bill

  has_many :revisions
  has_many :comments

  attr_accessible :parent_id, :title, :parent, :bill_id

  before_save :check_has_revision

  validates :title, :presence => true
  validates :bill_id, :presence => true
  validates :bill_id, :numericality => true

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

  private

  # A section should always have a revision
  def check_has_revision
    revision = get_current_revision
    if revision.blank?
      revision = Revision.create({section: self, comment: "Section #{title} created"})
      current_revision = revision
      current_revision_id = revision.id
    end

    raise HasNoRevision unless revision.present? 
  end
end
