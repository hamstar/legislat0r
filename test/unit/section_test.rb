require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Section has a current revision" do
    b = Bill.new
    b.name = "test bill"
    b.save
    
    s = Section.new
    s.title = "test section"
    s.bill = b
    
    r1 = Revision.new
    r1.markup = "testing testing"
    r1.comment = "cool"
    r1.section = s    
    
    r2 = Revision.new
    r2.markup = "the current revision"
    r2.comment = "a new revision"
    r2.section = s

    s.revision = r2
    s.revisions << [r1, r2]
    s.save

    x = Section.find s.id
    assert x.revisions.count == 2, "expecting 2 but got #{x.revisions.count}"
    assert x.revision.markup == "the current revision", "the section did not save a current revision"
  end

end
